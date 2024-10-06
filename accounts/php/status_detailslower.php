<?php session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Status Details</title>
    <link rel="stylesheet" href="stylee.css">
</head>
<body>
    <h2>Status Details</h2>

    <?php
    // PHP code for displaying status details and inserting selected id_st values
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['selected_ids'])) {
        // Database connection
        include "../php/env/db.php";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        $editor_name = $conn->real_escape_string($_SESSION['username']);
        $currentDateTime = date('Y-m-d H:i:s');

        // Check connection
        

        // Retrieve selected id_st values
        $selected_ids = $_POST['selected_ids'];

        // Check if $selected_ids is an array
        if (is_array($selected_ids) && !empty($selected_ids)) {
            // Protect against SQL injection
            $safe_selected_ids = array_map(function($id) use ($conn) {
                return $conn->real_escape_string($id);
            }, $selected_ids);

            // Update status to zero for the selected values
            $updateSql = "UPDATE status_info SET status = 0 WHERE id_st IN (" . implode(",", $safe_selected_ids) . ")";
            if ($conn->query($updateSql) === TRUE) {
                // Construct the SQL query to insert selected id_st values into status_info table with status = 1
                $sql_insert = "INSERT INTO status_info (id_s, id_l, level_num, date, status, year, adder_name, create_date, updater_user, update_date)
                               SELECT id_s, id_l - 1, level_num, date, 1, year, adder_name, create_date, '$editor_name', '$currentDateTime'
                               FROM status_info
                               WHERE id_st IN (" . implode(",", $safe_selected_ids) . ")";

                if ($conn->query($sql_insert) === TRUE) {
                    echo "<p>Selected statuses inserted into status_info table successfully with status = 1.</p>";
                } else {
                    echo "Error: " . $sql_insert . "<br>" . $conn->error;
                }
            } else {
                echo "Error updating records: " . $conn->error;
            }
        } else {
            echo "No valid selected_ids received.";
        }

        $conn->close();
    } elseif ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['insert_status'])) {
        // Handling the insertion process
        if (isset($_POST['selected_ids'])) {
            // Database connection
            $servername = "localhost";
            $username = "root"; // Replace with your database username
            $password = ""; // Replace with your database password
            $dbname = "accounting"; // Replace with your database name

            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);
            $editor_name = $conn->real_escape_string($_SESSION['username']);
            $currentDateTime = date('Y-m-d H:i:s');

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Retrieve selected id_st values from hidden input
            $selected_ids = json_decode($_POST['selected_ids'], true);

            // Protect against SQL injection
            $safe_selected_ids = array_map(function($id) use ($conn) {
                return $conn->real_escape_string($id);
            }, $selected_ids);

            // Update status to zero for the selected values
            $updateSql = "UPDATE status_info SET status = 0 WHERE id_st IN (" . implode(",", $safe_selected_ids) . ")";
            if ($conn->query($updateSql) === TRUE) {
                // Construct the SQL query to insert selected id_st values into status_info table with status = 1
                $sql_insert = "INSERT INTO status_info (id_s, id_l, level_num, date, status, year, adder_name, create_date, updater_user, update_date)
                               SELECT id_s, id_l - 1, level_num, date, 1, year, adder_name, create_date, '$editor_name', '$currentDateTime'
                               FROM status_info
                               WHERE id_st IN (" . implode(",", $safe_selected_ids) . ")";

                if ($conn->query($sql_insert) === TRUE) {
                    echo "<p>Selected statuses inserted into status_info table successfully with status = 1.</p>";
                } else {
                    echo "Error: " . $sql_insert . "<br>" . $conn->error;
                }
            } else {
                echo "Error updating records: " . $conn->error;
            }

            $conn->close();
        }
    } else {
        // Display form and search results
        ?>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
            <table>
                <tr>
                    <th>Select</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Year</th>
                    <th>id_st</th>
                </tr>

                <?php
                // Database connection
                $servername = "localhost";
                $username = "root"; // Replace with your database username
                $password = ""; // Replace with your database password
                $dbname = "accounting"; // Replace with your database name

                // Create connection
                $conn = new mysqli($servername, $username, $password, $dbname);

                // Check connection
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // SQL query to fetch data from student_info and status_info tables
                $sql = "SELECT student_info.id_col, student_info.name, student_info.code, status_info.year, status_info.id_st
                        FROM student_info
                        INNER JOIN status_info ON student_info.id_col = status_info.id_st";

                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td><input type='checkbox' name='selected_ids[]' value='" . $row['id_st'] . "'></td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['code'] . "</td>";
                        echo "<td>" . $row['year'] . "</td>";
                        echo "<td>" . $row['id_st'] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='5'>No records found</td></tr>";
                }

                $conn->close();
                ?>
            </table>
            <br>
            <input type="submit" name="insert_status" value="Insert Selected into status_info">
        </form>
        <?php
    }
    ?>

</body>
</html>
