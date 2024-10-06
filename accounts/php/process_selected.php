<?php
// Database connection
$servername = "localhost";
$username = "root"; // Replace with your database username
$password = "";     // Replace with your database password
$dbname = "accounting";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Process form submission if POST data is received
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['selected_ids'])) {
    // Retrieve selected IDs from the form
    $selected_ids = $_POST['selected_ids'];

    // Ensure $selected_ids is not empty
    if (!empty($selected_ids)) {
        // Prepare statement for inserting into status_info table
        $stmt = $conn->prepare("INSERT INTO status_info (id_s, id_l, level_num, date, status, year, adder_name, create_date, updater_user, update_date) 
                                SELECT id_s, id_l, level_num, date, status, year, adder_name, create_date, updater_user, update_date 
                                FROM status_info 
                                WHERE id_s = ?");
        
        // Bind parameters
        $stmt->bind_param("i", $id_col);
        
        // Insert each selected row
        foreach ($selected_ids as $id_col) {
            if (!$stmt->execute()) {
                echo "Error: " . $stmt->error;
            }
        }
        
        // Close statement
        $stmt->close();
        
        echo "Selected rows inserted successfully into status_info table.";
    } else {
        echo "No rows selected.";
    }
} else {
    echo "Form not submitted or no rows selected.";
}

// Close connection
$conn->close();
?>
