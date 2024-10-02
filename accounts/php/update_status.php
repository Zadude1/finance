<?php
header('Content-Type: application/json');
$response = array('success' => false);

session_start(); // Start the session

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['id_r']) && isset($_POST['new_status'])) {
        $id_r = $_POST['id_r'];
        $new_status = $_POST['new_status'];

        // Check if the user is logged in and is of user1 type
        if (isset($_SESSION['user']) && $_SESSION['user']['user_type'] == 'user1') {
            // Establish a connection to your database
            $servername = "localhost";
            $username = "root";
            $password = ""; // Empty password
            $dbname = "accounting";

            $conn = new mysqli($servername, $username, $password, $dbname);

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Update the type_of_receipt status
            $update_sql = "UPDATE receipt SET type_of_receipt = ? WHERE id_r = ?";
            $update_stmt = $conn->prepare($update_sql);
            $update_stmt->bind_param('ii', $new_status, $id_r);
            $editor_name = $_SESSION['username'];
            $editor_id = $_SESSION['user_id'];
            if ($update_stmt->execute()) {
                // If the update is successful, insert a record into receipt_record table
                $select_sql = "SELECT * FROM receipt WHERE id_r = ?";
                $select_stmt = $conn->prepare($select_sql);
                $select_stmt->bind_param('i', $id_r);
                $select_stmt->execute();
                $result = $select_stmt->get_result();

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                    $insert_sql = "INSERT INTO receipt_records (id_r, levels, from_per, money, c_number, name, data_in, year_r, type, date_ac, note, write_mo, id_u, id_col, id_s, c_date, type_of_receipt, editor_id, editor_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    $insert_stmt = $conn->prepare($insert_sql);
                    $insert_stmt->bind_param("issssssssssssssssss", $row['id_r'], $row['levels'], $row['from_per'], $row['money'], $row['c_number'], $row['name'], $row['data_in'], $row['year_r'], $row['type'], $row['date_ac'], $row['note'], $row['write_mo'], $row['id_u'], $row['id_col'], $row['id_s'], $row['c_date'], $row['type_of_receipt'], $editor_id, $editor_name);
                    
                    if ($insert_stmt->execute()) {
                        $response['success'] = true;
                    } else {
                        // Failed to insert into receipt_records table
                        $response['error'] = "Failed to insert into receipt_records table";
                    }
                } else {
                    // No rows found in receipt table for the given id_r
                    $response['error'] = "No rows found in receipt table for the given id_r";
                }
            } else {
                // Failed to update the type_of_receipt status
                $response['error'] = "Failed to update the type_of_receipt status";
            }

            // Close statements
            $update_stmt->close();
            if (isset($select_stmt)) {
                $select_stmt->close();
            }
            if (isset($insert_stmt)) {
                $insert_stmt->close();
            }

            // Close connection
            $conn->close();
        } else {
            // User is not authorized
            $response['error'] = "User is not authorized";
        }
    } else {
        // Invalid parameters in the POST request
        $response['error'] = "Invalid parameters in the POST request";
    }
} else {
    // Invalid request method
    $response['error'] = "Invalid request method";
}

echo json_encode($response);
?>
