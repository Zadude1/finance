<?php
// Include database connection
include('../php/env/db.php');
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>الطلاب</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="../css/admin_css.css"> <!-- Link the CSS file -->
</head>
<body>

    <header>
        <h1>الطلاب</h1>
    </header>

    <div class="dashboard-container">
        <div class="dashboard">
            <div class="dashboard-item" onclick="location.href='sidebar_addstudent.php'">
                <div class="icon"><i class="fas fa-user-plus"></i></div>
                <p>إضافة طالب</p>
            </div>
            <div class="dashboard-item" onclick="location.href='sidebar_leveling.php'">
                <div class="icon"><i class="fas fa-list-alt"></i></div>
                <p>ترحيل الطلاب </p>
            </div>
        </div>
    </div>

</body>
</html>
