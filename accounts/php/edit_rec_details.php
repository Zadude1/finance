<style>
.action-button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>

<?php
session_start();

// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "accounting";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission for updating existing rows
// Handle form submission for updating existing rows
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    foreach($_POST["id_d"] as $key => $value) {
        $value = mysqli_real_escape_string($conn, $value); // Sanitize input
        $money = mysqli_real_escape_string($conn, $_POST["money"][$key]);
        $type = mysqli_real_escape_string($conn, $_POST["type"][$key]);
        $number_acc = mysqli_real_escape_string($conn, $_POST["number_acc"][$key]);
        $number_ber = mysqli_real_escape_string($conn, $_POST["number_ber"][$key]);
        $id_cost = mysqli_real_escape_string($conn, $_POST["id_cost"][$key]);
        
        // Update each field separately
        $sql_update = "UPDATE receipt_detal SET 
            money = '$money', 
            type = '$type', 
            number_acc = '$number_acc', 
            number_ber = '$number_ber', 
            id_cost = '$id_cost'
            WHERE id_d = '$value'"; // Assuming id_d is the primary key
        
        // Execute the update query
        $conn->query($sql_update);
        
        // Insert into "receipt_details_records" table
        $sql_insert_receipt_details = "INSERT INTO receipt_detail_records (id_d, money, type, number_acc, number_ber, id_cost, editor_name, editor_id, id_r, time_and_date) 
    VALUES ('$value', '$money', '$type', '$number_acc', '$number_ber', '$id_cost', '{$_SESSION['username']}', '{$_SESSION['user_id']}', '{$_GET['id_r']}', NOW())";

        $conn->query($sql_insert_receipt_details);
    }
    echo "Data updated successfully!";
}

// Handle delete request
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["delete_id"])) {
    $delete_id = mysqli_real_escape_string($conn, $_GET["delete_id"]);
    $sql_delete = "DELETE FROM receipt_detal WHERE id_d = '$delete_id'";
    if ($conn->query($sql_delete) === TRUE) {
        // echo "Record deleted successfully!";
    } else {
        // echo "Error deleting record: " . $conn->error;
    }
    exit; // Stop script execution after deleting a row
}

// Handle add row request
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["add_row"])) {
    $id_r_value = mysqli_real_escape_string($conn, $_GET["id_r"]); // Assuming you're passing id_r through GET
    $sql_insert = "INSERT INTO receipt_detal (id_r) VALUES ('$id_r_value')";
    if ($conn->query($sql_insert) === TRUE) {
        $last_id = $conn->insert_id;
        echo "New record created successfully. Last inserted ID is: " . $last_id; // Debug statement
    } else {
        echo "Error: " . $sql_insert . "<br>" . $conn->error; // Debug statement
    }
    exit; // Stop script execution after adding a row
}

// Fetch data based on id_r value
$id_r_value = mysqli_real_escape_string($conn, $_GET["id_r"]); // Assuming you're passing id_r through GET
$sql = "SELECT * FROM receipt_detal WHERE id_r = '$id_r_value'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Display data in an editable format
    echo "<form id='update_form'>";
    echo "<table border='1' id='receipt_table'>";
    echo "<tr><th>ID</th><th>المبلغ</th><th>النوع</th><th>رقم الحساب</th><th>محجوز</th><th>رقم الصرف</th><th>حذف الصف</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr id='row_" . $row["id_d"] . "'>"; // Added ID to each row
        echo "<td>" . $row["id_d"] . "</td>";
        echo "<td><input type='text' name='money[]' value='" . $row["money"] . "' size='30'></td>"; // Adjust size as needed
        echo "<td><select name='type[]'><option value='paid' " . ($row["type"] == "paid" ? "selected" : "") . ">Paid</option><option value='spent' " . ($row["type"] == "spent" ? "selected" : "") . ">Spent</option></select></td>";
        echo "<td><input type='text' name='number_acc[]' value='" . $row["number_acc"] . "' size='30'></td>"; // Adjust size as needed
        echo "<td><input type='text' name='number_ber[]' value='" . $row["number_ber"] . "' size='30'></td>"; // Adjust size as needed
        echo "<td><input type='text' name='id_cost[]' value='" . $row["id_cost"] . "' size='30'></td>"; // Adjust size as needed
        // Hidden input to pass ID_d value
        echo "<input type='hidden' name='id_d[]' value='" . $row["id_d"] . "'>";
        // Delete button
        echo "<td><button class=\"action-button\" type='button' onclick='deleteRow(" . $row["id_d"] . ")'>حذف</button></td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "<div style='text-align: center;'>";
    echo "<button class=\"action-button\" type='button' onclick='updateRows()'>حفظ</button>";
    echo "<button class=\"action-button\" onclick='addRow()'>اضف صف جديد</button>";
    echo "</div>";
    echo "</form>";
} else {
    echo "0 results";
}

// Close connection
$conn->close();
?>



<script>
function updateRows() {
    var form = document.getElementById("update_form");
    var formData = new FormData(form);

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert("Data updated successfully!");
            location.reload(); // Refresh the page after updating data
        }
    };
    xhttp.open("POST", "", true); // Send to the same page
    xhttp.send(formData);
}

function addRow() {
    var table = document.getElementById("receipt_table");
    var newRow = table.insertRow(-1);
    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);
    var cell4 = newRow.insertCell(3);
    var cell5 = newRow.insertCell(4);
    var cell6 = newRow.insertCell(5);
    var cell7 = newRow.insertCell(6);
    cell1.innerHTML = "";
    cell2.innerHTML = "<input type='text' name='money[]' size='30'>";
    cell3.innerHTML = "<select name='type[]'><option value='paid'>Paid</option><option value='spent'>Spent</option></select>";
    cell4.innerHTML = "<input type='text' name='number_acc[]' size='30'>";
    cell5.innerHTML = "<input type='text' name='number_ber[]' size='30'>";
    cell6.innerHTML = "<input type='text' name='id_cost[]' size='30'>";
    cell7.innerHTML = "<button type='button' onclick='deleteRow(this.parentNode.parentNode)'>Delete</button>";
    
    // Send AJAX request to add row to database
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Update the table with the new row ID received from the server
            newRow.id = "row_" + this.responseText;
            location.reload(); // Refresh the page
        }
    };
    xhttp.open("POST", "", true); // Send to the same page
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("add_row=true");
}

// JavaScript function to delete row
function deleteRow(id_d) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Remove row from DOM if deletion successful
            var row = document.getElementById("row_" + id_d);
            if (row) {
                row.parentNode.removeChild(row);
            }
        }
    };
    xhttp.open("GET", "editdelete.php?delete_id=" + id_d, true);
    xhttp.send();
}

</script>



