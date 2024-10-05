<?php
    include "../php/env/db.php";

// Fetch the last entered number from the 'number' column of the 'receipt' table
$sql = "SELECT number FROM receipt ORDER BY id_r DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Fetch the last number and increment it by 1
    $row = $result->fetch_assoc();
    $lastNumber = $row["number"];
    $newNumber = $lastNumber + 1;
} else {
    // If no records found, start with 1
    $newNumber = 1;
}

// Close the database connection
