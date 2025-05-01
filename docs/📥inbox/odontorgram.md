The error you are encountering is due to the use of `condition` as a column name, which is a reserved keyword in SQL. To fix this, you can either rename the column or enclose it in backticks. Here's the corrected SQL query:

```sql
CREATE TABLE odontogram (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tooth_number INT NOT NULL,
    `condition` ENUM('decayed', 'missing', 'stains', 'none') NOT NULL,
    decay_classification VARCHAR(50),
    missing_classification VARCHAR(50),
    UNIQUE(tooth_number)
);
```

Using backticks around `condition` should resolve the issue.




The error is due to the use of a reserved keyword (`condition`) in your SQL statement. In SQL, reserved keywords must be escaped to avoid syntax errors.

To escape the keyword `condition`, you should use backticks around it:

```sql
`condition`
```

Here's the corrected version of your `submit_odontogram.php`:

```php
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "sql308.infinityfree.com";
$username = "if0_36957028";
$password = "gslphdram";
$dbname = "if0_36957028_school";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Collect POST data
$toothConditions = [
    'decayed' => explode(',', $_POST['decayed']),
    'missing' => explode(',', $_POST['missing']),
    'stains' => explode(',', $_POST['stains']),
    'none' => explode(',', $_POST['none']),
];

$errors = [];
foreach ($toothConditions as $condition => $teeth) {
    foreach ($teeth as $tooth) {
        $tooth = intval($tooth);
        if ($tooth > 0) {
            $sql = "INSERT INTO odontogram (tooth_number, `condition`) VALUES ($tooth, '$condition')
                    ON DUPLICATE KEY UPDATE `condition`='$condition'";
            if (!$conn->query($sql)) {
                $errors[] = "Error: " . $sql . "<br>" . $conn->error;
            }
        }
    }
}

$conn->close();

if (empty($errors)) {
    echo json_encode(["success" => "Data successfully updated"]);
} else {
    echo json_encode(["error" => $errors]);
}
?>
```

### Debugging Output
If you want to include debugging output to ensure everything else is working, you can keep the debugging statements as well:

```php
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

echo "Debugging Start<br>";

$servername = "sql308.infinityfree.com";
$username = "if0_36957028";
$password = "gslphdram";
$dbname = "if0_36957028_school";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

echo "Database connection successful<br>";

// Collect POST data
$toothConditions = [
    'decayed' => explode(',', $_POST['decayed']),
    'missing' => explode(',', $_POST['missing']),
    'stains' => explode(',', $_POST['stains']),
    'none' => explode(',', $_POST['none']),
];

var_dump($toothConditions);
echo "POST data collected<br>";

$errors = [];
foreach ($toothConditions as $condition => $teeth) {
    foreach ($teeth as $tooth) {
        $tooth = intval($tooth);
        if ($tooth > 0) {
            $sql = "INSERT INTO odontogram (tooth_number, `condition`) VALUES ($tooth, '$condition')
                    ON DUPLICATE KEY UPDATE `condition`='$condition'";
            if (!$conn->query($sql)) {
                $errors[] = "Error: " . $sql . "<br>" . $conn->error;
            }
        }
    }
}

echo "SQL queries executed<br>";

$conn->close();

if (empty($errors)) {
    echo json_encode(["success" => "Data successfully updated"]);
} else {
    echo json_encode(["error" => $errors]);
}

echo "Script execution completed<br>";
?>
```

This should resolve the SQL syntax error and allow your script to insert and update the data correctly.





******
Your `submit_odontogram.php` script looks good for inserting the tooth conditions into your MySQL database. To ensure the script handles the AJAX request correctly and provides feedback to the client, it's important to include proper responses and error handling. Here is a revised version of your script with added JSON responses:

```php
<?php
$servername = "sql308.infinityfree.com";
$username = "if0_36957028";
$password = "gslphdram";
$dbname = "if0_36957028_school";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Collect POST data
$toothConditions = [
    'decayed' => explode(',', $_POST['decayed']),
    'missing' => explode(',', $_POST['missing']),
    'stains' => explode(',', $_POST['stains']),
    'none' => explode(',', $_POST['none']),
];

$errors = [];
foreach ($toothConditions as $condition => $teeth) {
    foreach ($teeth as $tooth) {
        $tooth = intval($tooth);
        if ($tooth > 0) {
            $sql = "INSERT INTO odontogram (tooth_number, condition) VALUES ($tooth, '$condition')
                    ON DUPLICATE KEY UPDATE condition='$condition'";
            if (!$conn->query($sql)) {
                $errors[] = "Error: " . $sql . "<br>" . $conn->error;
            }
        }
    }
}

$conn->close();

if (empty($errors)) {
    echo json_encode(["success" => "Data successfully updated"]);
} else {
    echo json_encode(["error" => $errors]);
}
?>
```

### Explanation:

1. **Connection Check**:
   - The script checks the connection to the database. If it fails, it returns a JSON response with the error message.

2. **Collect POST Data**:
   - The script collects the `decayed`, `missing`, `stains`, and `none` data from the POST request and explodes them into arrays.

3. **Insert or Update Database Records**:
   - For each tooth condition, the script inserts or updates the database records. If an error occurs during the SQL query, it stores the error message in the `$errors` array.

4. **Response Handling**:
   - After processing all records, the script checks if there were any errors. If not, it returns a success message in JSON format. If there were errors, it returns the error messages in JSON format.

### JavaScript Update

To ensure proper handling of the JSON response from the server, the JavaScript code should be slightly adjusted:

```javascript
$('#submit-button').on('click', function(e) {
    e.preventDefault();
    $.ajax({
        url: $('#odontogram-form').attr('action'),
        type: $('#odontogram-form').attr('method'),
        data: {
            decayed: toothConditions.decayed.join(','),
            missing: toothConditions.missing.join(','),
            stains: toothConditions.stains.join(','),
            none: toothConditions.none.join(',')
        },
        success: function(response) {
            if (response.success) {
                alert('Summary updated: ' + response.success);
            } else if (response.error) {
                alert('Error updating summary: ' + response.error);
            }
            console.log('Response:', response);
        },
        error: function(xhr, status, error) {
            alert('Error updating summary: ' + error);
            console.error('Error updating summary:', error);
        }
    });
});
```

### Explanation:

1. **Success Callback**:
   - The `success` callback now checks for `response.success` and `response.error` to display appropriate messages based on the JSON response from the server.

2. **Error Callback**:
   - The `error` callback remains the same, handling any AJAX request errors.

This setup ensures that your application provides clear feedback to the user about the success or failure of the database operations.

*******

To view the data in a table form and odontogram, you need to create a PHP script that fetches the data from the database and displays it in a structured HTML table. Below is an example of how you can do this:

### Fetch and Display Data in Table Form

#### 1. Create a PHP Script to Fetch and Display Data

```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Odontogram Data</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h1>Odontogram Data</h1>

<table>
    <tr>
        <th>Tooth Number</th>
        <th>Condition</th>
    </tr>

    <?php
    $servername = "sql308.infinityfree.com";
    $username = "if0_36957028";
    $password = "gslphdram";
    $dbname = "if0_36957028_school";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Fetch data
    $sql = "SELECT tooth_number, `condition` FROM odontogram";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . $row["tooth_number"] . "</td>
                    <td>" . $row["condition"] . "</td>
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='2'>No data available</td></tr>";
    }

    $conn->close();
    ?>

</table>

</body>
</html>
```

### 2. Display Odontogram with Conditions

You can integrate this with your previous HTML and JavaScript odontogram to highlight the conditions on the SVG odontogram. Here's how you can do it:

#### Fetch Conditions and Integrate with SVG

```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Odontogram with Conditions</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .tooth-17-parent, .tooth-18-parent {
            fill: none; /* Default color */
        }
        .tooth-17, .tooth-18 {
            cursor: pointer;
            pointer-events: all; /* Ensure clicks are registered */
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<h1>Odontogram Data</h1>

<table>
    <tr>
        <th>Tooth Number</th>
        <th>Condition</th>
    </tr>

    <?php
    $servername = "sql308.infinityfree.com";
    $username = "if0_36957028";
    $password = "gslphdram";
    $dbname = "if0_36957028_school";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Fetch data
    $sql = "SELECT tooth_number, `condition` FROM odontogram";
    $result = $conn->query($sql);

    $conditions = [];
    if ($result->num_rows > 0) {
        // Output data of each row
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . $row["tooth_number"] . "</td>
                    <td>" . $row["condition"] . "</td>
                  </tr>";
            $conditions[$row["tooth_number"]] = $row["condition"];
        }
    } else {
        echo "<tr><td colspan='2'>No data available</td></tr>";
    }

    $conn->close();
    ?>

</table>

<h1>Odontogram</h1>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="289.61084" height="370.54398">
    <title id="title3476">Human Dental Arches</title>
    <metadata id="metadata8">
        <rdf:RDF>
            <cc:Work rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                <dc:title>Human Dental Arches</dc:title>
            </cc:Work>
        </rdf:RDF>
    </metadata>
    <defs>
        <!-- Existing markers -->
    </defs>

    <!-- Tooth 17 diagram -->
    <path
        class="tooth-17 tooth-17-parent"
        d="m 28.730841,143.70545 c -1.738504,-1.99931 -1.511164,-4.90954 -0.338594,-8.2577 4.474246,-8.60052 12.512518,-10.45413 25.03487,-3.81872 3.92789,1.33064 7.041725,3.88921 9.09019,6.4421 2.015003,2.51132 3.885891,3.72014 2.889861,8.1614 -2.299784,7.48128 -6.272087,13.34988 -17.529844,12.19412 -4.473038,-0.45662 -8.42318,0.5263 -14.080605,-3.19104 -2.190077,-3.04198 -6.410162,-2.83939 -5.065878,-11.53016 z"
        style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>

    <!-- Tooth 18 diagram -->
    <path
        class="tooth-18 tooth-18-parent"
        d="m 41.96617,158.28623 c 4.957642,0.3802 9.428351,1.37009 12.439384,3.64608 4.298567,1.86448 7.041035,3.81871 6.814214,5.94445 1.375849,3.24006 0.304958,5.59378 -0.500905,8.0435 l -2.290119,4.0215 c -1.448553,2.34064 -4.442078,3.89867 -9.124602,4.60116 -5.51245,0.76681 -11.025416,1.68656 -16.527257,-0.94524 -6.263892,-1.96088 -6.561951,-4.74265 -7.163588,-7.48272 -1.848724,-2.81074 -3.086495,-6.19523 -2.353337,-11.43077 0.649676,-2.39317 1.475289,-5.43564 5.517882,-6.82619 4.04251,-1.39056 7.66734,-0.66913 13.188328,0.42823 z"
        style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
</svg>

<script>
    $(document).ready(function() {
        var conditions = <?php echo json_encode($conditions); ?>;

        function updateToothColor(toothClass, condition) {
            var fillColor;
            switch (condition) {
                case 'decayed':
                    fillColor = '#795C34';
                    break;
                case 'missing':
                    fillColor = 'black';
                    break;
                case 'stains':
                    fillColor = 'yellow';
                    break;
                case 'none':
                    fillColor = 'white';
                    break;
                default:
                    fillColor = 'none';
                    break;
            }
            $(toothClass).css('fill', fillColor);
        }

        for (var tooth in conditions) {
            var condition = conditions[tooth];
            updateToothColor('.tooth-' + tooth + '-parent', condition);
        }
    });
</script>

