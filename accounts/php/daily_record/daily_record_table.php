
<?php
session_start();

// Function to retrieve names from the database
function getNamesFromDatabase($input) {
    $conn = connectToDatabase();
    $input = $conn->real_escape_string($input);

    $sql = "SELECT id_s, name FROM student_info WHERE name LIKE '%$input%'";
    $result = $conn->query($sql);

    $names = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $names[] = array(
                'id_s' => $row['id_s'],
                'name' => $row['name']
            );
        }
    }

    $conn->close();
    return $names;
    
}if (isset($_POST['submitfinal'])) {
    $finalAmountWritten = end($_SESSION['transactions'])['amountWritten'] ?? '';
    $totalPaidAmount = 0;
    foreach ($_SESSION['transactions'] as $transaction) {
        if ($transaction['transactionType'] == 'paid') {
            $totalPaidAmount += intval($transaction['cashAmount']);
        }
    }
    $totalPaidAmountArabic = numtoarb($totalPaidAmount);
   
    $name2 = $_POST['name2'];
    $name3 = (float)$_POST['name3'];
    $college = $_POST['college'];
    $floatcollege = floatval($college);
    $level = $_POST['level'];
    $paymentfor = $_POST['paymentfor'];
    $studyYear = $_POST['studyYear'];
    $receivedFrom = $_POST['receivedFrom'];
    $id_s = $_POST['id_s'];
    $receivedInfo = $_POST['receivedInfo']; // Assuming you're using POST method
    $receivedInfo = mysqli_real_escape_string($conn, $receivedInfo);
    $number = $_POST['number'];
    $selected_date = $_POST['selected_date'];
    $field4 = isset($_POST['field4']) ? $_POST['field4'] : null;
    $field10 = date("Y-m-d H:i:s");
    $expenseid = $_POST['expenseid'];

    // Debug expenseid

    // Retrieve values from form for c_number and c_date
    $c_number = $_POST['cnumber'];
    $selected_cdate = $_POST['selected_cdate'];

    // Check if c_number is not 0, then proceed with checking
    if ($c_number != 0) {
        // Check if c_number already exists in the table
        $check_query = "SELECT COUNT(*) AS count FROM receipt WHERE c_number = '$c_number'";
        $result = mysqli_query($conn, $check_query);
        $row = mysqli_fetch_assoc($result);
        $count = $row['count'];

        // If c_number already exists, redirect to c_numberinfo.php
        if ($count > 0) {
            header("Location: c_numberinfo.php?c_number=$c_number");
            exit(); // Make sure to exit after redirection
        }
    }

    // Prepare SQL statement for receipt insertion
    $sql = "INSERT INTO daily_record (number, money, data_in, type, date_ac, note, from_per, write_mo, id_u, name, id_col, id_s, e_number, e_date, type_of_receipt, year_r, adder_name, added_date, in_number) 
    VALUES ('$number', '$totalPaidAmount', '$selected_date', '$paymentfor', '$field10', '$receivedInfo', '$receivedFrom', '$totalPaidAmountArabic', '{$_SESSION['user_id']}', '{$_SESSION['username']}', '$floatcollege', '$id_s', '$c_number', '$selected_cdate', '$field4', '$studyYear', '{$_SESSION['username']}', '$field10', '$expenseid')";

    // Print out the SQL query for debugging

    // Execute SQL statement for receipt insertion
    if(mysqli_query($conn, $sql)) {
        echo "";

        // Retrieve the auto-generated ID from the receipt table
        $id_r = mysqli_insert_id($conn);

        // Check if transactions exist in session
        if (!empty($_SESSION['transactions'])) {
            // Insert each transaction into the database
            foreach ($_SESSION['transactions'] as $transaction) {
                $timestamp = $transaction['timestamp'];
                $transactionType = $transaction['transactionType'];
                $cashAmount = $transaction['cashAmount'];
                $mainAccount = $transaction['mainAccount'];
                $subAccount = $transaction['subAccount'];




                // SQL query to insert transaction into transactions table
                $sql_detal = "INSERT INTO daily_record_detal (type, money, number_acc, id_dc) 
                        VALUES ('$transactionType', '$cashAmount', '$mainAccount', '$id_r')";

                if (mysqli_query($conn, $sql_detal)) {
                    echo "<br>";
                } else {
                    echo "Error: " . $sql_detal . "<br>" . mysqli_error($conn);
                }
            }
        }
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    // Close the connection
    mysqli_close($conn);
}
// Check if any other form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $cashAmount = isset($_POST["cashAmount"]) ? $_POST["cashAmount"] : "";
    $transactionType = isset($_POST["transactionType"]) ? $_POST["transactionType"] : "";
    $accountType = isset($_POST["accountType"]) ? $_POST["accountType"] : "";
    $accountNumber = isset($_POST["accountNumber"]) ? $_POST["accountNumber"] : 0;
    $college = isset($_POST["college"]) ? $_POST["college"] : "";
    $level = isset($_POST["level"]) ? $_POST["level"] : "";
    $studyYear = isset($_POST["studyYear"]) ? $_POST["studyYear"] : "";
    $receivedFrom = isset($_POST["receivedFrom"]) ? $_POST["receivedFrom"] : "";

    // Set Main or Sub account number based on the selected Account Type
    $mainAccount = "";
    $subAccount = "";

   // Ensure the session is started
session_start();

// Initialize the transactions array if it doesn't exist
if (!isset($_SESSION['transactions'])) {
    $_SESSION['transactions'] = array();
}

// Add transaction to the array with a running total, timestamp, and amount written
$totalAmount = end($_SESSION['transactions'])['totalAmount'] ?? 0;

if ($accountNumber == 0) {
    // If account number is 0, insert two rows
    $_SESSION['transactions'][] = array(
        'timestamp' => date("Y-m-d H:i:s"),
        'transactionType' => 'spent',
        'cashAmount' => $cashAmount,
        'accountType' => $accountType,
        'mainAccount' => 182, // Assuming 182 is the main account for 'spent'
        'subAccount' => "", // No sub account for 'spent'
        'accountNumber' => $accountNumber,
        'college' => $college,
        'level' => $level,
        'studyYear' => $studyYear,
        'receivedFrom' => $receivedFrom,
        'totalAmount' => intval($totalAmount) - intval($cashAmount), // Subtract if spent
        'amountWritten' => numtoarb(intval($totalAmount) - intval($cashAmount)) // Convert to integer
    );

        $_SESSION['transactions'][] = array(
            'timestamp' => date("Y-m-d H:i:s"),
            'transactionType' => 'paid',
            'cashAmount' => $cashAmount,
            'accountType' => $accountType,
            'mainAccount' => 435, // No main account for 'paid'
            'subAccount' => "",
            'accountNumber' => $accountNumber,
            'college' => $college,
            'level' => $level,
            'studyYear' => $studyYear,
            'receivedFrom' => $receivedFrom,
            'totalAmount' => intval($totalAmount), // No change in total amount for 'paid'
            'amountWritten' => numtoarb(intval($totalAmount)) // Convert to integer
        );
        

        // Recalculate total paid amount after adding the new transaction
        $totalPaidAmount = 0;
        foreach ($_SESSION['transactions'] as $transaction) {
            if ($transaction['transactionType'] == 'paid') {
                $totalPaidAmount += intval($transaction['cashAmount']);
            }
        }
    } else {
        // If account number is not 0, insert one row
        if ($accountType == 'main') {
            $mainAccount = $accountNumber;
            $subAccount = "";
        } elseif ($accountType == 'sub') {
            $mainAccount = "";
            $subAccount = $accountNumber;
        } else {
            // Handle the case where the account type is neither 'main' nor 'sub'
            // You can add custom logic here based on your requirements
            $mainAccount = "";
            $subAccount = "";
        }
        
        // Adjust total amount based on transaction type
        $adjustedAmount = $transactionType == 'paid' ? intval($totalAmount) + intval($cashAmount) : intval($totalAmount) - intval($cashAmount);

        $_SESSION['transactions'][] = array(
            'timestamp' => date("Y-m-d H:i:s"),
            'transactionType' => $transactionType,
            'cashAmount' => $cashAmount,
            'accountType' => $accountType,
            'mainAccount' => $mainAccount,
            'subAccount' => $subAccount,
            'accountNumber' => $accountNumber,
            'college' => $college,
            'level' => $level,
            'studyYear' => $studyYear,
            'receivedFrom' => $receivedFrom,
            'totalAmount' => $adjustedAmount,
            'amountWritten' => numtoarb($adjustedAmount) // Convert to integer
        );

        // Recalculate total paid amount after adding the new transaction
        $totalPaidAmount = 0;
        foreach ($_SESSION['transactions'] as $transaction) {
            if ($transaction['transactionType'] == 'paid') {
                $totalPaidAmount += intval($transaction['cashAmount']);
            }
        }
    }
}

// Check if the "Empty Table" button is clicked
if (isset($_POST["emptyTable"])) {
    $_SESSION['transactions'] = []; // Empty the transactions array
}
?>