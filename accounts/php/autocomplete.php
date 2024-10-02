<?php
// Establish a connection to your database
$servername = "localhost";
$username = "root";
$password = ""; // Empty password
$dbname = "accounting";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve suggestions from the database based on the input term
$input = $conn->real_escape_string($_GET['term']); // Escape input to prevent SQL injection
$query = "SELECT DISTINCT from_per FROM receipt WHERE from_per LIKE '%$input%'";
$result = $conn->query($query);

// Check for errors
if (!$result) {
    die("Query failed: " . $conn->error);
}

// Prepare an array to hold the suggestions
$suggestions = array();

// Fetch suggestions and add them to the array
while ($row = $result->fetch_assoc()) {
    $suggestions[] = $row['from_per'];
}

// Output suggestions as JSON
echo json_encode($suggestions);

// Close connection
$conn->close();
?>
