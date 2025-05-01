Sure, let's update the code and SQL to meet your requirements:

### Updated HTML Form
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
        <a href="datahtml.php"><button type="button" class="btn btn-primary btn-lg">View Data</button></a>
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

            var toothConditions = {
                decayed: [],
                missing: [],
				stains: [],
                none: [],
                notExamined: []
            };

            function updateSummary() {
                $('#summary-decayed').text('Decayed: ' + (toothConditions.decayed.length ? toothConditions.decayed.join(', ') : 'None'));
                $('#summary-missing').text('Missing: ' + (toothConditions.missing.length ? toothConditions.missing.join(', ') : 'None'));
                $('#summary-stains').text('Stains: ' + (toothConditions.stains.length ? toothConditions.stains.join(', ') : 'None'));
                $('#summary-none').text('Normal: ' + (toothConditions.none.length ? toothConditions.none.join(', ') : 'None'));
                $('#summary-not-examined').text('Not Examined: ' + (toothConditions.notExamined.length ? toothConditions.notExamined.join(', ') : 'None'));
            }

            function toggleToothCondition(toothNumber, condition) {
                var input = $('input[name="findings_' + toothNumber + '"]');
                var value = input.val().toLowerCase();
                if (value) {
                    if (states.includes(value)) {
                        toothConditions[value].push(toothNumber);
                        updateSummary();
                    }
                }
            }

            $('.tooth-17').on('click', function() {
                currentIndex17 = (currentIndex17 + 1) % states.length;
                var currentState = states[currentIndex17];
                $(this).attr('class', 'tooth-17 tooth-17-parent ' + currentState);
                toggleToothCondition(17, currentState);
            });

            $('.tooth-18').on('click', function() {
                currentIndex18 = (currentIndex18 + 1) % states.length;
                var currentState = states[currentIndex18];
                $(this).attr('class', 'tooth-18 tooth-18-parent ' + currentState);
                toggleToothCondition(18, currentState);
            });
        });
    </script>
</body>
</html>



```

```
### Updated SQL

```sql
-- Table to store patient data
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    height FLOAT,
    weight FLOAT,
    systemic TEXT
);

-- Table to store odontogram data with updated column name 'findings'
CREATE TABLE odontograms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    tooth_number INT,
    findings VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);
```

### Updated `submit.php`

```php
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dentistry";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Insert patient data
$name = $_POST['name'];
$age = $_POST['age'];
$height = $_POST['height'];
$weight = $_POST['weight'];
$systemic = $_POST['systemic'];

$sql = "INSERT INTO patients (name, age, height, weight, systemic) VALUES ('$name', '$age', '$height', '$weight', '$systemic')";
if ($conn->query($sql) === TRUE) {
    $patient_id = $conn->insert_id;
    
    // Insert odontogram data
    $findings_17 = $_POST['findings_17'];
    $findings_18 = $_POST['findings_18'];
    
    $sql = "INSERT INTO odontograms (patient_id, tooth_number, findings) VALUES (?, 17, ?), (?, 18, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isis", $patient_id, $findings_17, $patient_id, $findings_18);
    
    if ($stmt->execute()) {
        echo "Record saved successfully";
    } else {
        echo "Error: " . $stmt->error;
    }
    
    $stmt->close();
} else {
    echo "Error: " . $conn->error;
}

$conn->close();
?>
```

### Summary

- The JavaScript handles the interaction with the SVG by updating the tooth state and summarizing findings.
- The SQL tables are updated with the `findings` column and include `tooth_number` for storing the odontogram data.
- The `submit.php` script inserts patient and odontogram data into the database.

Let me know if you need any more adjustments!

To create a table view with search functionality and an odontogram view for submitted data, follow these steps:

### 1. **Create a PHP Page for Viewing Data**

Here's a PHP page (`view_data.php`) that displays the submitted data in a table format and provides a search functionality. It also includes a way to visualize the odontogram data.

#### `view_data.php`
```php
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dentistry";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle search query
$search_query = '';
if (isset($_GET['search'])) {
    $search_query = $_GET['search'];
}

// Fetch patient data with optional search filter
$sql = "SELECT * FROM patients";
if ($search_query) {
    $sql .= " WHERE name LIKE '%" . $conn->real_escape_string($search_query) . "%'";
}
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data View</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .odontogram {
            width: 200px;
            height: 200px;
            margin: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body class="container">
    <h1>Patient Data View</h1>

    <form class="form-inline my-4" method="get" action="view_data.php">
        <input class="form-control mr-sm-2" type="search" name="search" value="<?php echo htmlspecialchars($search_query); ?>" placeholder="Search by name">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Height</th>
                <th>Weight</th>
                <th>Systemic Diseases</th>
                <th>Odontogram</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $patient_id = $row['id'];
                    
                    // Fetch odontogram data
                    $odontogram_sql = "SELECT * FROM odontograms WHERE patient_id = $patient_id";
                    $odontogram_result = $conn->query($odontogram_sql);
                    $odontogram_data = [];
                    while ($odontogram_row = $odontogram_result->fetch_assoc()) {
                        $odontogram_data[$odontogram_row['tooth_number']] = $odontogram_row['findings'];
                    }
                    ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo htmlspecialchars($row['name']); ?></td>
                        <td><?php echo htmlspecialchars($row['age']); ?></td>
                        <td><?php echo htmlspecialchars($row['height']); ?></td>
                        <td><?php echo htmlspecialchars($row['weight']); ?></td>
                        <td><?php echo htmlspecialchars($row['systemic']); ?></td>
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="200" height="200" class="odontogram">
                                <title>Human Dental Arches</title>
                                <defs>
                                    <!-- Define colors for different conditions -->
                                    <style>
                                        .decayed { fill: #795C34; }
                                        .missing { fill: black; }
                                        .stains { fill: yellow; }
                                        .none { fill: none; }
                                    </style>
                                </defs>
                                <!-- Tooth 17 -->
                                <path
                                    class="<?php echo isset($odontogram_data[17]) ? $odontogram_data[17] : 'none'; ?>"
                                    d="m 28.730841,143.70545 c -1.738504,-1.99931 -1.511164,-4.90954 -0.338594,-8.2577 4.474246,-8.60052 12.512518,-10.45413 25.03487,-3.81872 3.92789,1.33064 7.041725,3.88921 9.09019,6.4421 2.015003,2.51132 3.885891,3.72014 2.889861,8.1614 -2.299784,7.48128 -6.272087,13.34988 -17.529844,12.19412 -4.473038,-0.45662 -8.42318,0.5263 -14.080605,-3.19104 -2.190077,-3.04198 -6.410162,-2.83939 -5.065878,-11.53016 z"/>
                                <!-- Tooth 18 -->
                                <path
                                    class="<?php echo isset($odontogram_data[18]) ? $odontogram_data[18] : 'none'; ?>"
                                    d="m 41.96617,158.28623 c 4.957642,0.3802 9.428351,1.37009 12.439384,3.64608 4.298567,1.86448 7.041035,3.81871 6.814214,5.94445 1.375849,3.24006 0.304958,5.59378 -0.500905,8.0435 l -2.290119,4.0215 c -1.448553,2.34064 -4.442078,3.89867 -9.124602,4.60116 -5.51245,0.76681 -11.025416,1.68656 -16.527257,-0.94524 -6.263892,-1.96088 -6.561951,-4.74265 -7.163588,-7.48272 -1.848724,-2.81074 -3.086495,-6.19523 -2.353337,-11.43077 0.649676,-2.39317 1.475289,-5.43564 5.517882,-6.82619 4.04251,-1.39056 7.66734,-0.66913 13.188328,0.42823 z"/>
                            </svg>
                        </td>
                    </tr>
                    <?php
                }
            } else {
                ?>
                <tr>
                    <td colspan="7">No records found.</td>
                </tr>
                <?php
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

### Explanation

- **Search Functionality**: The form at the top allows users to search by patient name. The search term is passed via `$_GET['search']` and used in the SQL query.
- **Odontogram Visualization**: Each row includes an SVG that visualizes the odontogram data for teeth 17 and 18. The SVG paths use CSS classes (`decayed`, `missing`, `stains`, `none`) to style the teeth based on the findings from the database.
- **Styling**: Basic CSS is included to style the odontogram visualization.

### How It Works

1. **Search Query**: The search functionality filters patient records based on the name.
2. **Table and SVG**: For each patient, the odontogram data is fetched and visualized using SVG paths. The class assigned to each path corresponds to the condition of the tooth, altering its color accordingly.

Feel free to customize the styling and functionality based on your specific needs! Let me know if there’s anything else you need help with.


```