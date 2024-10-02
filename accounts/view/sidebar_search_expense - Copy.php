<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING); // Suppress notices and warnings

session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/stylesheet.css">
</head>
<body>
<div id="page_wrapper">
    <div id="sidenav" class="sidenav">
        <div class="sidenav_header">
            <div class="logo_section">
                <!-- Logo Image -->
                <img src="images/new_logo.png" alt="Logo" class="logo_image">
                <h3><?php echo $_SESSION['username'] . ' مرحبا'; ?></h3>
            </div>
            <a href="sidebar_add_rec.php" class="sidenav_link active">
                <i class='bx bx-folder'></i>
                <h3>انشاء وصل جديد</h3>
            </a>
            <a href="sidebar_search_rec.php" class="sidenav_link">
                <i class='bx bx-briefcase'></i>
                <h3>بحث عن وصل</h3>
            </a>
            <?php if ($_SESSION['user']['user_type'] !== 'user2') { ?>
                <a href="sidebar_addstudent.php" class="sidenav_link">
                    <i class='bx bx-file'></i>
                    <h3>اضافة طالب</h3>
                </a>
                <a href="rec.php" class="sidenav_link">
                    <i class='bx bx-calendar'></i>
                    <h3>' طباعة وصل'</h3>
                </a>
            <?php } ?> 
        </div>
        <div class="sidenav_footer">
            <a href="logout.php" class="sidenav_link">
                <i class='bx bx-rocket'></i>
                <h3>تسجيل خروج </h3>
            </a>
        </div>
    </div>

    <!-- Include Top Bar -->
    <?php include 'topbar.php'; ?>

    <main>
       
        <section class="content">
            <div class="text">
                <?php include 'search_records.php'; ?>
            </div>
        </section>
    </main>
</div>
<script type="text/javascript" src="js/custom.js"></script>
</body>
</html>
