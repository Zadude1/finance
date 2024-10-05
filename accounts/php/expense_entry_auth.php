<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
// Check if the user is not logged in, redirect to login page
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}
if (!isset($_SESSION['transactions'])) {
    $_SESSION['transactions'] = [];
}

// Check if the user is not logged in, redirect to login page
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}

// Check if the user is not logged in, redirect to login page
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}
$field14 = date("d-m-Y");
echo $field10;
?>

