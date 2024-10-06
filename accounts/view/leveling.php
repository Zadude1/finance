<!DOCTYPE html>
<html>
<head>
    <title>Search Students</title>
    <link rel="stylesheet" href="../css/stylee.css">
    <script>
        function toggleSelectAll(source) {
            checkboxes = document.getElementsByName('selected_ids[]');
            for(var i in checkboxes) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>
</head>
<body>
  
    <form method="GET" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <label for="id_col">Enter Student id_col:</label>
        <input type="text" id="id_col" name="id_col">
        <label for="id_l">Enter Status id_l:</label>
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
        $sql = "SELECT student_info.id_col, student_info.name, student_info.code, status_info.year, status_info.id_st
        FROM student_info
        INNER JOIN status_info ON student_info.id_col = $id_col AND status_info.id_l = $id_l
        WHERE student_info.id_col = $id_col AND status_info.id_l = $id_l AND status_info.status = 1 GROUP BY status_info.id_st
"
        
        ;


        $result = $conn->query($sql);

        // Display table
        if ($result->num_rows > 0) {
            echo "<br><br><form id='statusForm' method='POST' action='../php/process_selected.php'><table class='custom-table'><tr><th><input type='checkbox' onclick='toggleSelectAll(this)'></th><th>Name</th><th>Code</th><th>Year</th><th>id_st</th></tr>";
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "<tr><td><input type='checkbox' name='selected_ids[]' value='".$row['id_st']."'></td><td>".$row["name"]."</td><td>".$row["code"]."</td><td>".$row["year"]."</td><td>".$row["id_st"]."</td></tr>";
            }
            echo "</table><br><input type='button' value='ترحيل الى الاعلى' onclick='submitForm()'>
            </table><br><input type='button' value='ترحيل الة الادنى' onclick='submitFormlow()'></form>";

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

        $conn->close();
    }
    ?>

</body>
</html>