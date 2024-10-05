<?php
session_start();
require_once('../php/env/db.php');

// Check if the user is trying to log in
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prepare the SQL statement
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->bind_param("s", $username); // 's' indicates the type of parameter (string)
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if ($user) {
        // Verify the password
        if ($password === $user['password']) { // You should hash passwords in a real application
            // Store the user ID in the session
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $username;
            $_SESSION['user'] = $user;
            $_SESSION['logged_in'] = true; // Mark the user as logged in

            // Redirect to the main page
            header('Location: dash.php');
            exit();
        } else {
            $error = "Incorrect password";
        }
    } else {
        $error = "Username not found";
    }
}

// Check if the user is not logged in and not on the login page, then redirect to login page
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    if (basename($_SERVER['PHP_SELF']) !== 'login.php') {
        header('Location: login.php');
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css"> <!-- Include the stylesheet here -->
    <title>Login System</title>
</head>
<body>

    <?php include('header.php'); ?>

    <div class="container">
        <div class="form-container">
            <form method="post" action="login.php">
                <label for="username">اسم المستخدم:</label>
                <input type="text" name="username" required>

                <label for="password">كلمة السر:</label>
                <input type="password" name="password" required>

                <label for="adder_name"> المستخدم المسجل حاليا:</label>
                <input type="text" name="adder_name" value="<?php echo isset($_SESSION['username']) ? $_SESSION['username'] : ''; ?>" readonly>

                <button type="submit">Login</button>
            </form>

            <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
        </div>
    </div>

    <?php include('footer.php'); ?>

</body>
</html>
