To store the buffer values in their respective headings columns in an SQL database using PHP, you'll need to follow these steps:

1. **Set up your SQL database**: Create a table with columns corresponding to the different conditions.

2. **Write PHP code to handle form submissions**: Update the SQL database with the selected conditions.

Here’s how you can do it:

### 1. **SQL Database Setup**

Assuming you have a table named `tooth_conditions` with columns for each condition:

```sql

CREATE TABLE tooth_conditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tooth_number INT,
    `condition` ENUM('decayed', 'missing', 'stains', 'none') NOT NULL
);

```

### 2. **HTML Form**

Update your HTML to include a form for submission:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dental Chart</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
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

                <!-- Inputs for tooth 17 -->
                <h2>Tooth 17</h2>
                <select class="input-select input-select-17" name="tooth-17">
                    <option value="" disabled selected>Select condition</option>
                    <option value="decayed">Decayed</option>
                    <option value="missing">Missing</option>
                    <option value="stains">Stains</option>
                    <option value="none">None</option>
                </select>

                <!-- Inputs for tooth 18 -->
                <h2>Tooth 18</h2>
                <select class="input-select input-select-18" name="tooth-18">
                    <option value="" disabled selected>Select condition</option>
                    <option value="decayed">Decayed</option>
                    <option value="missing">Missing</option>
                    <option value="stains">Stains</option>
                    <option value="none">None</option>
                </select>

                <button id="submit-button">Submit</button>
            </div>
        </div>
    </div>

    <!-- Buffer display section -->
    <div>
        <h2>Tooth Conditions Summary</h2>
        <p id="summary-decayed">Decayed: </p>
        <p id="summary-missing">Missing: </p>
        <p id="summary-stains">Stains: </p>
        <p id="summary-none">Normal: </p>
        <p id="summary-not-examined">Not Examined: </p>
    </div>

    <script>
        $(document).ready(function(){
            var states = ['decayed', 'missing', 'stains', 'none'];

            var toothConditions = {
                decayed: [],
                missing: [],
                stains: [],
                none: [],
                'not examined': [17, 18] // Initialize with all teeth numbers
            };

            function updateState(tooth, toothNumber, state) {
                // Update tooth color
                switch (state) {
                    case 'decayed':
                        $(tooth).css('fill', '#795C34');
                        break;
                    case 'missing':
                        $(tooth).css('fill', 'black');
                        break;
                    case 'stains':
                        $(tooth).css('fill', 'yellow');
                        break;
                    default:
                        $(tooth).css('fill', 'none');
                        break;
                }
                
                // Update tooth conditions buffer
                Object.keys(toothConditions).forEach(function(key) {
                    var index = toothConditions[key].indexOf(toothNumber);
                    if (index !== -1) {
                        toothConditions[key].splice(index, 1);
                    }
                });
                toothConditions[state].push(toothNumber);

                updateSummary();
            }

            function updateSummary() {
                $('#summary-decayed').text('Decayed: ' + toothConditions.decayed.join(', '));
                $('#summary-missing').text('Missing: ' + toothConditions.missing.join(', '));
                $('#summary-stains').text('Stains: ' + toothConditions.stains.join(', '));
                $('#summary-none').text('Normal  : ' + toothConditions.none.join(', '));
                $('#summary-not-examined').text('Not Examined: ' + toothConditions['not examined'].join(', '));
            }

            function handleToothClick(toothClass, toothNumber) {
                var selectedOption = $('.input-select-' + toothClass).val();
                updateState('.' + toothClass + '-parent', toothNumber, selectedOption);
            }

            function handleInputChange(toothClass, toothNumber, value) {
                if (states.includes(value)) {
                    updateState('.' + toothClass + '-parent', toothNumber, value);
                }
            }

            // Handle dropdown change event for tooth 17
            $('.input-select-17').on('change', function(){
                handleInputChange('tooth-17', 17, $(this).val());
            });

            // Handle dropdown change event for tooth 18
            $('.input-select-18').on('change', function(){
                handleInputChange('tooth-18', 18, $(this).val());
            });

            // Initialize the state for the default dropdown values
            handleToothClick('tooth-17', 17);
            handleToothClick('tooth-18', 18);

    
            // Handle form submission
            $('#submit-button').on('click', function() {
                var tooth17Condition = $('.input-select-17').val();
                var tooth18Condition = $('.input-select-18').val();

                $.ajax({
                    type: 'POST',
                    url: 'save_conditions.php',
                    data: {
                        tooth_17: tooth17Condition,
                        tooth_18: tooth18Condition
                    },
                    success: function(response) {
                        alert('Data successfully saved!');
                    },
                    error: function() {
                        alert('Error saving data.');
                    }
                });
            });
        });
    </script>
</body>
</html>


```


### PHP (save_conditions.php)

Create a file named `save_conditions.php` to handle the AJAX request and update the database:

```php
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "your_database_name";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get data from POST request
$tooth17 = $_POST['tooth_17'];
$tooth18 = $_POST['tooth_18'];

// Prepare SQL statements
$sql = "INSERT INTO tooth_conditions (tooth_number, condition) VALUES (?, ?)
        ON DUPLICATE KEY UPDATE condition = VALUES(condition)";

// Prepare and bind
$stmt = $conn->prepare($sql);
$stmt->bind_param("is", $tooth_number, $condition);

// Insert or update Tooth 17
$tooth_number = 17;
$condition = $tooth17;
$stmt->execute();

// Insert or update Tooth 18
$tooth_number = 18;
$condition = $tooth18;
$stmt->execute();

// Close connection
$stmt->close();
$conn->close();
?>
```

### Explanation:

1. **JavaScript**: The `#submit-button` click event handler collects the values from the dropdowns and sends them via an AJAX POST request to `save_conditions.php`. This approach ensures that data is submitted without refreshing the page.

2. **PHP**: The `save_conditions.php` script connects to the database and inserts or updates the records for Tooth 17 and Tooth 18. The `ON DUPLICATE KEY UPDATE` clause ensures that if a record with the same `tooth_number` already exists, it updates the condition rather than creating a new record.

### Notes:

- Make sure to replace `your_database_name` with the actual name of your database.
- Ensure that the database credentials (`$servername`, `$username`, `$password`) are correct.
- You may need to adjust error handling and security measures (e.g., sanitizing inputs) based on your application's requirements.

This setup should help you manage the tooth condition data efficiently and keep your database up-to-date with the user selections.