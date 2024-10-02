
<?php
include "number_to_arabic_word.php";

?>
<?php

include "edit_rec_con.php";

?>

<?php
$sql = "SELECT receipt.*, receipt.id_s 
FROM receipt 
WHERE receipt.id_r = $receipt_id";

include "edit_rec_details.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        form {
            max-width: 1000px; /* Adjust the max-width as needed */
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        textarea {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"],
        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2></h2>
   
    <form action="update.php" method="post">
        <input type="hidden" name="receipt_id"  value="<?php echo $receipt_id; ?>">
        <br><br>
        <label for="money">المبلغ:</label>
        <input type="text" id="money" name="money" readonly value="<?php echo $money; ?>"><br><br>
        <label for="data_in">تاريخ الاستلام:</label>
        <input type="date" id="data_in" name="data_in" value="<?php echo $data_in; ?>"><br><br>
        <label for="type">نوع الإيصال:</label>
<input type="text" id="type" name="type" value="<?php echo $type; ?>" onchange="updateNote()"><br><br>
        <label for="date_ac">تاريخ الصك:</label>
        <input type="date" id="date_ac" name="date_ac" value="<?php echo $date_ac; ?>"><br><br>

        <label for="write_mo">رقم القيد:</label>
        <input type="text" id="write_mo" name="write_mo" value="<?php echo $write_mo; ?>"><br><br>
        <label for="id_u">معرف المستخدم:</label>
        <input type="text" id="id_u" name="id_u" readonly value="<?php echo $id_u; ?>"  ><br><br>
        <label for="name">اسم المستخدم:</label>
        <input type="text" id="name" readonly name="name" value="<?php echo $name; ?>"><br><br>
        <label for="id_col">معرف الكلية:</label>
<input type="text" id="id_col" name="id_col" value="<?php echo $id_col; ?>" onchange="updateNote()"><br><br>
        <label for="id_s">رقم الطالب:</label>
        <input type="text" name="id_s" id="id_s" readonly><br><br> <!-- Removed duplicated id_s input field -->
        <label for="c_number">رقم الحركة:</label>
        <input type="text" id="c_number" name="c_number" value="<?php echo $c_number; ?>"><br><br>
        <label for="c_date">تاريخ الحركة:</label>
        <input type="date" id="c_date" name="c_date" value="<?php echo $c_date; ?>"><br><br>
        <label for="type_of_receipt">نوع الحركة:</label>
        <input type="text" id="type_of_receipt" name="type_of_receipt" value="<?php echo $type_of_receipt; ?>"><br><br>
        <label for="level">المرحلة:</label>
        <input type="text" id="level" name="level" value="<?php echo $level; ?>"><br><br>
        <label for="year_r">العام الدراسي:</label>
        <select name="year_r" id="year_r"  value="<?php echo $year_r; ?>" required>
        <option selected value="<?php echo $year_r; ?>"><?php echo $year_r; ?></option>

        <?php
        // Generate study year options from 2017-2018 to 2030-2031
        $currentYear = date("Y");
        for ($year = 2017; $year <= 2040; $year++) {
            $nextYear = $year + 1;
            $yearRange = "$year-$nextYear";
            echo "<option value=\"$yearRange\">$yearRange</option>";
        }
        ?>
    </select>   
        <label for="note">ملاحظات:</label><br>
        <textarea id="note" name="note" rows="4" cols="50"><?php echo $note; ?></textarea><br><br>
        <!-- Display total money field -->
        <label for="total_money">إجمالي المبلغ:</label>
        <input type="text" id="total_money" name="total_money" value="<?php echo $total_money; ?>" readonly><br><br>

        <div class="autocomplete">
            <input type="text" name="from_per"  id="from_per" required autocomplete="off" value="<?php echo $from_per; ?>">
            <div id="nameSuggestions" class="autocomplete-items"></div>
        </div>
        <input type="submit" value="تحديث">
        <input type="button" onclick="redirectToEditDetails()" value="Go to Edit Details">
    </form>

</body>
</html>

<script>
        // Execute JavaScript after DOM load
        document.addEventListener('DOMContentLoaded', function() {
            // Function to update the "money" field
            function updateMoneyField() {
                // Fetch the sum of money from receipt details
                var totalMoney = <?php echo $total_money; ?>;
                // Update the "money" field with the new total
                document.getElementById("money").value = totalMoney;
            }
            // Call the function to update the "money" field
            updateMoneyField();

            // Autocomplete feature for the "Received From" field
            document.getElementById('from_per').addEventListener('input', function() {
                var input = this.value;
                var nameSuggestions = document.getElementById('nameSuggestions');
                nameSuggestions.innerHTML = '';

                // Fetch names from PHP and display suggestions
                fetch('get_names.php?input=' + input)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(function(name) {
                            var suggestion = document.createElement('div');
                            suggestion.className = 'name-suggestion';
                            suggestion.innerHTML = name;
                            suggestion.addEventListener('click', function() {
                                document.getElementById('from_per').value = name;
                                nameSuggestions.innerHTML = '';
                                updateIdSField(name); // Update the associated id_s field with the selected name
                            });
                            nameSuggestions.appendChild(suggestion);
                        });
                    })
                    .catch(error => console.error('Error fetching names:', error));
            });
        });

       
        
        function redirectToEditDetails() {
            // Get the receipt ID
            var receiptId = <?php echo $receipt_id; ?>;
            // Redirect to editdetails.php with the receipt ID as parameter
            window.location.href = "editdetails.php?id_r=" + receiptId;
        }
        // Function to update the "id_s" field
        function updateIdSField(receivedFrom) {
    // Fetch the id_s value based on the selected receivedFrom value
    fetch('get_id_s.php?receivedFrom=' + receivedFrom)
        .then(response => response.json())
        .then(data => {
            // Update the id_s field with the fetched id_s value
            document.getElementById("id_s").value = data.id_s;
        })
        .catch(error => console.error('Error fetching id_s:', error));
}
    </script>
<script>
    // Function to update the "note" field based on changes to type, id_col, and year_r
    function updateNote() {
        // Fetch the values of type, id_col, and year_r
        var typeValue = document.getElementById("type").value;
        var idColValue = document.getElementById("id_col").value;
        var yearRValue = document.getElementById("year_r").value;

        // Construct the note value
        var noteValue = "تسديد " + typeValue + " كلية " + idColValue + " للعام الدراسي " + yearRValue;

        // Update the note field
        document.getElementById("note").value = noteValue;

        // Update the varnote value
        var varnote = noteValue;

        // Update the textbox showing varnote
        document.getElementById("varnote").value = varnote;
    }

    // Execute JavaScript after DOM load
    document.addEventListener('DOMContentLoaded', function() {
        // Add event listeners to relevant input fields
        document.getElementById("type").addEventListener('input', updateNote);
        document.getElementById("id_col").addEventListener('input', updateNote);
        document.getElementById("year_r").addEventListener('change', updateNote);

        // Initial call to updateNote() to set initial values
        updateNote();
    });
</script>
