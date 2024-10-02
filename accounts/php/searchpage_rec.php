<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Receipt</title>
    <link rel="stylesheet" href="../css/stylee.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <script>
        $(document).ready(function(){
            // Autocomplete for from_per field
            $('#from_per').autocomplete({
                source: '../php/autocomplete.php'
            });

            // Handle Active button click
            $(document).on('click', '.active-btn', function() {
                var id = $(this).data('id');
                var currentStatus = $(this).data('status');
                var newStatus = currentStatus == 1 ? 0 : 1;
                var button = $(this);
                
                $.ajax({
                    url: '../php/update_status.php',
                    type: 'POST',
                    data: {
                        id_r: id,
                        new_status: newStatus
                    },
                    success: function(response) {
                        if (response.success) {
                            button.data('status', newStatus);
                            if (newStatus == 1) {
                                button.text('بطال');
                                button.closest('tr').find('.status-note').text('بطال');
                            } else {
                                button.text('فعال');
                                button.closest('tr').find('.status-note').text('فعال');
                            }
                        } else {
                            alert('Failed to update status');
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
<label for="from_per" style="direction: ltr;">اسم الطالب:</label>
    <input type="text" name="from_per" id="from_per" style="direction: rtl;">
    <select name="year_r">
        <?php
        // Establish a connection to your database
        include "../php/student_rec_search_con.php";
        ?>
    </select><br>
    <input type="submit" value="بحث">
</form>
<?php
include "../php/student_search_sql.php";
        ?>
        
        
        </body>
        </html>
        