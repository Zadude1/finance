

<?php 
session_start();
// التحقق مما إذا كان المستخدم غير مسجل الدخول، إعادة توجيهه إلى صفحة تسجيل الدخول
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit();
}
include "../php/number_to_arabic_word.php";

?>

<?php
include "../php/expense/expense_entry_auth.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Tracker</title>

    <style>
        /* Example CSS for styling */
        .container {
            border: 1px solid black;
            padding: 10px;
            text-align: right; /* Align the content of the div to the right */
        }
    </style>
    <link rel="stylesheet" href="../css/stylee.css">

</head>
<body>
<?php
// Database connection parameters
include "../php/expense/connetion_expenses.php";

// Close the database connection

?>

<?php
include "../php/expense/expense_entry_table.php";
?>


<!-- Form for new transaction -->
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">

<div class="container">

    <!-- رقم الحساب الرئيسي أو الفرعي -->
<input type="text" name="accountNumber" id="accountNumber" value="0">
<label for="accountNumber">رقم الحساب:</label>

<!-- حقل جديد لنوع الحساب -->
<!--
<select name="accountType" id="accountType" required>
    <option value="main">الرئيسي</option>
    <option value="sub">الفرعي</option>
</select>

<label for="accountType">نوع الحساب:</label>
-->


<select name="transactionType" id="transactionType" required>
    <option value="paid">دائن</option>
    <option value="spent">مدين</option>
</select>
<label for="transactionType">نوع العملية:</label>

<input type="number" name="cashAmount" id="cashAmount" value="0">
<label for="cashAmount">المبلغ النقدي:</label>
<input type="number" name="cashAmount" id="cashAmount" value="0">
<label for="cashAmount">المبلغ النقدي:</label>

<br>
<input type="submit" value="اضف المبلغ"><br><br><br>
    <input type="submit" name="emptyTable" value="تفريغ الطاولة">
    

   </div>

</form>




<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
<br>
 <!-- Display transaction table -->

    <?php
    include "../php/expense/expense_table_details.php";
?>
<div class="container">

<input type="date" id="selected_date" name="selected_date">
      <label for="selected_date">تاريخ الوصل</label>
<br><br>
    <!-- Display the fetched number + 1 in the form field -->
    <input type="text" name="cnumber" id="cnumber" value=0>
    <label for="cnumber">رقم الصك:</label>
    <input type="date" id="selected_cdate" name="selected_cdate">
    <label for="selected_cdate">تاريخ الصك</label>
<br><br>
    <select name="college" id="college" required>
    <?php
    
    $sql = "SELECT code, name FROM account_t";
    $result = $conn->query($sql);

    // Check if there are results
    if ($result->num_rows > 0) {
        // Loop through the results and output options
        while($row = $result->fetch_assoc()) {
            echo '<option value="' . $row["code"] . '">' . $row["name"] . '</option>';
        }
    } else {
        echo '<option value="">No colleges available</option>';
    }

    // Close connection
    $conn->close();
    ?>
    </select>
    <label for="college">الكلية:</label>

    <select name="level" id="level" required>
        <option value="الاولى">الاولى</option>
        <option value="الثانية">الثانية </option>
        <option value="الثالة"> الثالة</option>
        <option value="الرابعة">الرابعة</option>
        <option value="الخامسة">الخامسة</option>
        <option value="السادسة">السادسة</option>
    </select>
    <label for="level">المرحلة:</label>

    </select>
    <select name="paymentfor" id="paymentfor" required>
    <option value="قسط سنوي">قسط سنوي</option>
        <option value="اجور تحميل">اجور تحميل</option>
        <option value="اقسام داخلية">اقسام داخلية</option>
        <option value="اجور اخرى">اجور اخرى</option>
    </select>
    <label for="paymentfor">مبلغ عن</label>

    <select name="studyYear" id="studyYear" required>
        <?php
        // Generate study year options from 2017-2018 to 2030-2031
        $currentYear = date("Y");
        for ($year = 2017; $year <= 2030; $year++) {
            $nextYear = $year + 1;
            $yearRange = "$year-$nextYear";
            echo "<option value=\"$yearRange\">$yearRange</option>";
        }
        ?>
    </select>
    <label for="studyYear">سنة الدراسة</label>
    <input type="text" name="id_s" id="id_s" readonly>
    <label for="id_s">رقم الطالب</label>
    <!-- New field for Received From with autocomplete -->
<div class="autocomplete">
    <input type="text" name="receivedFrom" id="receivedFrom" required autocomplete="off">
    <div id="nameSuggestions" class="autocomplete-items"></div>
</div>
<label for="receivedFrom">استلم من</label>

    <!-- Textbox displaying the received information -->
    
    
<br>
    <!-- Add a hidden input field to hold the value of receivedInfo -->
<input type="hidden" id="receivedInfoHidden" name="receivedInfo" value="">

<!-- Textarea displaying the received information -->
<textarea rows="1" cols="200" id="receivedInfo" readonly></textarea><br>

    <input type="submit" name="submitfinal" value="ارسل المعلومات">
    
    
    </form>

</div>

<script src="button2script.js"></script>

<style>
        .autocomplete {
            position: relative;
            display: inline-block;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-top: none;
            z-index: 99;
            top: 100%;
            left: 0;
            right: 0;
            background-color: #fff;
            width: 300px; /* Adjust the width as per your preference */
        }

        .name-suggestion {
            padding: 10px;
            cursor: pointer;
        }

        .name-suggestion:hover {
            background-color: #f1f1f1;
        }

        /* Adjust the input field styles as needed */
        input[type="text"] {
            padding: 8px;
            width: 300px; /* Adjust the width as per your preference */
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
<!--
<script>
    function copyName() {
        // Get the value from the input field in form1
        var name1Value = document.getElementById('amountWritten').value;
        
        // Set the value to the input field in form2
        document.getElementById('name2').value = name1Value;
    }
    copyName() ;
    function copyName2() {
        // Get the value from the input field in form1
        var name1Value = document.getElementById('totalAmount').value;
        
        // Set the value to the input field in form2
        document.getElementById('name3').value = name1Value;
    }
    copyName2() ;
</script>
-->
<form>
<br><br>
<a id="print-links" href="sidebar3.php" style="font-size: x-large;">البحث عن وصل</a>
</form>
</body>
</html>
<?php
//هاي بشه
/*
   _   
__(.)< 
\___)
*/
?>
