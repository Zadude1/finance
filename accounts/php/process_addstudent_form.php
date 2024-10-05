<?php

// Include the database connection
include '../php/env/db.php';

try {
    // Check if the form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve form data
        $name = $_POST["name"];
        $birthday = $_POST["birthday"];
        $code = $_POST["code"];
        $phone = $_POST["phone"];
        $phone_p = $_POST["phone_p"];
        $email = $_POST["email"];
        $id_col = $_POST["id_col"];
        $level_num = $_POST["level_num"];
        $date = $_POST["date"];
        $status = $_POST["status"];
        $year = $_POST["year"];
        $adder_name = $_POST["adder_name"];
        $create_date = $_POST["create_date"];

        // Insert into student_info table first
        $queryStudentInfo = "INSERT INTO student_info (id_s, name, brithday, code, phone, phone_p, email, id_col, adder_name, create_date) 
                             VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmtStudentInfo = $conn->prepare($queryStudentInfo);
        $stmtStudentInfo->bind_param("sssssssss", $name, $birthday, $code, $phone, $phone_p, $email, $id_col, $adder_name, $create_date);
        
        // Execute the student_info query
        $stmtStudentInfo->execute();
        
        // Get the last inserted id (id_s) from the student_info table
        $id_s = $conn->insert_id;

        // Now insert into status_info table with the retrieved id_s
        $queryStatusInfo = "INSERT INTO status_info (id_s, id_l, level_num, date, status, year, adder_name, create_date) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmtStatusInfo = $conn->prepare($queryStatusInfo);
        $stmtStatusInfo->bind_param("iissssss", $id_s, $id_l, $level_num, $date, $status, $year, $adder_name, $create_date);

        // Set values for id_l (adjust as needed)
        $id_l = 1; // Example value, adjust based on your data
        
        // Execute the status_info query
        $stmtStatusInfo->execute();

        // Redirect or show a success message
        header("Location: ../view/sidebar_addstudent.php");
        exit();
    }
} catch (mysqli_sql_exception $e) {
    // Handle database connection error
    die("Error: " . $e->getMessage());
} finally {
    // Close the database connection
    $conn->close();
}
?>
