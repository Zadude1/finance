<!-- header.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Al Ayen University users info</title>
</head>
<body>

<div class="header">
    <div class="dropdown" id="dropdown">
        <button class="dropbtn" onclick="toggleDropdown()">Menu</button>
        <div class="dropdown-content" id="dropdownContent">
            <a href="index.php">Homepage</a>
            <a href="about.php">About Us</a>
            <a href="contact.php">Contact Us</a>
        </div>
    </div>
    <div class="title-container">
        <h1>Login System</h1>
    </div>
    <div class="logo-container">
        <img src="../Images/new_logo.png" alt="Logo" class="logo"> <!-- Add your logo image path -->
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var dropdownContent = document.getElementById("dropdownContent");
        dropdownContent.style.display = "none"; // Initially hide the dropdown content
    });

    function toggleDropdown() {
        var dropdownContent = document.getElementById("dropdownContent");
        dropdownContent.style.display = (dropdownContent.style.display === "block") ? "none" : "block";
    }
</script>
