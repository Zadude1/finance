<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Expense</title>
    <link rel="stylesheet" href="../css/styleexpenseedit.css"> <!-- Link to your external CSS file -->
</head>
<body>
    <div class="container">
        <?php
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "accounting";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        if (isset($_GET['id_e'])) {
            $id_e = $_GET['id_e'];

            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                // Update main expense table
                $number = $_POST['number'];
                $money = $_POST['money'];
                $data_in = $_POST['data_in'];
                $type = $_POST['type'];
                $date_ac = $_POST['date_ac'];
                $note = $_POST['note'];
                $from_per = $_POST['from_per'];
                $write_mo = $_POST['write_mo'];
                $id_u = $_POST['id_u'];
                $name = $_POST['name'];
                $id_col = $_POST['id_col'];
                $id_s = $_POST['id_s'];
                $d_number = $_POST['d_number'];
                $d_date = $_POST['d_date'];
                $type_of_receipt = $_POST['type_of_receipt'];
                $year_r = $_POST['year_r'];
                $in_number = $_POST['in_number'];
                $in_date = $_POST['in_date'];
                $in_amount = $_POST['in_amount'];
                $adder_name = $_POST['adder_name'];
                $added_date = $_POST['added_date'];
                $updater_name = $_POST['updater_name'];
                $updated_date = date('Y-m-d'); // Set to current date

                $sql = "UPDATE expense SET 
                        number='$number', money='$money', data_in='$data_in', type='$type', 
                        date_ac='$date_ac', note='$note', from_per='$from_per', write_mo='$write_mo', 
                        id_u='$id_u', name='$name', id_col='$id_col', id_s='$id_s', 
                        d_number='$d_number', d_date='$d_date', type_of_receipt='$type_of_receipt', 
                        year_r='$year_r', in_number='$in_number', in_date='$in_date', 
                        in_amount='$in_amount', adder_name='$adder_name', added_date='$added_date', 
                        updater_name='$updater_name', updated_date='$updated_date' 
                        WHERE id_e=$id_e";

                if ($conn->query($sql) === TRUE) {
                    echo "<div class='success'>Record updated successfully</div>";
                } else {
                    echo "<div class='error'>Error updating record: " . $conn->error . "</div>";
                }

                // Update expense_detal table if details are present
                if (isset($_POST['details']) && is_array($_POST['details'])) {
                    foreach ($_POST['details'] as $detail_id => $detail) {
                        $id_d = $detail_id; // Assuming detail IDs are passed as keys in details array
                        $money = $detail['money'];
                        $type = $detail['type'];
                        $number_acc = $detail['number_acc'];
                        $number_ber = $detail['number_ber'];
                        $id_cost = $detail['id_cost'];
                        $adder_name = $detail['adder_name'];
                        $added_date = $detail['added_date'];
                        $updater_name = $detail['updater_name'];
                        $updated_date = date('Y-m-d'); // Set to current date

                        $sql_detail = "UPDATE expense_detal SET 
                                        money='$money', type='$type', number_acc='$number_acc', number_ber='$number_ber', 
                                        id_cost='$id_cost', adder_name='$adder_name', added_date='$added_date', 
                                        updater_name='$updater_name', updated_date='$updated_date' 
                                        WHERE id_d=$id_d";

                        if ($conn->query($sql_detail) === TRUE) {
                            echo "<div class='success'>Detail record $id_d updated successfully</div>";
                        } else {
                            echo "<div class='error'>Error updating detail record $id_d: " . $conn->error . "</div>";
                        }
                    }
                }
            }

            // Fetch main expense record for editing
            $sql = "SELECT * FROM expense WHERE id_e=$id_e";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();

                // Format the dates to YYYY-MM-DD for HTML input type="date"
                $data_in = date('Y-m-d', strtotime($row['data_in']));
                $date_ac = date('Y-m-d', strtotime($row['date_ac']));
                $d_date = date('Y-m-d', strtotime($row['d_date']));
                $in_date = date('Y-m-d', strtotime($row['in_date']));
                $added_date = date('Y-m-d', strtotime($row['added_date']));
                $updated_date = date('Y-m-d'); // Current Date for updated_date

                ?>
                <h1>Edit Expense</h1>
                <form method="post" action="">
                    <label>Number:</label><br>
                    <input type="text" name="number" value="<?php echo $row['number']; ?>"><br>
                    <label>Money:</label><br>
                    <input type="text" name="money" value="<?php echo $row['money']; ?>"><br>
                    <label>Data In:</label><br>
                    <input type="date" name="data_in" value="<?php echo $data_in; ?>"><br>
                    <label>Type:</label><br>
                    <input type="text" name="type" value="<?php echo $row['type']; ?>"><br>
                    <label>Date AC:</label><br>
                    <input type="date" name="date_ac" value="<?php echo $date_ac; ?>"><br>
                    <label>Note:</label><br>
                    <input type="text" name="note" value="<?php echo $row['note']; ?>"><br>
                    <label>From Per:</label><br>
                    <input type="text" name="from_per" value="<?php echo $row['from_per']; ?>"><br>
                    <label>Write Mo:</label><br>
                    <input type="text" name="write_mo" value="<?php echo $row['write_mo']; ?>"><br>
                    <label>ID U:</label><br>
                    <input type="text" name="id_u" value="<?php echo $row['id_u']; ?>"><br>
                    <label>Name:</label><br>
                    <input type="text" name="name" value="<?php echo $row['name']; ?>"><br>
                    <label>ID Col:</label><br>
                    <input type="text" name="id_col" value="<?php echo $row['id_col']; ?>"><br>
                    <label>ID S:</label><br>
                    <input type="text" name="id_s" value="<?php echo $row['id_s']; ?>"><br>
                    <label>D Number:</label><br>
                    <input type="text" name="d_number" value="<?php echo $row['d_number']; ?>"><br>
                    <label>D Date:</label><br>
                    <input type="date" name="d_date" value="<?php echo $d_date; ?>"><br>
                    <label>Type of Receipt:</label><br>
                    <input type="text" name="type_of_receipt" value="<?php echo $row['type_of_receipt']; ?>"><br>
                    <label>Year R:</label><br>
                    <input type="text" name="year_r" value="<?php echo $row['year_r']; ?>"><br>
                    <label>In Number:</label><br>
                    <input type="text" name="in_number" value="<?php echo $row['in_number']; ?>"><br>
                    <label>In Date:</label><br>
                    <input type="date" name="in_date" value="<?php echo $in_date; ?>"><br>
                    <label>In Amount:</label><br>
                    <input type="text" name="in_amount" value="<?php echo $row['in_amount']; ?>"><br>
                    <label>Adder Name:</label><br>
                    <input type="text" name="adder_name" value="<?php echo $row['adder_name']; ?>"><br>
                    <label>Added Date:</label><br>
                    <input type="date" name="added_date" value="<?php echo $added_date; ?>"><br>
                    <label>Updater Name:</label><br>
                    <input type="text" name="updater_name" value="<?php echo $row['updater_name']; ?>"><br>
                    <label>Updated Date:</label><br>
                    <input type="date" name="updated_date" value="<?php echo $updated_date; ?>"><br>
                    
                                   </form>
                                    <h2>Expense Details</h2>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Money</th>
                            <th>Type</th>
                            <th>Number Acc</th>
                            <th>Number Ber</th>
                            <th>ID Cost</th>
                            <th>Adder Name</th>
                            <th>Added Date</th>
                            <th>Updater Name</th>
                            <th>Updated Date</th>
                        </tr>
                        <?php
                        // Fetch expense details for editing
                        $sql_details = "SELECT * FROM expense_detal WHERE id_e=$id_e";
                        $result_details = $conn->query($sql_details);

                        if ($result_details->num_rows > 0) {
                            while ($row_details = $result_details->fetch_assoc()) {
                                $detail_added_date = date('Y-m-d', strtotime($row_details['added_date']));
                                $detail_updated_date = date('Y-m-d', strtotime($row_details['updated_date']));
                                ?>
                                <tr>
                                    <td><?php echo $row_details['id_d']; ?></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][money]" value="<?php echo $row_details['money']; ?>"></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][type]" value="<?php echo $row_details['type']; ?>"></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][number_acc]" value="<?php echo $row_details['number_acc']; ?>"></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][number_ber]" value="<?php echo $row_details['number_ber']; ?>"></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][id_cost]" value="<?php echo $row_details['id_cost']; ?>"></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][adder_name]" value="<?php echo $row_details['adder_name']; ?>"></td>
                                    <td><input type="date" name="details[<?php echo $row_details['id_d']; ?>][added_date]" value="<?php echo $detail_added_date; ?>"></td>
                                    <td><input type="text" name="details[<?php echo $row_details['id_d']; ?>][updater_name]" value="<?php echo $row_details['updater_name']; ?>"></td>
                                    <td><input type="date" name="details[<?php echo $row_details['id_d']; ?>][updated_date]" value="<?php echo $detail_updated_date; ?>"></td>
                                </tr>
                                <?php
                            }
                        } else {
                            echo "<tr><td colspan='10'>No details found</td></tr>";
                        }
                        ?>
                    </table>
                    <input type="submit" value="Update">

                <?php
            } else {
                echo "Record not found";
            }
        } else {
            echo "Invalid request";
        }

        $conn->close();
        ?>
    </div>
</body>
</html>
