<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style.css">

    <title>Search and Display Records</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        table, th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        $(document).ready(function(){
            $('#search_term').keyup(function(){
                var search_term = $(this).val();
                $.ajax({
                    url: 'search_records.php',
                    method: 'GET',
                    data: { search_term: search_term },
                    success: function(response){
                        $('#search_results').html(response);
                    }
                });
            });

            $(document).on('click', '.delete-btn', function(){
                var id = $(this).data('id');
                if (confirm('Are you sure you want to delete this record?')) {
                    $.ajax({
                        url: '../php/delete_record.php',
                        method: 'POST',
                        data: { id: id },
                        success: function(response){
                            alert(response);
                            location.reload(); // Reload the page
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <h2>Search and Display Records</h2>
    <label>Search by any value in any column:</label>
    <input type="text" id="search_term" name="search_term" placeholder="Enter search term">
    <br><br>
    <h3>Latest 30 Records</h3>
    <div id="search_results">
        <?php
        // Establish database connection
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "accounting";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // SQL query to fetch latest 30 records
        $sql = "SELECT * FROM daily_record ORDER BY added_date DESC LIMIT 30";

        // Execute SQL query
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>ID</th><th>from_per</th><th>Money</th><th>Date In</th><th>Type</th><th>Note</th><th>Action</th></tr>";
            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>".$row['id_dc']."</td>";
                echo "<td>".$row['from_per']."</td>";
                echo "<td>".$row['money']."</td>";
                echo "<td>".$row['data_in']."</td>";
                echo "<td>".$row['type']."</td>";
                echo "<td>".$row['note']."</td>";
                echo "<td><button class='delete-btn' data-id='".$row['id_dc']."'>Delete</button></td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "0 results";
        }
        $conn->close();  // Close the database connection
        ?>
    </div>
</body>
</html>
