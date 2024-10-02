<?php
// Mock database function to get names based on input
function getNamesFromDatabase($input) {
    // Replace this with your actual database connection and query logic
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

    $input = $conn->real_escape_string($input);

    $sql = "SELECT name FROM student_info WHERE name LIKE '%$input%'";
    $result = $conn->query($sql);

    $names = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $names[] = $row['name'];
        }
    }

    $conn->close();
    return $names;
}

// Main script
$input = isset($_GET['input']) ? $_GET['input'] : '';
$names = getNamesFromDatabase($input);
echo json_encode($names);
?>
