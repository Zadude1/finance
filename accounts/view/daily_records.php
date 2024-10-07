<?php
// Include database connection
include('../php/env/db.php');
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>السجلات اليومية</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="../css/admin_css.css"> <!-- Link the CSS file -->
</head>
<body>

    <header>
        <h1>السجلات اليومية</h1>
    </header>

    <div class="dashboard-container">
        <div class="dashboard">
            <div class="dashboard-item" onclick="location.href='sidebar_search_expense_daily_records.php'">
                <div class="icon"><i class="fas fa-plus"></i></div>
                <p>اضافة السجلات اليومية</p>
            </div>
            <div class="dashboard-item" onclick="location.href='sidebar_search_records.php'">
                <div class="icon"><i class="fas fa-book-open"></i></div>
                <p>بحث في السجلات اليومية</p>
            </div>
        </div>
    </div>

</body>
</html>
