<?php
include "num2word.php";
?>
<!DOCTYPE html>
<html>
<head>
<script src="numbertoarabictext.js"></script>

       <link rel="stylesheet" href="../css/daily_record.css">

</head>
<body>
    <div class="container">
        <button class="print-button" onclick="window.print()">Print</button>
        <button class="home-button" onclick="window.location.href = 'daily_record_search.php'">Home</button>
    </div>


    <?php

    
    // Suppress warnings and notices
    error_reporting(E_ERROR | E_PARSE);

    // Include the number_to_arabic_word.php file
    include "number_to_arabic_word.php";

    // Database connection details
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "accounting";

    // Create connection
    $conn = @new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get the id_e parameter from the URL
    $id_e = isset($_GET['id_e']) ? $_GET['id_e'] : '';

    if ($id_e) {
        // Prepare and execute the SQL query to fetch data from daily_record
        $sql = "SELECT id_dc, data_in, from_per,in_number,in_date FROM daily_record WHERE id_dc = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $id_e);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if there are any results
        if ($result->num_rows > 0) {
            // Output data of each row
            while($row = $result->fetch_assoc()) {
                echo "<div class='container'>";
            
                echo "<div class='left'>"; // Added a new div for the left side
                echo "<h2>مستند قيد يومية</h2> <br>";

                echo "<h3>مستند صرف </h3> <br>";
                echo "<b>رقم القيد</b> " . htmlspecialchars($row["in_number"]) . "<br>";

                echo "<b>التاريخ</b> " . htmlspecialchars($row["in_date"]) . "<br>";
                echo "</div>";
                echo "<div class='center'><b>عن  </b>" . htmlspecialchars($row["from_per"]) . "</div>";

                echo "<div class='right'>";
                echo "<b>وزارة التعليم العالي والبحث العلمي:</b><br>";
                echo "<b>جامعة العين:</b><br>";
                echo "<b>رقم القيد</b> " . htmlspecialchars($row["id_dc"]) . "<br>";
                echo "<b>التاريخ</b> " . htmlspecialchars($row["data_in"]) . "<br>";
                echo "</div>";
            
                echo "</div><br>";
            
            }
        } else {
            echo "<b>0 results</b>";
        }
        $stmt->close();
        
        // Initialize totals
        $total_debit = 0;
        $total_credit = 0;

        // Fetch details from daily_record_detal table with a join on cost_acc
        $sql_details = "
            SELECT drd.type, drd.money, drd.number_acc, ca.name
            FROM daily_record_detal drd
            LEFT JOIN cost_acc ca ON drd.number_acc = ca.code
            WHERE drd.id_dc = ?
        ";
        $stmt_details = $conn->prepare($sql_details);
        $stmt_details->bind_param("s", $id_e);
        $stmt_details->execute();
        $result_details = $stmt_details->get_result();
        
        // Check if there are any results
        if ($result_details->num_rows > 0) {
            // Output details in a table
            echo "<div class='container'>";
            echo "<table>";
            echo "<tr><th><b>الدليل المحاسبي</b></th><th><b>بيان الدائن</b></th><th><b>بيان المدين</b></th><th><b>دائن</b></th><th><b>مدين</b></th></tr>"; // Updated order
            
            while ($row = $result_details->fetch_assoc()) {
                echo "<tr>";
                echo "<td class='narrow'>" . htmlspecialchars($row['number_acc']) . "</td>";
                
                if ($row['type'] == 'spent') {
                    echo "<td class='wide'>" . htmlspecialchars($row['name']) . "</td>";
                    echo "<td class='wide'></td>";
                    echo "<td>" . htmlspecialchars($row['money']) . "</td><td></td>";
                    $total_debit += $row['money'];
                } elseif ($row['type'] == 'paid') {
                    echo "<td class='wide'></td>";
                    echo "<td class='wide'>" . htmlspecialchars($row['name']) . "</td>";
                    echo "<td></td><td>" . htmlspecialchars($row['money']) . "</td>";
                    $total_credit += $row['money'];
                }
            
                echo "</tr>";
            }
           
            
        
            // Determine the higher total and convert it to Arabic words
            if ($total_credit >= $total_debit) {
                $total_in_words = convert_number($total_credit,"male");
            } else {
                $total_in_words = convert_number($total_debit,"male");
            }
        
            // Output totals row with Arabic words instead of "الإجمالي"
            echo "<tr><td colspan='2'><b>" . ($total_credit >= $total_debit ? $total_in_words : '') . "</b></td><td></td><td><b>" . $total_credit . "</b></td><td><b>" . $total_debit . "</b></td></tr>";
        
            echo "</table>";
            echo "</div>";
        } else {
            echo "0 results";
        }
        $stmt_details->close();
    }

    $conn->close();
    ?>
    
    <div class="footer">
        <div class="text right"><b>المحاسب</b></div>
        <div class="text center"><b>مدير الشؤون المالية</b></div>
        <div class="text left"><b>التدقيق</b></div>
    </div>

</body>
</html>
