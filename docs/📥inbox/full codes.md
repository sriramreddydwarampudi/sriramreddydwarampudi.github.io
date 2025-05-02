
Sure! Here are the full codes for the `index.html`, `submit.php`, and `view_data.php` files:

### `index.html`

```html
<!DOCTYPE html>
<html>
<head>
    <title>Simple Form with Odontogram</title>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .tooth-17-parent, .tooth-18-parent {
            fill: none; /* Default color */
        }
        .tooth-17, .tooth-18 {
            cursor: pointer;
            pointer-events: all; /* Ensure clicks are registered */
        }
        .input-box {
            border: 1px solid #ccc;
            padding: 8px;
            display: inline-block;
            min-width: 200px;
            cursor: text;
        }
        .dropdown-menu {
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        .dropdown-option {
            padding: 8px;
            cursor: pointer;
        }
        .dropdown-option:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body class="container" style="background-image: url(img.jpg);">
    <div class="container">
        <a href="view_data.php"><button type="button" class="btn btn-primary btn-lg">View Data</button></a>
    </div>
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <form name="myForm" action="submit.php" method="POST">
                <div class="col-sm-12">
                    <h1 class="border-bottom center pb-3 mb-4" style="text-align: center;">Simple Form</h1>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="name">Name:</label>
                    <div class="col-sm-7">
                        <input type="text" name="name" class="form-control" id="Name" placeholder="A.Name" required>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="age">Age:</label>
                    <div class="col-sm-7">
                        <input type="tel" name="age" class="form-control" id="Age" placeholder="age" required>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="height">Height(cm):</label>
                    <div class="col-sm-7">
                        <input type="tel" name="height" class="form-control" id="Height" placeholder="Height">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="weight">Weight(kg):</label>
                    <div class="col-sm-7">
                        <input type="tel" name="weight" class="form-control" id="Weight" placeholder="weight">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="systemic">Any systemic diseases:</label>
                    <div class="col-sm-7">
                        <input type="text" name="systemic" class="form-control" id="Anyothersys" placeholder="any other known systemic diseases">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-8">
                        <input type="submit" class="btn btn-dark" value="Submit">
                    </div>
                    <div class="col-sm-3">
                        <input type="reset" class="btn btn-dark" value="Reset">
                    </div>
                </div>
                <h1>Dr. Ram Odontogram</h1>
                <p>Dental chart.</p>
                <div class="large-6 columns chart">
                    <div class="row">
                        <div class="large-12 columns">
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
                                <defs></defs>
                                <path class="tooth-17 tooth-17-parent" d="m 28.730841,143.70545 c -1.738504,-1.99931 -1.511164,-4.90954 -0.338594,-8.2577 4.474246,-8.60052 12.512518,-10.45413 25.03487,-3.81872 3.92789,1.33064 7.041725,3.88921 9.09019,6.4421 2.015003,2.51132 3.885891,3.72014 2.889861,8.1614 -2.299784,7.48128 -6.272087,13.34988 -17.529844,12.19412 -4.473038,-0.45662 -8.42318,0.5263 -14.080605,-3.19104 -2.190077,-3.04198 -6.410162,-2.83939 -5.065878,-11.53016 z" style="fill:pink;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
                                <path class="tooth-18 tooth-18-parent" d="m 41.96617,158.28623 c 4.957642,0.3802 9.428351,1.37009 12.439384,3.64608 4.298567,1.86448 7.041035,3.81871 6.814214,5.94445 1.375849,3.24006 0.304958,5.59378 -0.500905,8.0435 l -2.290119,4.0215 c -1.448553,2.34064 -4.442078,3.89867 -9.124602,4.60116 -5.51245,0.76681 -11.025416,1.68656 -16.527257,-0.94524 -6.263892,-1.96088 -6.561951,-4.74265 -7.163588,-7.48272 -1.848724,-2.81074 -3.086495,-6.19523 -2.353337,-11.43077 0.649676,-2.39317 1.475289,-5.43564 5.517882,-6.82619 4.04251,-1.39056 7.66734,-0.66913 13.188328,0.42823 z" style="fill:pink;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
                            </svg>
                            <input type="text" class="input-box" name="findings_17" data-tooth="17" placeholder="Enter findings (e.g., decayed)">
                            <input type="text" class="input-box" name="findings_18" data-tooth="18" placeholder="Enter findings (e.g., decayed)">
                        </div>
                    </div>
                    <div>
                        <h2>Tooth Conditions Summary</h2>
                        <p id="summary-decayed">Decayed: </p>
                        <p id="summary-missing">Missing: </p>
                        <p id="summary-stains">Stains: </p>
                        <p id="summary-none">Normal: </p>
                        <p id="summary-not-examined">Not Examined: </p>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <script>
$(document).ready(function() {
    var states = ['decayed', 'missing', 'stains', 'none'];
    var currentIndex17 = 0;
    var currentIndex18 = 0;

    var tooth17State = states[currentIndex17];
    var tooth18State = states[currentIndex18];

    function updateSummary() {
        $('#summary-decayed').text('Decayed: ' + (tooth17State === 'decayed' ? '17, ' : '') + (tooth18State === 'decayed' ? '18' : ''));
        $('#summary-missing').text('Missing: ' + (tooth17State === 'missing' ? '17, ' : '') + (tooth18State === 'missing' ? '18' : ''));
        $('#summary-stains').text('Stains: ' + (tooth17State === 'stains' ? '17, ' : '') + (tooth18State === 'stains' ? '18' : ''));
        $('#summary-none').text('Normal: ' + (tooth17State === 'none' ? '17, ' : '') + (tooth18State === 'none' ? '18' : ''));
        $('#summary-not-examined').text('Not Examined: ' + (tooth17State === 'not-examined' ? '17, ' : '') + (tooth18State === 'not-examined' ? '18' : ''));
    }

    function setToothState(tooth, state) {
        if (tooth === '17') {
            tooth17State = state;
            $('.tooth-17-parent').attr('class', 'tooth-17 ' + state);
        } else if (tooth === '18') {
            tooth18State = state;
            $('.tooth-18-parent').attr('class', 'tooth-18 ' + state);
        }
        updateSummary();
    }

    function toggleState(event, tooth) {
        event.stopPropagation();
        var currentClass = $(event.target).attr('class');
        var newIndex = (states.indexOf(currentClass) + 1) % states.length;
        var newState = states[newIndex];
        setToothState(tooth, newState);
    }

    $('.tooth-17').click(function(event) {
        toggleState(event, '17');
    });

    $('.tooth-18').click(function(event) {
        toggleState(event, '18');
    });
});
    </script>
</body>
</html>
```

### `submit.php`

```php
<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "odontogram";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Escape user inputs for security
$name = mysqli_real_escape_string($conn, $_POST['name']);
$age = mysqli_real_escape_string($conn, $_POST['age']);
$height = mysqli_real_escape_string($conn, $_POST['height']);
$weight = mysqli_real_escape_string($conn, $_POST['weight']);
$systemic = mysqli_real_escape_string($conn, $_POST['systemic']);
$findings_17 = mysqli_real_escape_string($conn, $_POST['findings_17']);
$findings_18 = mysqli_real_escape_string($conn, $_POST['findings_18']);

// Insert data into table
$sql = "INSERT INTO odontograms (name, age, height, weight, systemic, findings_17, findings_18) VALUES ('$name', '$age', '$height', '$weight', '$systemic', '$findings_17', '$findings_18')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>
```


To create an `odontogram_view.php` file that allows viewing detailed odontogram data for each patient, you'll need to implement a few steps. This file will fetch and display odontogram data based on the patient’s ID. Here's how you can set it up:

### `odontogram_view.php`

This file will allow you to view the detailed odontogram data for a specific patient.

```php
<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "odontogram";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get patient ID from query string
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    // Fetch data for the specific patient
    $sql = "SELECT name, age, height, weight, systemic, findings_17, findings_18 FROM odontograms WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $patient = $result->fetch_assoc();
    } else {
        die("No data found for the specified patient ID.");
    }
} else {
    die("Patient ID is required.");
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>View Odontogram</title>
    <meta charset="UTF-8">
    <style>
        .tooth {
            display: inline-block;
            width: 50px;
            height: 50px;
            border: 1px solid #000;
            margin: 2px;
            text-align: center;
            line-height: 50px;
        }
        .decayed {
            background-color: red;
        }
        .missing {
            background-color: gray;
        }
        .stains {
            background-color: yellow;
        }
        .none {
            background-color: white;
        }
        .not-examined {
            background-color: lightblue;
        }
    </style>
</head>
<body>
    <h1>Patient Odontogram Details</h1>
    <p><strong>Name:</strong> <?php echo htmlspecialchars($patient['name']); ?></p>
    <p><strong>Age:</strong> <?php echo htmlspecialchars($patient['age']); ?></p>
    <p><strong>Height:</strong> <?php echo htmlspecialchars($patient['height']); ?></p>
    <p><strong>Weight:</strong> <?php echo htmlspecialchars($patient['weight']); ?></p>
    <p><strong>Systemic Diseases:</strong> <?php echo htmlspecialchars($patient['systemic']); ?></p>
    
    <h2>Odontogram</h2>
    <div class="tooth <?php echo htmlspecialchars($patient['findings_17']); ?>">Tooth 17</div>
    <div class="tooth <?php echo htmlspecialchars($patient['findings_18']); ?>">Tooth 18</div>

    <a href="view_data.php">Back to Data List</a>
</body>
</html>
```

### Explanation

1. **Database Connection**: Connects to the MySQL database using provided credentials.
2. **Fetching Data**: Fetches the odontogram details for a specific patient based on the ID passed in the query string.
3. **HTML and CSS**: Displays the patient's odontogram details, including the state of teeth 17 and 18 with color-coded styles for different conditions.
4. **Back Link**: Provides a link to return to the list of patient data.

Sure! Here is the full code for the `view_data.php` file and the SQL commands needed for setting up your database schema.

### `view_data.php`

This PHP file will list all patients and provide a link to view their odontogram details.

```php
<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "odontogram";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch all patient data
$sql = "SELECT id, name, age, height, weight, systemic FROM odontograms";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Patient Data</title>
    <meta charset="UTF-8">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
    <h1>Patient Data List</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Height</th>
                <th>Weight</th>
                <th>Systemic Diseases</th>
                <th>View Odontogram</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row["id"]) . "</td>";
                    echo "<td>" . htmlspecialchars($row["name"]) . "</td>";
                    echo "<td>" . htmlspecialchars($row["age"]) . "</td>";
                    echo "<td>" . htmlspecialchars($row["height"]) . "</td>";
                    echo "<td>" . htmlspecialchars($row["weight"]) . "</td>";
                    echo "<td>" . htmlspecialchars($row["systemic"]) . "</td>";
                    echo "<td><a href='odontogram_view.php?id=" . htmlspecialchars($row["id"]) . "'>View Odontogram</a></td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='7'>No data available</td></tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>

<?php
$conn->close();
?>
```

### SQL Schema

Here's the SQL code to create the `odontograms` table with the required columns:

```sql
CREATE DATABASE odontogram;

USE odontogram;

CREATE TABLE odontograms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    height DECIMAL(5,2) NOT NULL,
    weight DECIMAL(5,2) NOT NULL,
    systemic TEXT,
    findings_17 ENUM('decayed', 'missing', 'stains', 'none', 'not-examined') DEFAULT 'none',
    findings_18 ENUM('decayed', 'missing', 'stains', 'none', 'not-examined') DEFAULT 'none'
);

ALTER TABLE odontograms
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


```

### Explanation

1. **`view_data.php`**: Lists all patients with a link to view their odontogram details.
   - Connects to the database and retrieves patient data.
   - Displays the data in an HTML table with a link to the `odontogram_view.php` file.

2. **SQL Schema**: Creates a database named `odontogram` and a table named `odontograms`.
   - Includes columns for patient details and odontogram findings.
   - Uses ENUM type for `findings_17` and `findings_18` to categorize tooth conditions.

Make sure to update the database connection credentials (`$servername`, `$username`, `$password`, `$dbname`) as needed.