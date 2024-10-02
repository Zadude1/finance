<!DOCTYPE html>
<html>
<head>
    <title>Voucher Details</title>
    <style>
        .container {
            display: flex;
        }

        .left-column {
            flex: 1;
            padding: 20px;
            border-right: 1px solid #ddd; /* Add border to distinguish columns */
        }

        .right-column {
            flex: 2;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "store";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get voucher_id from URL
$voucher_id = isset($_GET['voucher_id']) ? intval($_GET['voucher_id']) : 0;

if ($voucher_id > 0) {
    // Query to get receiver_name based on voucher_id
    $receiver_query = "SELECT receiver_name FROM voucher WHERE voucher_id = $voucher_id";
    $receiver_result = $conn->query($receiver_query);

    if ($receiver_result->num_rows > 0) {
        $receiver_row = $receiver_result->fetch_assoc();
        $receiver_name = $receiver_row['receiver_name'];
    } else {
        $receiver_name = "Receiver not found";
    }

    // Query to get voucher details
    $details_query = "SELECT voucher_id, received_date, account FROM voucher WHERE voucher_id = $voucher_id";
    $details_result = $conn->query($details_query);
} else {
    $receiver_name = "Invalid voucher_id";
}
?>

<div class="container">
    <div class="left-column">
        <h3>Receiver Name:</h3>
        <p><?php echo htmlspecialchars($receiver_name); ?></p>
    </div>
    <div class="right-column">
        <h3>Voucher Details</h3>
        <?php if (isset($details_result) && $details_result->num_rows > 0): ?>
            <table border="1">
                <tr>
                    <th>Voucher ID</th>
                    <th>Received Date</th>
                    <th>Account</th>
                </tr>
                <?php while($row = $details_result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['voucher_id']); ?></td>
                    <td><?php echo htmlspecialchars($row['received_date']); ?></td>
                    <td><?php echo htmlspecialchars($row['account']); ?></td>
                </tr>
                <?php endwhile; ?>
            </table>
        <?php else: ?>
            <p>No details found for this voucher.</p>
        <?php endif; ?>
    </div>
</div>

<?php
$conn->close();
?>

</body>
</html>
