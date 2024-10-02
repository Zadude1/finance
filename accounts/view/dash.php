<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f4f4f4, #e8e8e8);
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 0;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        nav a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #FFD700;
        }

        .dashboard-container {
            width: 80%;
            margin: 100px auto 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .dashboard-menu ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .dashboard-menu li {
            margin: 10px;
            flex: 1 1 22%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease;
            height: 120px; /* Fixed height for uniformity */
        }

        .dashboard-menu li:hover {
            transform: translateY(-5px);
        }

        .dashboard-menu a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            transition: background-color 0.3s ease;
            font-size: 14px;
            background-color: #f9f9f9;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            box-sizing: border-box; /* Ensures padding and borders are included in the width and height */
        }

        .dashboard-menu a:hover {
            background-color: #007BFF;
            color: #fff;
        }

        .dashboard-menu a i {
            font-size: 24px;
            margin-bottom: 5px;
        }

        footer {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0px -2px 5px rgba(0, 0, 0, 0.1);
        }

        footer p {
            margin: 0;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .dashboard-menu li {
                flex: 1 1 45%;
            }
        }

        @media (max-width: 480px) {
            .dashboard-menu li {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>لوحة المستخدم</h1>
        <nav>
            <a href="#">Home</a>
            <a href="#">Profile</a>
            <a href="#">Settings</a>
            <a href="#">Logout</a>
        </nav>
    </header>

    <div class="dashboard-container">
        <div class="dashboard-menu">
            <ul>
                <li><a href="sidebar_search_expense.php"><i class="material-icons">search</i>بحث جانبي عن المصاريف</a></li>
                <li><a href="sidebar_search_expense_daily_records.php"><i class="material-icons">search</i>بحث جانبي عن المصاريف والسجلات اليومية</a></li>
                <li><a href="sidebar_search_records.php"><i class="material-icons">search</i>بحث جانبي عن السجلات</a></li>
                <li><a href="fund_record.php"><i class="material-icons">account_balance_wallet</i>سجل الصندوق</a></li>
                <li><a href="search_expense.php"><i class="material-icons">attach_money</i>بحث عن المصاريف</a></li>
                <li><a href="edit_expense.php"><i class="material-icons">edit</i>تعديل المصاريف</a></li>
                <li><a href="daily_record_edit_search.php"><i class="material-icons">edit</i>تعديل وبحث في السجلات اليومية</a></li>
                <li><a href="search_records.php"><i class="material-icons">search</i>بحث في السجلات</a></li>
                <li><a href="receipt_daily_record.php"><i class="material-icons">receipt</i>إيصال السجل اليومي</a></li>
                <li><a href="daily_record.php"><i class="material-icons">event_note</i>السجل اليومي</a></li>
                <li><a href="add_rec.php"><i class="material-icons">add_circle</i>إضافة سجل</a></li>
                <li><a href="expense_entery_view.php"><i class="material-icons">visibility</i> إدخال المصاريف جديدة</a></li>
                <li><a href="daily_record_search.php"><i class="material-icons">search</i>بحث في السجل اليومي</a></li>
                <li><a href="sidebar_search_rec.php"><i class="material-icons">search</i>بحث جانبي في السجل</a></li>
                <li><a href="sidebar_addstudent.php"><i class="material-icons">person_add</i>إضافة طالب جانبي</a></li>
                <li><a href="sidebar_add_rec.php"><i class="material-icons">note_add</i>إضافة سجل جانبي</a></li>
                <li><a href="addstudent.php"><i class="material-icons">person_add</i>إضافة طالب</a></li>
                <li><a href="login.php"><i class="material-icons">login</i>تسجيل الدخول</a></li>
                <li><a href="rec.php"><i class="material-icons">receipt</i>استلام</a></li>
                <li><a href="logout.php"><i class="material-icons">exit_to_app</i>تسجيل الخروج</a></li>
            </ul>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>

</body>
</html>
