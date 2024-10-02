<?php
$host = 'localhost';
$dbname = 'userdb2'; // Replace with your actual database name
$username = 'root'; // Assuming you are using the default XAMPP username
$password = ''; // Assuming you are using no password for XAMPP

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
?>
