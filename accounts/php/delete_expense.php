<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "accounting";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['id_e'])) {
    $id_e = $_POST['id_e'];

    $sql = "DELETE FROM expense WHERE id_e=$id_e";

    if ($conn->query($sql) === TRUE) {
        echo "success";
    } else {
        echo "error";
    }
} else {
    echo "invalid";
}

$conn->close();
?>
