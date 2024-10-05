<!DOCTYPE html>
<html>
<head>
    <title>Receipt Details</title>
    
    <style>
    /* CSS for styling the black rectangle */
    .form-container {
        border: 2px solid black;
        padding: 20px; /* Add some padding inside the rectangle */
        width: 80%; /* Adjust width as needed */
        margin: auto; /* Center the rectangle */
    }

    /* Rest of your existing CSS styles */
    #print-button {
        font-size: 20px; /* Increase font size */
        padding: 12px 20px; /* Adjust padding as needed */
    }

    table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 1px solid black; /* Set borders for all sides */
    text-align: left;
    padding: 8px;
}

th {
    background-color: #f2f2f2; /* Set background color for table headers */
}

/* Separate the two columns with a vertical line */
td:nth-child(odd) {
    border-right: 2px solid black;
}

/* Add bottom border to the last row for total */
tr:last-child td {
    border-bottom: 2px solid black; /* Add a thicker border for the total row */
}

    /* Hide the button and form when printing */
    @media print {
        button#print-button,
        form#print-form,
        a#print-links {
            display: none;
        }

        /* Add margin on left and right */
        body {
            margin-left: 10%;
            margin-right: 10%;
        }

        /* Add watermark image */
        body::after {
            content: url('watermark.png');
            opacity: 0.8; /* Adjust opacity as needed */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
    }
    </style>
</head>
<body>
<div style='text-align: center;'>
        <h3>وزارة التعليم العالي والبحث العلمي<h3>
        <h3>جامعة العين العراقية الاهلية<h3>
        <h2>وصل قبض</h2>
    </div>
<div class="form-container"> <!-- Enclosing the form in a black rectangle -->
    

    <form id="print-form" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        Enter Receipt ID: <input type="text" name="id_r" value="<?php echo isset($_GET['id_r']) ? $_GET['id_r'] : ''; ?>">
        <input type="submit" id="submit-form" value="Submit">
    </form>


<?php
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve the entered id_r
    $id_r = $_POST['id_r'];

    // Connect to the database
    include "../php/env/db.php";

    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare SQL statement to select rows for the given id_r from receipt_detail
    $sql_detail = "SELECT * FROM receipt_detal WHERE id_r = ?";
    $stmt_detail = $conn->prepare($sql_detail);
    $stmt_detail->bind_param("s", $id_r);
    $stmt_detail->execute();
    $result_detail = $stmt_detail->get_result();

    // Prepare SQL statement to select note, from_per, write_mo, and type_of_receipt from receipt based on id_r
    $sql_receipt = "SELECT note, from_per, write_mo, type_of_receipt FROM receipt WHERE id_r = ?";
    $stmt_receipt = $conn->prepare($sql_receipt);
    $stmt_receipt->bind_param("s", $id_r);
    $stmt_receipt->execute();
    $result_receipt = $stmt_receipt->get_result();

    // Prepare SQL statement to select history records from receipt based on id_r
    $sql_history = "SELECT data_in , id_r FROM receipt WHERE id_r = ?";
    $stmt_history = $conn->prepare($sql_history);
    $stmt_history->bind_param("s", $id_r);
    $stmt_history->execute();
    $result_history = $stmt_history->get_result();

    // Display history from receipt
    if ($result_history->num_rows > 0) {
        echo "<div style='display: flex; justify-content: space-between;'>";
        echo "<div><b>العدد</b></div>";
        echo "<div><b>التاريخ</b></div>";
        echo "</div>";
        while ($row_history = $result_history->fetch_assoc()) {
            echo "<div style='display: flex; justify-content: space-between;'>";
            echo "<div>{$row_history["id_r"]}</div>";
            echo "<div>" . date('Y-m-d', strtotime($row_history["data_in"])) . "</div>";
            echo "</div>";
        }
        echo "</table>";
    } else {
        echo "No history found for this receipt";
    }

    if ($result_detail->num_rows > 0) {
        // Display table header for receipt_detail
        echo "<table style='margin: auto;'>";
        echo "<tr><th style='text-align: center;'>الحساب</th><th style='text-align: center;'>المبلغ</th></tr>";
        $total_money = 0; // Initialize total money

        // Output data of each row for receipt_detail
        while ($row_detail = $result_detail->fetch_assoc()) {
            echo "<tr><td style='text-align: center; border: 1px solid white; border-right-color: black;'>" . $row_detail["number_acc"] . "</td><td style='text-align: center; border: 1px solid white; border-left-color: black;'>" . $row_detail["money"] . "</td></tr>";
            // Add money to total
            $total_money += $row_detail["money"] / 2;
        }
        // Display total money
        echo "<tr style='border: 2px solid black;'><td style='text-align: center; border: 2px solid black;'><b>" . $total_money . "</b></td><td style='text-align: center; border: 2px solid black;'><b>المجموع</b></td></tr>";
        echo "</table>";
    } else {
        echo "0 results in receipt_detail";
    }

    if ($result_receipt->num_rows > 0) {
        echo "<div style='text-align: center;'>"; // Center-align the content
        echo "<br>";
        echo "<br>";
        echo "<table>";

        // Output data of the receipt
        while ($row_receipt = $result_receipt->fetch_assoc()) {
            $note = $row_receipt["note"];
            // Check if type_of_receipt is 1 (Active)
            if ($row_receipt["type_of_receipt"] == 1) {
                // Add "Inactive" text on both sides of the note
                $note = "بطال " . $note . " بطال";
            }

            echo $note;
            echo "<br>";
            echo "<br>";
            echo "<tr><td style='text-align: right; border-right: 1px solid white;'>" . $row_receipt["from_per"] . "</td><td>استلمت من السيد</td></tr>";
echo "<tr><td style='text-align: right; border-right: 1px solid white;'>" . $row_receipt["write_mo"] . " دينار عراقي</td><td style='border-left: 1px solid white;'>مبلغ قدره</td></tr>";
echo "<tr><td style='text-align: right; border-right: 1px solid white;'>كرار هاتف</td><td>اسم القابض</td></tr>";
    
        }
        echo "</table>";
    } else {
        echo "0 results in receipt";
    }

    // Close statements and connection
    $stmt_detail->close();
    $stmt_receipt->close();
$stmt_history->close();
$conn->close();
}

?>

<button id="print-button" onclick="printPage()">طباعة</button>

<script>
window.onload = function() {
    var formSubmitted = localStorage.getItem('formSubmitted');
    if (!formSubmitted) {
        document.getElementById('print-form').submit(); // Submit the form on page load
        localStorage.setItem('formSubmitted', 'true');
    }
}

function printPage() {
    window.print(); // Print the page
}
</script>
<script>
function submitFormAndPrint() {
    // Submit the form asynchronously
    var formData = new FormData(document.getElementById('print-form'));
    var xhr = new XMLHttpRequest();
    xhr.open('POST', document.getElementById('print-form').getAttribute('action'), true);
    xhr.onload = function () {
        // After successful form submission, trigger printing
        window.print();
    };
    xhr.send(formData);
}
</script>
<br>
<a id="print-links" href="sidebar2.php" style="font-size: x-large;">العودة لاضافة وصل</a>
<br>
<br>
<a id="print-links" href="sidebar3.php" style="font-size: x-large;">العودة للبحث عن طالب</a>
</body>
</html>
