<?php
session_start(); // Start the session

// Check if the user is logged in and is of user1 type
if (isset($_SESSION['user']) && $_SESSION['user']['user_type'] == 'user1') {
    $edit_delete_buttons = true;
} else {
    $edit_delete_buttons = false;
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
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

    $from_per = $_POST["from_per"];
    $year_r = $_POST["year_r"];

    // Prepare SQL statement
    $sql = "SELECT * FROM receipt WHERE from_per LIKE ? AND year_r = ? ORDER BY id_r DESC LIMIT 30"; // Using LIKE for partial matching
    $stmt = $conn->prepare($sql);
    $from_per_param = "%" . $from_per . "%"; // Adding wildcard for partial matching
    $stmt->bind_param("si", $from_per_param, $year_r);
    $stmt->execute();
    $result = $stmt->get_result();

    // Initialize total amount and row count
    $total_amount = 0;
    $row_count = 0;

    // Display results
    if ($result->num_rows > 0) {
        echo '<div class="card">
                <div class="card-header">
                    <h3 class="card-title">DataTable with default features</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">';
        echo "<table class='custom-table'><thead><tr><th>ID</th><th>الطالب</th><th>المبلغ</th><th>رقم الحركة</th><th>اسم المستلم</th><th>التاريخ</th><th>الملاحظات</th><th>العام الدراسي</th><th>طباعة</th>";
        if ($edit_delete_buttons) {
            echo "<th>تعديل</th><th>تفعيل/تعطيل</th>";
        }
        echo "</tr></thead><tbody>";
        while ($row = $result->fetch_assoc()) {
            $statusText = $row["type_of_receipt"] == 1 ? 'بطال' : 'فعال';
            $rowClass = $row["type_of_receipt"] == 1 ? 'style="color:red;"' : '';
            echo "<tr $rowClass><td>" . $row["id_r"] . "</td><td>" . $row["from_per"] . "</td><td>" . $row["money"] . "</td><td>" . $row["c_number"] . "</td><td>" . $row["name"] . "</td><td>" . $row["data_in"] . "</td><td class='status-note'>" . $statusText . "</td><td>" . $row["year_r"] . "</td><td><a href='rec.php?id_r=" . $row["id_r"] . "'><button class='print-btn'>Print</button></a></td>";
            if ($edit_delete_buttons) {
                echo "<td><a href='edit.php?id_r=" . $row["id_r"] . "'><button class='edit-btn'>Edit</button></a></td><td><button class='active-btn' data-id='" . $row["id_r"] . "' data-status='" . $row["type_of_receipt"] . "'>" . $statusText . "</button></td>";
            }
            echo "</tr>";

            // Add to total amount and increment row count
            $total_amount += $row["money"];
            $row_count++;
        }
        echo "</tbody><tfoot>";
        echo "<tr><td colspan='2'>Total Amount:</td><td colspan='9'>" . $total_amount . "</td></tr>";
        echo "<tr><td colspan='2'>Total Rows:</td><td colspan='9'>" . $row_count . "</td></tr>";
        echo "</tfoot></table>";
        echo '  </div>
              <!-- /.card-body -->
              </div>';
    } else {
        echo '<div class="card">
                <div class="card-header">
                    <h3 class="card-title">DataTable with default features</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <p>No results found</p>
                </div>
              <!-- /.card-body -->
              </div>';
    }
    
    // Close statement
    $stmt->close();
    
    // Close connection
    $conn->close();
} else {
    // If the form is not submitted, default to showing the last 30 rows
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
    
    // Prepare SQL statement
    $sql = "SELECT * FROM receipt ORDER BY id_r DESC LIMIT 30";
    $result = $conn->query($sql);

    // Initialize total amount and row count
    $total_amount = 0;
    $row_count = 0;
    
    // Display results
    if ($result->num_rows > 0) {
        echo '<div class="card">
               
                <!-- /.card-header -->
                <div class="card-body">';
        echo "<table class='custom-table'><thead><tr><th>ID</th><th>الطالب</th><th>المبلغ</th><th>رقم الحركة</th><th>اسم المستلم</th><th>التاريخ</th><th>الملاحظات</th><th>العام الدراسي</th><th>طباعة</th>";
        if ($edit_delete_buttons) {
            echo "<th>تعديل</th><th>تفعيل/تعطيل</th>";
        }
        echo "</tr></thead><tbody>";
        while ($row = $result->fetch_assoc()) {
            $statusText = $row["type_of_receipt"] == 1 ? 'بطال' : 'فعال';
            $rowClass = $row["type_of_receipt"] == 1 ? 'style="color:red;"' : '';
            echo "<tr $rowClass><td>" . $row["id_r"] . "</td><td>" . $row["from_per"] . "</td><td>" . $row["money"] . "</td><td>" . $row["c_number"] . "</td><td>" . $row["name"] . "</td><td>" . $row["data_in"] . "</td><td class='status-note'>" . $statusText . "</td><td>" . $row["year_r"] . "</td><td><a href='rec.php?id_r=" . $row["id_r"] . "'><button class='print-btn'>Print</button></a></td>";
            if ($edit_delete_buttons) {
                echo "<td><a href='../php1/edit.php?id_r=" . $row["id_r"] . "'><button class='edit-btn'>Edit</button></a></td><td><button class='active-btn' data-id='" . $row["id_r"] . "' data-status='" . $row["type_of_receipt"] . "'>" . $statusText . "</button></td>";
            }
            echo "</tr>";

            // Add to total amount and increment row count
            $total_amount += $row["money"];
            $row_count++;
        }
        echo "</tbody><tfoot>";
        echo "<tr><td colspan='2'>Total Amount:</td><td colspan='9'>" . $total_amount . "</td></tr>";
        echo "<tr><td colspan='2'>Total Rows:</td><td colspan='9'>" . $row_count . "</td></tr>";
        echo "</tfoot></table>";
        echo '  </div>
              <!-- /.card-body -->
              </div>';
    } else {
        echo '<div class="card">
                <div class="card-header">
                    <h3 class="card-title">DataTable with default features</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <p>No results found</p>
                </div>
              <!-- /.card-body -->
              </div>';
    }
    
    // Close connection
    $conn->close();
}
?>
