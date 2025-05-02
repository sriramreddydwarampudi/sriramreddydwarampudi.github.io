To implement a login system for doctors and students, you'll need to create a table for storing user credentials and a simple HTML login form with PHP scripts to handle the login logic. Here's a step-by-step approach:

### 1. Create the Users Table

Add a new table to your database to store user information:

```sql
-- Table structure for table `users`
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('doctor', 'student') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
```

### 2. Insert Sample Data into the Users Table

Add some sample data for testing:

```sql
INSERT INTO `users` (`username`, `password`, `role`) VALUES
('doctor1', 'password1', 'doctor'),
('student1', 'password2', 'student');

-- Make sure to hash the passwords in a real application
```

### 3. Create the Login Form

Create a simple HTML login form (`login.html`):

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login.php" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="doctor">Doctor</option>
                <option value="student">Student</option>
            </select>
        </div>
        <div>
            <button type="submit">Login</button>
        </div>
    </form>
</body>
</html>
```

### 4. Create the Login Script

Create a PHP script to handle the login logic (`login.php`):

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
            echo "Login successful! Welcome " . $role . " " . $username;
            // Redirect to a dashboard or another page
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

### Notes

1. **Password Hashing**: In a real-world application, you should use password hashing for storing and verifying passwords. Use `password_hash()` for hashing and `password_verify()` for verification in PHP.
2. **Error Handling**: Enhance error handling and security measures to prevent SQL injection and other vulnerabilities.
3. **Session Management**: Implement session management to maintain user login status and control access to different parts of the application.
4. **Redirects**: After successful login, redirect users to appropriate pages (e.g., doctor dashboard or student dashboard).

This setup should give you a basic login system for doctors and students.