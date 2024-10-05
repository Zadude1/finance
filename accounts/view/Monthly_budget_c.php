<?php
    include "../php/env/db.php";


// Retrieve selected month and year from form submission, or use current month and year as default
$selected_month = isset($_POST['month']) ? $_POST['month'] : date('m');
$selected_year = isset($_POST['year']) ? $_POST['year'] : date('Y');

// Form for selecting month and year
echo "
<form method='post'>
    <label for='month'>السنة:</label>
    <select name='month' id='month'>
        <option value='01' <?php echo ($selected_month == '01' ? 'selected' : ''); ?>يناير</option>
<option value='02' <?php echo ($selected_month == '02' ? 'selected' : ''); ?>فبراير</option>
<option value='03' <?php echo ($selected_month == '03' ? 'selected' : ''); ?>مارس</option>
<option value='04' <?php echo ($selected_month == '04' ? 'selected' : ''); ?>أبريل</option>
<option value='05' <?php echo ($selected_month == '05' ? 'selected' : ''); ?>مايو</option>
<option value='06' <?php echo ($selected_month == '06' ? 'selected' : ''); ?>يونيو</option>
<option value='07' <?php echo ($selected_month == '07' ? 'selected' : ''); ?>يوليو</option>
<option value='08' <?php echo ($selected_month == '08' ? 'selected' : ''); ?>أغسطس</option>
<option value='09' <?php echo ($selected_month == '09' ? 'selected' : ''); ?>سبتمبر</option>
<option value='10' <?php echo ($selected_month == '10' ? 'selected' : ''); ?>أكتوبر</option>
<option value='11' <?php echo ($selected_month == '11' ? 'selected' : ''); ?>نوفمبر</option>
<option value='12' <?php echo ($selected_month == '12' ? 'selected' : ''); ?>ديسمبر</option>

    </select>
    
    <label for='year'>الشهر:</label>
    <input type='number' name='year' id='year' value='$selected_year' min='2000' max='2100'>
    <br>
    <br>
    <input type='submit' value='ابحث'>
</form>
";

// Query to get the data
$sql = "
SELECT 
    ca.code, ca.name,

    -- Selected Month
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = $selected_month AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END) AS paid_current,
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = $selected_month AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END) AS spent_current,
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = $selected_month AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = $selected_month AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END) AS balance_current,

    -- Previous Month
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = YEAR(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) THEN ed.money ELSE 0 END) AS paid_previous,
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = YEAR(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) THEN ed.money ELSE 0 END) AS spent_previous,
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = YEAR(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) AND YEAR(ed.added_date) = YEAR(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH)) THEN ed.money ELSE 0 END) AS balance_previous,

    -- Sum of Selected and Previous Months
    (SUM(CASE WHEN ed.type = 'paid' AND (MONTH(ed.added_date) = $selected_month OR MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END)) AS paid_sum,
    (SUM(CASE WHEN ed.type = 'spent' AND (MONTH(ed.added_date) = $selected_month OR MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END)) AS spent_sum,
    (SUM(CASE WHEN ed.type = 'paid' AND (MONTH(ed.added_date) = $selected_month OR MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND (MONTH(ed.added_date) = $selected_month OR MONTH(ed.added_date) = MONTH(DATE_SUB('$selected_year-$selected_month-01', INTERVAL 1 MONTH))) AND YEAR(ed.added_date) = $selected_year THEN ed.money ELSE 0 END)) AS balance_sum

FROM 
    cost_acc ca
LEFT JOIN 
    expense_detal ed ON ca.code = ed.number_acc
GROUP BY 
    ca.code, ca.name
ORDER BY 
    LENGTH(ca.code), ca.code";

$result = $conn->query($sql);

// Function to build hierarchical array
function buildHierarchy($data) {
    $tree = [];
    $lookup = [];

    // Create lookup for quick access
    foreach ($data as $item) {
        $code = $item['code'];
        $lookup[$code] = $item;
        $lookup[$code]['children'] = [];
    }

    // Build tree
    foreach ($lookup as $code => &$item) {
        $parentCode = substr($code, 0, -1); // Assume parent is the code without the last digit

        if (isset($lookup[$parentCode])) {
            $lookup[$parentCode]['children'][] = &$item;
        } else {
            $tree[] = &$item;
        }
    }

    return $tree;
}

// Fetch data and organize into hierarchical array
$items = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
}

$hierarchy = buildHierarchy($items);

// Recursive function to print table rows
function printHierarchy($items) {
    foreach ($items as $item) {
        $code = strval($item['code']);
        $name = htmlspecialchars($item['name']);
        $paid_current = number_format($item['paid_current'], 2);
        $spent_current = number_format($item['spent_current'], 2);
        $balance_current = number_format($item['balance_current'], 2);
        $paid_previous = number_format($item['paid_previous'], 2);
        $spent_previous = number_format($item['spent_previous'], 2);
        $balance_previous = number_format($item['balance_previous'], 2);
        $paid_sum = number_format($item['paid_sum'], 2);
        $spent_sum = number_format($item['spent_sum'], 2);
        $balance_sum = number_format($item['balance_sum'], 2);

        $d1 = $d2 = $d3 = $d4 = $d5 = "";

        if (strlen($code) == 1) $d1 = $code;
        if (strlen($code) == 2) $d2 = $code;
        if (strlen($code) == 3) $d3 = $code;
        if (strlen($code) == 4) $d4 = $code;
        if (strlen($code) == 5) $d5 = $code;

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

        if (!empty($item['children'])) {
            printHierarchy($item['children']);
        }
    }
}

// Output the table
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
printHierarchy($hierarchy);
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
