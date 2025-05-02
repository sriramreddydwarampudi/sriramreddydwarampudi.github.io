To ensure that users can only access the files in the `ram` directory if they have logged in, you need to protect the `ram` directory by checking the session. Here’s how you can implement this:

### 1. Create an Access Control Script

Create a PHP script (e.g., `access_control.php`) that checks if a user is logged in. Include this script in any PHP files in the `ram` directory to protect them.

```php
<?php
session_start();
if (!isset($_SESSION['username'])) {
    // If the user is not logged in, redirect to the login page
    header("Location: ../login.html");
    exit();
}
?>
```

### 2. Protect the `ram` Directory

Assuming you have an `index.php` in the `ram` directory, include the `access_control.php` script at the top of the file to restrict access:

```php
<?php
include('../access_control.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RAM Folder</title>
</head>
<body>
    <h1>Welcome to the RAM Folder</h1>
    <p>Only logged in users can see this.</p>
</body>
</html>
```

### 3. Update the Login Script

Ensure your `login.php` script correctly sets the session and redirects users after a successful login:

```php
<?php
session_start();
$servername = "localhost";
$username = "root";  // Your database username
$password = "";      // Your database password
$dbname = "if0_36957028_school";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    // Simple SQL query to check user credentials
    $sql = "SELECT * FROM users WHERE username='$username' AND role='$role'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        if ($row['password'] == $password) {  // In a real application, use password hashing
            $_SESSION['username'] = $username;
            $_SESSION['role'] = $role;
            // Redirect to the ram folder
            header("Location: ram/index.php");
            exit();
        } else {
            echo "Invalid password.";
        }
    } else {
        echo "Invalid username or role.";
    }
}

$conn->close();
?>
```

### 4. Structure of `ram` Directory

Ensure your `ram` directory contains an `index.php` or other PHP files you want to protect, and each file includes the `access_control.php` script:

```
/var/www/html/
    ├── login.html
    ├── login.php
    ├── access_control.php
    └── ram/
        └── index.php
```

### Summary

1. **Login Check**: `access_control.php` checks if the user is logged in by verifying session variables.
2. **Protection**: Include `access_control.php` in all PHP files within the `ram` directory to protect them.
3. **Login Script**: Update `login.php` to set session variables and redirect to a protected page within the `ram` directory.

Now, when a user attempts to access `http://localhost/ram`, they will be redirected to `login.html` if they are not logged in. After successful login, they will be redirected to `ram/index.php`, and any direct access to files in the `ram` directory without login will be blocked.