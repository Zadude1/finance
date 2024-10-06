<?php

include "../php/fund_record.php";

// Ensure you fetch only the rows where type is 'receipt'
$results = array_filter($results, function($row) {
    return $row['type'] === 'receipt';
});

?>
<!DOCTYPE html>
<html>
<head>
    <title>Display Records by Year and Month</title>
    <style>
        @page {
            size: A3 landscape;
            margin: 1in;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .page-break {
            page-break-before: always;
        }
        .totals {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form method="POST" action="">
        <label for="year">Enter Year:</label>
        <input type="text" id="year" name="year" required>
        
        <label for="month">Select Month:</label>
        <select id="month" name="month" required>
            <option value="">Select Month</option>
            <option value="01">January</option>
            <option value="02">February</option>
            <option value="03">March</option>
            <option value="04">April</option>
            <option value="05">May</option>
            <option value="06">June</option>
            <option value="07">July</option>
            <option value="08">August</option>
            <option value="09">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
        </select>
        
        <input type="submit" value="Search">
    </form>

    <?php if (!empty($results)): ?>
        <?php for ($page = 0; $page < $totalPages; $page++): ?>
            <?php
            $start = $page * $perPage;
            $end = min(($page + 1) * $perPage, $totalRows);
            $pageResults = array_slice($results, $start, $end - $start);
            ?>
            <div class="page-break">
                <h2>السنة <?php echo htmlspecialchars($year); ?> الشهر  <?php echo htmlspecialchars($month); ?> - الصفحة <?php echo ($page + 1); ?></h2>
                <table>
                    <thead>
                    <tr>
                    <th colspan=1></th>
                    <th colspan=2>الشيك</th>
                    <th colspan=1></th>
                    <th colspan=3>المستند</th>
                    <th colspan=2>البيان</th>
                    <th colspan=2>حساب البنك</th>
                    <th colspan=2>حساب الصندوق</th>
                    </tr>
                        <tr>
                            <th>الملاحظات</th>
                            <th>تاريخ الشيك</th>
                            <th>رقم الشيك</th>
                            <th>رقم التسلسل اليومية</th>
                            <th>تاريخه</th>
                            <th>رقمه</th>
                            <th>نوعه</th>
                            <th>اسم المدفوع</th>
                            <th>اسم المقبوض</th>
                            <th>مسحوبات له</th>
                            <th>ايداعات منه</th>
                            <th>مدفوعات له</th>
                            <th>المقبوض منه</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $totals = ['Draws' => 0, 'Deposits' => 0, 'Payments' => 0, 'Receipts' => 0, 'Number' => 0];
                        foreach ($pageResults as $row):
                            $totals['Draws'] += $row['Draws'];
                            $totals['Deposits'] += $row['Deposits'];
                            $totals['Payments'] += $row['Payments'];
                            $totals['Receipts'] += $row['Receipts'];
                            $totals['Number'] += $row['number'];
                        ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['note']); ?></td>
                                <td><?php echo htmlspecialchars($row['c_date']); ?></td>
                                <td><?php echo htmlspecialchars($row['c_number']); ?></td>
                                <td><?php echo htmlspecialchars($row['Daily_sequence']); ?></td>
                                <td><?php echo htmlspecialchars($row['date']); ?></td>
                                <td><?php echo htmlspecialchars($row['record_number']); ?></td>
                                <td>قبض</td>
                                <td><?php echo htmlspecialchars($row['name_Payments']); ?></td>
                                <td><?php echo htmlspecialchars($row['name_Receipts']); ?></td>
                                <td><?php echo number_format($row['Draws'], 2); ?></td>
                                <td><?php echo number_format($row['Deposits'], 2); ?></td>
                                <td><?php echo number_format($row['Payments'], 2); ?></td>
                                <td><?php echo number_format($row['Receipts'], 2); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr class="totals">
                            <td>Total:</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                            <td><?php echo number_format($totals['Draws'], 2); ?></td>
                            <td><?php echo number_format($totals['Deposits'], 2); ?></td>
                            <td><?php echo number_format($totals['Payments'], 2); ?></td>
                            <td><?php echo number_format($totals['Receipts'], 2); ?></td>
                            <td><?php echo number_format($totals['Number'], 2); ?></td>
                        </tr>
                        <tr class="totals">
                            <td colspan="8">Grand Total:</td>
                            
                            <td colspan="5"><?php echo number_format(array_sum($totals), 2); ?></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        <?php endfor; ?>
    <?php endif; ?>
</body>
</html>
