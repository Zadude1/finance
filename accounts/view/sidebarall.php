<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING); // Suppress notices and warnings

session_start();
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/stylesheet.css">
    <style>
        /* Basic CSS for layout */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        #page_wrapper {
            display: flex;
            height: 100vh;
        }
        .sidenav {
            width: 250px;
            background: #333;
            color: #fff;
            position: fixed;
            height: 100%;
            overflow: auto;
            transition: 0.3s;
        }
        .sidenav_header {
            padding: 20px;
            text-align: center;
        }
        .sidenav_link {
            display: block;
            padding: 15px 20px;
            text-decoration: none;
            color: #fff;
        }
        .sidenav_link.active {
            background: #575757;
        }
        .sidenav_link:hover {
            background: #575757;
        }
        main {
            margin-left: 250px; /* same as the width of the sidenav */
            padding: 20px;
            width: calc(100% - 250px);
            transition: margin-left 0.3s;
        }
        .topbar {
            position: fixed;
            top: 0;
            left: 250px; /* same as the width of the sidenav */
            right: 0;
            background: #f1f1f1;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1000;
        }
    </style>
</head>
<body>
<div id="page_wrapper">
    <div id="sidenav" class="sidenav">
        <div class="sidenav_header">
            <h3><?php echo $_SESSION['username'] . ' مرحبا'; ?></h3>
        </div>
        <a href="#" class="sidenav_link" data-page="sidebar_add_rec.php">
            <i class='bx bx-folder'></i>
            <h3>انشاء وصل جديد</h3>
        </a>
        <a href="#" class="sidenav_link" data-page="sidebar_search_rec.php">
            <i class='bx bx-briefcase'></i>
            <h3>بحث عن وصل</h3>
        </a>
        <?php if ($_SESSION['user']['user_type'] !== 'user2') { ?>
            <a href="#" class="sidenav_link" data-page="sidebar_addstudent.php">
                <i class='bx bx-file'></i>
                <h3>اضافة طالب</h3>
            </a>
            <a href="#" class="sidenav_link" data-page="rec.php">
                <i class='bx bx-calendar'></i>
                <h3>طباعة وصل</h3>
            </a>
        <?php } ?>
        <div class="sidenav_footer">
            <a href="logout.php" class="sidenav_link">
                <i class='bx bx-rocket'></i>
                <h3>تسجيل خروج</h3>
            </a>
        </div>
    </div>
    
    <main>
        <div class="topbar">
            <h2>لوحة التحكم</h2>
            <div class="user_info">
                <p><?php echo $_SESSION['username']; ?></p>
            </div>
        </div>
        <header>
            <div>
                <button id="theme_switch">
                    <i class='bx bx-sun'></i>
                </button>
            </div>
        </header>
        <section class="content" id="main_content">
            <div class="text">
                <p>Welcome to the Admin Panel! Please select an option from the sidebar.</p>
            </div>
        </section>
    </main>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('.sidenav_link').click(function(e) {
        e.preventDefault(); // Prevent default anchor click behavior

        // Get the page to load from the data attribute
        var page = $(this).data('page');
        
        // Remove active class from all links and add to the clicked link
        $('.sidenav_link').removeClass('active');
        $(this).addClass('active');

        // Load the content from the specified page
        $('#main_content').load(page);
    });
});
</script>
</body>
</html>
