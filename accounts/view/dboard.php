<?php
// Include database connection
include('../php/env/db.php');
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>لوحة التحكم</title>
    <link rel="stylesheet" href="../css/admin_css.css"> <!-- Link the CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>
<body>

    <header>
        <h1>لوحة التحكم</h1>
    </header>

    <div class="dashboard-container">
        <div class="dashboard">
            <div class="dashboard-item" onclick="location.href='receipts.php'">
                <div class="icon"><i class="fas fa-receipt"></i></div>
                <p>القبض</p>
            </div>
            <div class="dashboard-item" onclick="location.href='expenses.php'">
                <div class="icon"><i class="fas fa-wallet"></i></div>
                <p>المصروفات</p>
            </div>
            <div class="dashboard-item" onclick="location.href='daily_records.php'">
                <div class="icon"><i class="fas fa-book"></i></div>
                <p>السجلات اليومية</p>
            </div>
            <div class="dashboard-item" onclick="location.href='students.php'">
                <div class="icon"><i class="fas fa-user-graduate"></i></div>
                <p>الطلاب</p>
            </div>
            <div class="dashboard-item" onclick="location.href='fund_record.php'">
                <div class="icon"><i class="fas fa-box"></i></div>
                <p>سجلات الصندوق</p>
            </div>
            <div class="dashboard-item" onclick="location.href='fund_rec.php'">
                <div class="icon"><i class="fas fa-file-alt"></i></div>
                <p>سجل القبض</p>
            </div>
            <div class="dashboard-item" onclick="location.href='Monthly_budget_c.php'">
                <div class="icon"><i class="fas fa-chart-line"></i></div>
                <p>نموذج الميزانية</p>
            </div>
        </div>
    </div>

</body>
</html>
