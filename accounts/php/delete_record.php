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

// Process POST data (ID to delete)
$id = $_POST['id'];

// SQL query to delete record
$sql = "DELETE FROM daily_record WHERE id_dc = $id";

if ($conn->query($sql) === TRUE) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();  // Close the database connection
?>
