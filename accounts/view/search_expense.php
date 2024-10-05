<!DOCTYPE html>
<html>
<head>
    <title>Expense Records</title>
    <link rel="stylesheet" type="text/css" href="stylenew.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 20px;
}

h1 {
    text-align: center;
    color: #333;
}

#search {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    box-sizing: border-box;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f1f1f1;
}

.edit-btn, .delete-btn {
    padding: 5px 10px;
    text-decoration: none;
    border: none;
    cursor: pointer;
}

.edit-btn {
    background-color: #4CAF50;
    color: white;
}

.edit-btn:hover {
    background-color: #45a049;
}

.delete-btn {
    background-color: #ff0000;
    color: white;
}

.delete-btn:hover {
    background-color: #cc0000;
}


    </style>

    <script>
        $(document).ready(function(){
            $("#search").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#expenseTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $(".delete-btn").on("click", function() {
                if (confirm('Are you sure you want to delete this record?')) {
                    var id = $(this).data("id");
                    var row = $(this).closest("tr");

                    $.ajax({
                        url: "../php/delete_expense.php",
                        type: "POST",
                        data: { id_e: id },
                        success: function(response) {
                            if (response == "success") {
                                row.remove();
                            } else {
                                alert("Error deleting record");
                            }
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <h1>Expense Records</h1>
    <input id="search" type="text" placeholder="Search...">
    <br><br>
    <table border="1" id="expenseTable">
        <thead>
            <tr>
                <th>id_e</th>
                <th>number</th>
                <th>money</th>
                <th>data_in</th>
                <th>type</th>
                <th>date_ac</th>
                <th>note</th>
                <th>from_per</th>
                <th>write_mo</th>
                <th>id_u</th>
                <th>name</th>
                <th>id_col</th>
                <th>id_s</th>
                <th>d_number</th>
                <th>d_date</th>
                <th>type_of_receipt</th>
                <th>year_r</th>
                <th>in_number</th>
                <th>in_date</th>
                <th>in_amount</th>
                <th>adder_name</th>
                <th>added_date</th>
                <th>updater_name</th>
                <th>updated_date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include "../php/env/db.php";


            $sql = "SELECT * FROM expense ORDER BY id_e DESC LIMIT 30";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["id_e"] . "</td>";
                    echo "<td>" . $row["number"] . "</td>";
                    echo "<td>" . $row["money"] . "</td>";
                    echo "<td>" . $row["data_in"] . "</td>";
                    echo "<td>" . $row["type"] . "</td>";
                    echo "<td>" . $row["date_ac"] . "</td>";
                    echo "<td>" . $row["note"] . "</td>";
                    echo "<td>" . $row["from_per"] . "</td>";
                    echo "<td>" . $row["write_mo"] . "</td>";
                    echo "<td>" . $row["id_u"] . "</td>";
                    echo "<td>" . $row["name"] . "</td>";
                    echo "<td>" . $row["id_col"] . "</td>";
                    echo "<td>" . $row["id_s"] . "</td>";
                    echo "<td>" . $row["d_number"] . "</td>";
                    echo "<td>" . $row["d_date"] . "</td>";
                    echo "<td>" . $row["type_of_receipt"] . "</td>";
                    echo "<td>" . $row["year_r"] . "</td>";
                    echo "<td>" . $row["in_number"] . "</td>";
                    echo "<td>" . $row["in_date"] . "</td>";
                    echo "<td>" . $row["in_amount"] . "</td>";
                    echo "<td>" . $row["adder_name"] . "</td>";
                    echo "<td>" . $row["added_date"] . "</td>";
                    echo "<td>" . $row["updater_name"] . "</td>";
                    echo "<td>" . $row["updated_date"] . "</td>";
                    echo '<td><a class="edit-btn" href="edit_expense.php?id_e=' . $row["id_e"] . '">Edit</a> | <button class="delete-btn" data-id="' . $row["id_e"] . '">Delete</button></td>';
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='25'>0 results</td></tr>";
            }
            $conn->close();
            ?>
        </tbody>
    </table>
</body>
</html>
