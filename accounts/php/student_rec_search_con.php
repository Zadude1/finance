<?php
        // Establish a connection to your database
        $servername = "localhost";
        $username = "root";
        $password = ""; // Empty password
        $dbname = "accounting";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Fetch distinct values for dropdown (year_r)
        $dropdown_query = "SELECT DISTINCT year_r FROM receipt";
        $dropdown_result = $conn->query($dropdown_query);

        while ($row = $dropdown_result->fetch_assoc()) {
            echo "<option value='" . $row['year_r'] . "'>" . $row['year_r'] . "</option>";
        }

        // Close connection
        $conn->close();
        ?>