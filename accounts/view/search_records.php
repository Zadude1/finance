<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-Time Search</title>
    <style>
        /* Simple styling for the search bar */
        .search-container {
            margin: 20px;
        }
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 300px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .delete-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="search-container">
    <input type="text" id="search" placeholder="ادخل مصطلح البحث" >
</div>

<div id="results"></div>

<script>
    // Add an event listener for real-time search
    document.getElementById('search').addEventListener('keyup', function() {
        let searchTerm = this.value;

        // AJAX request to send the search term to the PHP script
        let xhr = new XMLHttpRequest();
        xhr.open('GET', '../php/search_records.php?search_term=' + searchTerm, true);
        xhr.onload = function() {
            if (this.status == 200) {
                // Update the results section with the response
                document.getElementById('results').innerHTML = this.responseText;
            }
        };
        xhr.send();
    });
</script>

</body>
</html>
