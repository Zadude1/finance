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

// Process search term
$search_term = $_GET['search_term'];

// SQL query to search by any column that contains the search term
$sql = "SELECT * FROM daily_record WHERE ";
$sql .= "id_dc LIKE '%$search_term%' OR ";
$sql .= "number LIKE '%$search_term%' OR ";
$sql .= "money LIKE '%$search_term%' OR ";
$sql .= "data_in LIKE '%$search_term%' OR ";
$sql .= "type LIKE '%$search_term%' OR ";
$sql .= "note LIKE '%$search_term%' OR ";
$sql .= "from_per LIKE '%$search_term%' OR ";
$sql .= "write_mo LIKE '%$search_term%' OR ";
$sql .= "id_u LIKE '%$search_term%' OR ";
$sql .= "name LIKE '%$search_term%' OR ";
$sql .= "id_col LIKE '%$search_term%' OR ";
$sql .= "id_s LIKE '%$search_term%' OR ";
$sql .= "e_number LIKE '%$search_term%' OR ";
$sql .= "e_date LIKE '%$search_term%' OR ";
$sql .= "year_r LIKE '%$search_term%' OR ";
$sql .= "in_number LIKE '%$search_term%' OR ";
$sql .= "in_date LIKE '%$search_term%' OR ";
$sql .= "in_amount LIKE '%$search_term%' OR ";
$sql .= "adder_name LIKE '%$search_term%' OR ";
$sql .= "added_date LIKE '%$search_term%' OR ";
$sql .= "updater_name LIKE '%$search_term%' OR ";
$sql .= "updated_date LIKE '%$search_term%'";

// Execute SQL query
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h3>Search Results</h3>";
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
    echo "No matching records found";
}

$conn->close();  // Close the database connection
?>
