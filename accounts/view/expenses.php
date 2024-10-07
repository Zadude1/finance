<?php
// Include database connection
include('../php/env/db.php');
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>المصروفات</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link rel="stylesheet" href="../css/admin_css.css"> <!-- Link the CSS file -->
</head>
<body>

    <header>
        <h1>المصروفات</h1>
    </header>

    <div class="dashboard-container">
        <div class="dashboard">
            <div class="dashboard-item" onclick="location.href='sidebar_search_expense.php'">
                <div class="icon"><i class="fas fa-search-dollar"></i></div>
                <p>بحث في المصروفات</p>
            </div>
            <div class="dashboard-item" onclick="location.href='sidebar_expense.php'">
                <div class="icon"><i class="fas fa-file-invoice-dollar"></i></div>
                <p>إضافة مصروف</p>
            </div>
        </div>
    </div>

</body>
</html>
