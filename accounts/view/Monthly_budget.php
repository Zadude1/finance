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

// Query to join cost_acc and expense_detal, and calculate paid, spent, and balance for current and previous months
$sql = "
SELECT 
    ca.code, ca.name,

    -- Current Month
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(CURDATE()) AND YEAR(ed.added_date) = YEAR(CURDATE()) THEN ed.money ELSE 0 END) AS paid_current,
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(CURDATE()) AND YEAR(ed.added_date) = YEAR(CURDATE()) THEN ed.money ELSE 0 END) AS spent_current,
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(CURDATE()) AND YEAR(ed.added_date) = YEAR(CURDATE()) THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(CURDATE()) AND YEAR(ed.added_date) = YEAR(CURDATE()) THEN ed.money ELSE 0 END) AS balance_current,

    -- Previous Month
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(ed.added_date) = YEAR(CURDATE() - INTERVAL 1 MONTH) THEN ed.money ELSE 0 END) AS paid_previous,
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(ed.added_date) = YEAR(CURDATE() - INTERVAL 1 MONTH) THEN ed.money ELSE 0 END) AS spent_previous,
    SUM(CASE WHEN ed.type = 'paid' AND MONTH(ed.added_date) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(ed.added_date) = YEAR(CURDATE() - INTERVAL 1 MONTH) THEN ed.money ELSE 0 END) - 
    SUM(CASE WHEN ed.type = 'spent' AND MONTH(ed.added_date) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(ed.added_date) = YEAR(CURDATE() - INTERVAL 1 MONTH) THEN ed.money ELSE 0 END) AS balance_previous

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
    <th>d1</th>
    <th>d2</th>
    <th>d3</th>
    <th>d4</th>
    <th>d5</th>
    <th>Name</th>
    <th>Paid Current Month</th>
    <th>Spent Current Month</th>
    <th>Balance Current Month</th>
    <th>Paid Previous Month</th>
    <th>Spent Previous Month</th>
    <th>Balance Previous Month</th>
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

            if (strlen($code) == $i && strpos($code, $digit_str) === 0) {
                $d1 = $d2 = $d3 = $d4 = $d5 = "";

                if ($i >= 1) $d1 = $code[0];
                if ($i >= 2) $d2 = substr($code, 0, 2);
                if ($i >= 3) $d3 = substr($code, 0, 3);
                if ($i >= 4) $d4 = substr($code, 0, 4);
                if ($i >= 5) $d5 = substr($code, 0, 5);

                echo "<tr>
                    <td>$d1</td>
                    <td>$d2</td>
                    <td>$d3</td>
                    <td>$d4</td>
                    <td>$d5</td>
                    <td>$name</td>
                    <td>$paid_current</td>
                    <td>$spent_current</td>
                    <td>$balance_current</td>
                    <td>$paid_previous</td>
                    <td>$spent_previous</td>
                    <td>$balance_previous</td>
                </tr>";
            }
        }
    }
}

echo "</table>";

$conn->close();
?>
