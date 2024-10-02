<?php
// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "accounting";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle add row request
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["add_row"])) {
    $id_r_value = mysqli_real_escape_string($conn, $_GET["id_r"]); // Assuming you're passing id_r through GET
    $sql_insert = "INSERT INTO receipt_detal (id_r) VALUES ('$id_r_value')";
    if ($conn->query($sql_insert) === TRUE) {
        $last_id = $conn->insert_id;
        echo $last_id; // Return the ID of the newly inserted row
    } else {
        echo "Error adding new row: " . $conn->error;
    }
    exit; // Stop script execution after adding a row
}

// Handle delete row request
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["delete_id"])) {
    $delete_id = mysqli_real_escape_string($conn, $_GET["delete_id"]);
    $sql_delete = "DELETE FROM receipt_detal WHERE id_d = '$delete_id'";
    if ($conn->query($sql_delete) === TRUE) {
        echo "Record deleted successfully!";
        // Add JavaScript to reload the page
        echo '<script>window.location.reload();</script>';
    } else {
        echo "Error deleting record: " . $conn->error;
    }
    exit; // Stop script execution after deleting a row
}

// Close connection
$conn->close();
?>
