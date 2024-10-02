<?php
$level = "";
$receipt_id = "";
$from_per = "";
$money = "";
$data_in = "";
$type = "";
$date_ac = "";
$note = "";
$write_mo = "";
$id_u = "";
$name = "";
$id_col = "";
$id_s = "";
$c_number = "";
$c_date = "";
$type_of_receipt = "";
$year_r = "";
$total_money = 0; // Initialize total_money variable

// Check if ID is provided in the URL
if(isset($_GET['id_r']) && !empty($_GET['id_r'])) {
    $receipt_id = $_GET['id_r']; // Get the receipt ID from the URL

    // Fetch data for the selected receipt from the database
    $servername = "localhost";
    $username = "root";
    $password = ""; // Empty password
    $dbname = "accounting";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare and execute the query to fetch receipt data for editing
    $stmt = $conn->prepare("SELECT * FROM receipt WHERE id_r = ?");
    $stmt->bind_param("i", $receipt_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch the data
        $row = $result->fetch_assoc();
        $from_per = $row['from_per'];
        $money = $row['money'];
        $data_in = date('Y-m-d', strtotime($row['data_in']));
        $type = $row['type'];
        $date_ac = date('Y-m-d', strtotime($row['date_ac']));
        $note = $row['note'];
        $id_u = $row['id_u'];
        $name = $row['name'];
        $id_col = $row['id_col'];
        $id_s = $row['id_s'];
        $c_number = $row['c_number'];
        $c_date = date('Y-m-d', strtotime($row['c_date']));
        $type_of_receipt = $row['type_of_receipt'];
        $year_r = $row['year_r'];
        $level = $row['levels'];

        // Fetch the sum of money from receipt_detail table
        $stmt_sum = $conn->prepare("SELECT SUM(money) AS total_money FROM receipt_detal WHERE id_r = ? AND type = 'paid'");
        $stmt_sum->bind_param("i", $receipt_id);
        $stmt_sum->execute();
        $result_sum = $stmt_sum->get_result();

        if ($result_sum->num_rows > 0) {
            $row_sum = $result_sum->fetch_assoc();
            $total_money = $row_sum['total_money'];

            // Convert total_money to Arabic words
            $write_mo = numtoarb($total_money);
        }
    } else {
        echo "No receipt found with ID: $receipt_id";
    }

    $stmt->close();
    $conn->close();
} else {
    echo "No receipt ID provided";
}
?>
