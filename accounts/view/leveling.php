<!DOCTYPE html>
<html>
<head>
    <title>Search Students</title>
    <link rel="stylesheet" href="../css/stylee.css">
    <script>
        function toggleSelectAll(source) {
            const checkboxes = document.getElementsByName('selected_ids[]');
            for (let i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>
</head>
<body>
  
    <form method="GET" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
        <label for="id_col">الكلية</label>
        <input type="text" id="id_col" name="id_col">
        <label for="id_l">المرحلة:</label>
        <input type="text" id="id_l" name="id_l">
        <input type="submit" value="Search"><br><br>
    </form>

    <?php
    // PHP code for displaying search results
    if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id_col']) && isset($_GET['id_l'])) {
        // Database connection
        include "../php/env/db.php";

        // Retrieve values based on inputs
        $id_col = $_GET['id_col'];
        $id_l = $_GET['id_l'];

        // Updated SQL Query
        $sql = "SELECT student_info.id_col, student_info.name, student_info.code, status_info.year, MAX(status_info.id_st) as latest_id_st
                FROM student_info
                INNER JOIN status_info ON student_info.id_col = student_info.id_col
                WHERE student_info.id_col = ? AND status_info.id_l = ? AND status_info.status = 1
                GROUP BY student_info.id_col, student_info.name, student_info.code, status_info.year";

        // Prepare the statement
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            die("Prepare failed: " . $conn->error);
        }

        // Bind parameters
        $stmt->bind_param("ss", $id_col, $id_l);
        
        // Execute the statement
        if (!$stmt->execute()) {
            die("Execute failed: " . $stmt->error);
        }
        
        // Get the result
        $result = $stmt->get_result();

        // Display table
        if ($result->num_rows > 0) {
            echo "<br><br><form id='statusForm' method='POST' action='../php/process_selected.php'><table class='custom-table'><tr><th><input type='checkbox' onclick='toggleSelectAll(this)'></th><th>Name</th><th>Code</th><th>Year</th><th>Latest ID</th></tr>";
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr><td><input type='checkbox' name='selected_ids[]' value='".$row['latest_id_st']."'></td><td>".$row["name"]."</td><td>".$row["code"]."</td><td>".$row["year"]."</td><td>".$row["latest_id_st"]."</td></tr>";
            }
            echo "</table><br><input type='button' value='ترحيل الى الاعلى' onclick='submitForm()'>
            <br><input type='button' value='ترحيل الة الادنى' onclick='submitFormlow()'></form>";

            echo "<script>
                    function submitForm() {
                        document.getElementById('statusForm').action = '../php/status_details.php';
                        document.getElementById('statusForm').submit();
                    }
                  </script>";
            echo "<script>
                    function submitFormlow() {
                        document.getElementById('statusForm').action = '../php/status_detailslower.php';
                        document.getElementById('statusForm').submit();
                    }
                  </script>";
                  
        } else {
            echo "No results found.";
        }

        $stmt->close();
        $conn->close();
    }
    ?>

</body>
</html>
