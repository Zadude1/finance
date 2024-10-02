
<?php
if (!empty($_SESSION['transactions'])) {
    echo "<table>";
    echo "<tr><th>الوقت</th><th>spentمدين/paidدائن</th><th>المبلغ</th><th>الحساب الرئيسي</th><th>الحساب الفرعي</th></tr>";

    foreach ($_SESSION['transactions'] as $transaction) {
        echo "<tr>";
        echo "<td>{$transaction['timestamp']}</td>";
        echo "<td>{$transaction['transactionType']}</td>";
        echo "<td>{$transaction['cashAmount']}</td>";
        echo "<td>{$transaction['mainAccount']}</td>";
        echo "<td>{$transaction['subAccount']}</td>";
        echo "</tr>";
    }

    echo "</table><br>";
}

if (!empty($_SESSION['transactions'])) {
    $finalTotalAmount = end($_SESSION['transactions'])['totalAmount'] ?? 0;
    $finalAmountWritten = end($_SESSION['transactions'])['amountWritten'] ?? '';
    echo "<input type='text' id='totalAmount' name='totalAmount' value='$finalTotalAmount' readonly>";

    echo "<label for='totalAmount'>مجموع الميزانية:</label>";
    echo "<input type='text' id='amountWritten' name='amountWritten' value='$finalAmountWritten' readonly>";

    echo "<label for='amountWritten'>الميزانية كتابة:</label>";
    

    // Recalculate total paid amount
    $totalPaidAmount = 0;
    foreach ($_SESSION['transactions'] as $transaction) {
        if ($transaction['transactionType'] == 'paid') {
            $totalPaidAmount += intval($transaction['cashAmount']);
        }
    }

    // Echo the total paid amount
echo "<input type='text' id='totalPaidAmount' name='totalPaidAmount' value='$totalPaidAmount' readonly>";
echo "<label for='totalPaidAmount'>إجمالي المبلغ المدفوع:</label>";

$totalPaidAmountArabic = numtoarb($totalPaidAmount);
echo "<input type='text' id='totalPaidAmountArabic' name='totalPaidAmountArabic' value='$totalPaidAmountArabic' readonly>";
echo "<label for='totalPaidAmountArabic'>إجمالي المبلغ كتابة:</label>";


}
?>