<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "accounting";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get current month and year
$currentMonth = date('m');
$currentYear = date('Y');

if (isset($_POST['search'])) {
    // Get the selected month and year from the form
    $currentMonth = $_POST['month'];
    $currentYear = $_POST['year'];
}

// Form for selecting the month and year
echo '<form method="post" action="">
    <label for="month">Month:</label>
    <select name="month" id="month">';
        for ($m = 1; $m <= 12; $m++) {
            $monthNum = str_pad($m, 2, '0', STR_PAD_LEFT);
            $selected = ($monthNum == $currentMonth) ? 'selected' : '';
            echo '<option value="'.$monthNum.'" '.$selected.'>'.date('F', mktime(0, 0, 0, $m, 10)).'</option>';
        }
echo '</select>';
echo '<label for="year">Year:</label>
    <select name="year" id="year">';
        for ($y = $currentYear; $y >= ($currentYear - 10); $y--) {
            $selected = ($y == $currentYear) ? 'selected' : '';
            echo '<option value="'.$y.'" '.$selected.'>'.$y.'</option>';
        }
echo '</select>
    <input type="submit" name="search" value="Search">
</form>';

// Query to join cost_acc and expense_detal, and calculate paid, spent, and balance for current and previous months
$sql = "
SELECT 
    ca.code, ca.name,

    -- Current Month
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = $currentMonth AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) AS paid_current,
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = $currentMonth AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) AS spent_current,
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = $currentMonth AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = $currentMonth AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) AS balance_current,

    -- Previous Month
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) AS paid_previous,
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) AS spent_previous,
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) AS balance_previous,

    -- Sum of Current and Previous Months
    (SUM(CASE WHEN ed.type = 'paid' AND (MONTH(ed.added_date) = $currentMonth OR MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END)) AS paid_sum,
    (SUM(CASE WHEN ed.type = 'spent' AND (MONTH(ed.added_date) = $currentMonth OR MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END)) AS spent_sum,
    (SUM(CASE WHEN ed.type = 'paid' AND (MONTH(ed.added_date) = $currentMonth OR MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND (MONTH(ed.added_date) = $currentMonth OR MONTH(ed.added_date) = MONTH(DATE_SUB('$currentYear-$currentMonth-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $currentYear THEN ed.money ELSE 0 END)) AS balance_sum

FROM 
    cost_acc ca
LEFT JOIN 
    expense_detal ed ON ca.code = ed.number_acc
GROUP BY 
    ca.code, ca.name
ORDER BY 
    ca.code ASC";

$result = $conn->query($sql);
echo "<table border='1'>
<tr>
    <th style='background-color: #49BBE6;'>رصيد الإجمالي</th>
    <th style='background-color: #49BBE6;'>المبلغ المصروف الإجمالي</th>
    <th style='background-color: #49BBE6;'>المبلغ المدفوع الإجمالي</th>
    <th style='background-color: #49BBE6;'>رصيد الشهر السابق</th>
    <th style='background-color: #49BBE6;'>المبلغ المصروف الشهر السابق</th>
    <th style='background-color: #49BBE6;'>المبلغ المدفوع الشهر السابق</th>
    <th style='background-color: #49BBE6;'>رصيد الشهر الحالي</th>
    <th style='background-color: #49BBE6;'>المبلغ المصروف الشهر الحالي</th>
    <th style='background-color: #49BBE6;'>المبلغ المدفوع الشهر الحالي</th>
    <th style='background-color: #49BBE6;'>م5</th>
    <th style='background-color: #49BBE6;'>م4</th>
    <th style='background-color: #49BBE6;'>م3</th>
    <th style='background-color: #49BBE6;'>م2</th>
    <th style='background-color: #49BBE6;'>م1</th>
    <th style='background-color: #49BBE6;'>الاسم</th>

</tr>";

$rows = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
}

// Process each leading digit separately
for ($digit = 1; $digit <= 9; $digit++) {
    $digit_str = strval($digit);

    for ($i = 1; $i <= 5; $i++) {
        foreach ($rows as $row) {
            $code = strval($row['code']);
            $name = htmlspecialchars($row['name']);
            $paid_current = number_format($row['paid_current'], 2);
            $spent_current = number_format($row['spent_current'], 2);
            $balance_current = number_format($row['balance_current'], 2);
            $paid_previous = number_format($row['paid_previous'], 2);
            $spent_previous = number_format($row['spent_previous'], 2);
            $balance_previous = number_format($row['balance_previous'], 2);
            $paid_sum = number_format($row['paid_sum'], 2);
            $spent_sum = number_format($row['spent_sum'], 2);
            $balance_sum = number_format($row['balance_sum'], 2);

            if (strlen($code) == $i && strpos($code, $digit_str) === 0) {
                $d1 = $d2 = $d3 = $d4 = $d5 = "";

                if ($i >= 1) $d1 = $code[0];
                if ($i >= 2) $d2 = substr($code, 0, 2);
                if ($i >= 3) $d3 = substr($code, 0, 3);
                if ($i >= 4) $d4 = substr($code, 0, 4);
                if ($i == 5) $d5 = $code;

                echo "<tr>
                <td style='background-color: #8FC3D6;'>$balance_sum</td>
                <td style='background-color: #8FC3D6;'>$spent_sum</td>
                <td style='background-color: #8FC3D6;'>$paid_sum</td>
                <td style='background-color: #A2D9CE;'>$balance_previous</td>
                <td style='background-color: #A2D9CE;'>$spent_previous</td>
                <td style='background-color: #A2D9CE;'>$paid_previous</td>
                <td style='background-color: #D0E8E4;'>$balance_current</td>
                <td style='background-color: #D0E8E4;'>$spent_current</td>
                <td style='background-color: #D0E8E4;'>$paid_current</td>        
                <td >$d5</td>
                <td >$d4</td>
                <td >$d3</td>
                <td >$d2</td>
                <td >$d1</td>
                <td >$name</td>

                </tr>";
            }
        }
    }
}

echo "</table>";


$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Report</title>
    
    <style>

    /* Reset some default styles */
body, table, th, td {
    margin: 0;
    padding: 0;
    border: 0;
    font-family: Arial, sans-serif;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

th {
    background-color: #49BBE6;
    color: #fff;
}

td {
    background-color: #f9f9f9;
}

td:nth-child(odd) {
    background-color: #f2f2f2;
}

tr:nth-child(even) td {
    background-color: #e9f5f9;
}

form {
    margin: 20px 0;
}

label {
    margin-right: 10px;
}

select, input[type="submit"] {
    padding: 5px;
    margin-right: 10px;
}

input[type="submit"] {
    background-color: #49BBE6;
    color: #fff;
    border: none;
    cursor: pointer;
    padding: 5px 15px;
}

input[type="submit"]:hover {
    background-color: #378ab0;
}

    
    </style>
</head>
<body>
