<?php
    include "../php/env/db.php";

// Initialize variables
$year = '';
$month = '';
$results = [];
$perPage = 24; // Number of rows per page

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $year = $_POST['year'];
    $month = $_POST['month'];

    // Validate year and month input
    if (empty($year) || !is_numeric($year) || empty($month) || !is_numeric($month) || $month < 1 || $month > 12) {
        echo "Please enter a valid year and month.";
        $conn->close();
        exit;
    }

    // Query to get records for the given year and month
    $sql = "SELECT * FROM fund_record WHERE YEAR(date) = ? AND MONTH(date) = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("ss", $year, $month);
    if (!$stmt->execute()) {
        die("Execute failed: " . $stmt->error);
    }

    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        // Fetch all rows
        $results = $result->fetch_all(MYSQLI_ASSOC);
    } else {
        echo "No records found for the year $year and month $month.";
    }
}
$conn->close();

// Calculate totals
$totals = [
    'Receipts' => 0,
    'Payments' => 0,
    'Deposits' => 0,
    'Draws' => 0
];
$totalRows = count($results);
$totalPages = ceil($totalRows / $perPage);
?>