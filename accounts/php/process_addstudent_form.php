<?php

// Database configuration
$host = 'localhost';
$dbname = 'accounting';
$user = 'root'; // Empty for XAMPP localhost
$password = ''; // Empty for XAMPP localhost

try {
    // Establish database connection
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

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

        // Insert into status_info table
        $queryStatusInfo = "INSERT INTO status_info (id_s, id_l, level_num, date, status, year, adder_name, create_date) 
                            VALUES (NULL, :id_l, :level_num, :date, :status, :year, :adder_name, :create_date)";
        $stmtStatusInfo = $pdo->prepare($queryStatusInfo);
        $stmtStatusInfo->bindParam(":id_l", $id_l);
        $stmtStatusInfo->bindParam(":level_num", $level_num);
        $stmtStatusInfo->bindParam(":date", $date);
        $stmtStatusInfo->bindParam(":status", $status);
        $stmtStatusInfo->bindParam(":year", $year);
        $stmtStatusInfo->bindParam(":adder_name", $adder_name);
        $stmtStatusInfo->bindParam(":create_date", $create_date);

        // Set values for the status_info table (adjust as needed)
        $id_l = 1; // Example value, adjust based on your data

        // Execute the status_info query
        $stmtStatusInfo->execute();

        // Insert into student_info table
        $queryStudentInfo = "INSERT INTO student_info (id_s, name, brithday, code, phone, phone_p, email, id_col, adder_name, create_date) 
                             VALUES (NULL, :name, :birthday, :code, :phone, :phone_p, :email, :id_col, :adder_name, :create_date)";
        $stmtStudentInfo = $pdo->prepare($queryStudentInfo);
        $stmtStudentInfo->bindParam(":name", $name);
        $stmtStudentInfo->bindParam(":birthday", $birthday);
        $stmtStudentInfo->bindParam(":code", $code);
        $stmtStudentInfo->bindParam(":phone", $phone);
        $stmtStudentInfo->bindParam(":phone_p", $phone_p);
        $stmtStudentInfo->bindParam(":email", $email);
        $stmtStudentInfo->bindParam(":id_col", $id_col);
        $stmtStudentInfo->bindParam(":adder_name", $adder_name);
        $stmtStudentInfo->bindParam(":create_date", $create_date);

        // Execute the student_info query
        $stmtStudentInfo->execute();

        // Redirect or show a success message
        header("Location: ../view/sidebar_addstudent.php");
        exit();
    }
} catch (PDOException $e) {
    // Handle database connection error
    die("Error: " . $e->getMessage());
} finally {
    // Close the database connection
    $pdo = null;
}
?>
