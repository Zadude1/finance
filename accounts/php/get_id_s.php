<?php
// Check if receivedFrom parameter is set
if (isset($_GET['receivedFrom'])) {
    // Extract receivedFrom value
    $receivedFrom = $_GET['receivedFrom'];

    // Database connection parameters
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

    // Escape receivedFrom to prevent SQL injection
    $receivedFrom = $conn->real_escape_string($receivedFrom);

    // Query to retrieve id_s based on receivedFrom
    $sql = "SELECT id_s FROM student_info WHERE name LIKE '%$receivedFrom%'";

    // Execute query
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Fetch the first row as we expect only one result
        $row = $result->fetch_assoc();
        $id_s = $row['id_s'];

        // Return id_s as JSON response
        echo json_encode(array('id_s' => $id_s));
    } else {
        // If no rows found, return empty response or error message
        echo json_encode(array('id_s' => null));
    }

    // Close database connection
    $conn->close();
} else {
    // Handle error if receivedFrom parameter is not set
    echo json_encode(array('error' => 'Parameter receivedFrom is not set'));
}
?>
