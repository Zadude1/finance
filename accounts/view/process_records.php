<?php
    include "../php/env/db.php";


mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT); // Enable error reporting

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $year = $_POST['year'];

    try {
        // Delete existing records in fund_record for the selected year
        $delete_sql = "DELETE FROM fund_record WHERE YEAR(date) = ?";
        $delete_stmt = $conn->prepare($delete_sql);
        if (!$delete_stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        $delete_stmt->bind_param("s", $year);
        if (!$delete_stmt->execute()) {
            throw new Exception("Execute failed: " . $delete_stmt->error);
        }

        // Query to get receipts, expenses, and daily records for the given year
        $sql = "SELECT 'receipt' AS source, r.id_r, r.number, r.data_in, r.from_per, r.write_mo, r.c_number, r.c_date, r.note, r.id_u,
        d.money, d.type AS detail_type, d.number_acc 
        FROM receipt r 
        JOIN receipt_detal d ON r.id_r = d.id_r 
        WHERE YEAR(r.data_in) = ?
        UNION ALL
        SELECT 'expense' AS source, e.id_e AS id_r, e.number, e.data_in, e.from_per, e.write_mo, e.d_number AS c_number, e.d_date AS c_date, e.note, e.id_u,
        ed.money, ed.type AS detail_type, ed.number_acc 
        FROM expense e 
        JOIN expense_detal ed ON e.id_e = ed.id_e 
        WHERE YEAR(e.data_in) = ?
        UNION ALL
        SELECT 'daily_record' AS source, dr.id_dc AS id_r, dr.number, dr.data_in, dr.from_per, dr.write_mo, dr.e_number AS c_number, dr.e_date AS c_date, dr.note, dr.id_u,
        drd.money, drd.type AS detail_type, drd.number_acc 
        FROM daily_record dr
        JOIN daily_record_detal drd ON dr.id_dc = drd.id_dc 
        WHERE YEAR(dr.data_in) = ?";

        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }

        $stmt->bind_param("sss", $year, $year, $year);
        if (!$stmt->execute()) {
            throw new Exception("Execute failed: " . $stmt->error);
        }

        $result = $stmt->get_result();
        if (!$result) {
            throw new Exception("Get result failed: " . $stmt->error);
        }

        // Prepare the insert statement for fund_record
        $fund_sql = "INSERT INTO fund_record 
                     (number, Receipts, Payments, Deposits, Draws, name_Receipts, name_Payments, type, record_number, date, Daily_sequence, c_number, c_date, note, id_m) 
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $fund_stmt = $conn->prepare($fund_sql);
        if (!$fund_stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }

        while ($row = $result->fetch_assoc()) {
            $source = $row['source'];
            $number_acc = $row['number_acc'];
            $type = strtolower($row['detail_type']);
            $money = $row['money'];

            $receipts = $payments = $deposits = $draws = 0;

            if ($source == 'receipt') {
                if ($number_acc == 181) {
                    $receipts = $money;
                } elseif ($number_acc == 182) {
                    $deposits = $money;
                }
            } elseif ($source == 'expense') {
                if ($number_acc == 181) {
                    if ($type == 'paid') {
                        $receipts = $money;
                    } elseif ($type == 'spent') {
                        $payments = $money;
                    }
                } elseif ($number_acc == 182) {
                    if ($type == 'paid') {
                        $deposits = $money;
                    } elseif ($type == 'spent') {
                        $draws = $money;
                    }
                }
            } elseif ($source == 'daily_record') {
                if ($number_acc == 181) {
                    $receipts = $money;
                } elseif ($number_acc == 182) {
                    $deposits = $money;
                }
            }

            $name_receipts = substr($row['from_per'], 0, 255); // Adjust length as needed

            // Bind parameters and execute the insert statement
            $fund_stmt->bind_param("dddddssssssssss", 
                $row['number'], $receipts, $payments, $deposits, $draws, 
                $name_receipts, $name_receipts, $source, 
                $row['id_r'], $row['data_in'], $row['id_r'], 
                $row['c_number'], $row['c_date'], $row['note'], $row['id_u']
            );

            if (!$fund_stmt->execute()) {
                throw new Exception("Execute failed: " . $fund_stmt->error);
            }
        }

        echo "Data has been moved successfully.";
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}

$conn->close();
?>


<!DOCTYPE html>
<html>
<head>
    <title>Search Receipts, Expenses, and Daily Records by Year</title>
    <link rel="stylesheet" href="../css/stylee.css">

</head>
<body>
    <form method="POST" action="process_records.php">
        <label for="year">اختر السنة:</label>
        <input type="text" id="year" name="year" required>
        <input type="submit" value="ارسال البيانات الى سجل الصندوق" style="background-color: red; color: white;">
    </form>
</body>
</html>
