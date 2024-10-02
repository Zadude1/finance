<?php
// بدء الجلسة للوصول إلى متغيرات الجلسة
session_start();

// التحقق مما إذا كان المستخدم غير مسجل الدخول، إعادة توجيهه إلى صفحة تسجيل الدخول
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
    <title>نموذج معلومات الطالب</title>
    <link rel="stylesheet" href="../css/stylee.css">

</head>
<body>

    <form action="../php/process_addstudent_form.php" method="post">
        <h2>نموذج معلومات الطالب</h2>

        <label for="name">الاسم:</label>
        <input type="text" name="name" required>

        <label for="birthday">تاريخ الميلاد:</label>
        <input type="date" name="birthday" required>

        <label for="code">الرمز:</label>
        <input type="text" name="code" required>

        <label for="phone">الهاتف:</label>
        <input type="tel" name="phone" required>

        <label for="phone_p">هاتف الوالدين:</label>
        <input type="tel" name="phone_p" required>

        <label for="email">البريد الإلكتروني:</label>
        <input type="email" name="email" required>

        <label for="id_col">الرقم الجامعي:</label>
        <select name="id_col" required>
            <?php
            for ($i = 1; $i <= 5; $i++) {
                echo "<option value=\"$i\">$i</option>";
            }
            ?>
        </select>

        <label for="level_num">المستوى:</label>
        <select name="level_num" required>
            <?php
            for ($i = 1; $i <= 5; $i++) {
                echo "<option value=\"$i\">$i</option>";
            }
            ?>
        </select>

        <label for="date">التاريخ:</label>
        <input type="date" name="date" required>

        <label for="status">الحالة:</label>
        <select name="status" required>
            <option value="1">نشط</option>
            <option value="0">غير نشط</option>
        </select>

        <label for="year">السنة:</label>
        <select name="year" required>
            <?php
            for ($i = 2030; $i >= 2017; $i--) {
                $nextYear = $i + 1;
                $yearRange = "$i-$nextYear";
                echo "<option value=\"$yearRange\">$yearRange</option>";
            }
            ?>
        </select>

        <label for="adder_name">اسم المضاف:</label>
        <input type="text" name="adder_name" value="<?php echo isset($_SESSION['username']) ? $_SESSION['username'] : ''; ?>" readonly required>

        <label for="create_date">تاريخ الإنشاء:</label>
        <input type="date" name="create_date" required value="<?php echo date('Y-m-d'); ?>">

        <input type="submit" value="إرسال">
    </form>
</body>
</html>
