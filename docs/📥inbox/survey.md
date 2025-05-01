```html

    <body class="authentication-bg authentication-bg-pattern">

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-pattern">

                            <div class="card-body p-4">
            <form id="odontogram-form" name="myForm" action="submit.php" method="POST">
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
    <label class="col-sm-3" for="gender">Gender:</label>
    <div class="col-sm-7">
        <select name="gender" class="form-control" id="gender" required>
            <option value="" disabled selected>Select your gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>
    </div>
</div>                        



<div class="form-group row">
    <div class="col-sm-1"></div>
    <label class="col-sm-3" for="phone">Phone Number:</label>
    <div class="col-sm-7">
        <input type="tel" name="phone" class="form-control" id="phone" placeholder="Enter your phone number" required>
    </div>
</div>

<div class="form-group row">
    <div class="col-sm-1"></div>
    <label class="col-sm-3" for="village">Village:</label>
    <div class="col-sm-7">
        <select name="village" class="form-control" id="village">
            <option value="">Select Village</option>
            <option value="Anaparthi">Anaparthi</option>
            <option value="Bikkavolu">Bikkavolu</option>
            <option value="Konkudhuru">Konkudhuru</option>
        </select>
    </div>
</div>



                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="systemic">Any systemic diseases:</label>
                    <div class="col-sm-7">
                        <input type="text" name="systemic" class="form-control" id="Anyothersys" placeholder="any other known systemic diseases">
                    </div>
                </div>
                <h1>Odontogram</h1>

       
                        <div class="treatment-plan" id="treatment-plan">
            <!-- Treatment plan inputs will be dynamically added here -->
                </div>

<div class="form-group row">
    <div class="col-sm-1"></div>
    <label class="col-sm-3" for="treatment-plan">Treatment Plan:</label>
    <div class="col-sm-7" id="treatment-plan">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="Extraction" id="extraction">
            <label class="form-check-label" for="extraction">Extraction</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="Restoration" id="restoration">
            <label class="form-check-label" for="restoration">Restoration</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="Root Canal" id="root-canal">
            <label class="form-check-label" for="root-canal">Root Canal</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="Oral Prophylaxis" id="oral-prophylaxis">
            <label class="form-check-label" for="oral-prophylaxis">Oral Prophylaxis</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="Orthodontic" id="orthodontic">
            <label class="form-check-label" for="orthodontic">Orthodontic</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="CD" id="cd">
            <label class="form-check-label" for="cd">CD</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="RPD" id="rpd">
            <label class="form-check-label" for="rpd">RPD</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="treatment[]" value="Implant" id="implant">
            <label class="form-check-label" for="implant">Implant</label>
        </div>
        <!-- Other treatment option with manual text input -->
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="other-treatment-checkbox">
            <label class="form-check-label" for="other-treatment-checkbox">Other:</label>
        </div>
        <div id="other-treatment-container" style="display: none;">
            <input type="text" class="form-control mt-2" name="treatment[]" id="other-treatment" placeholder="Enter other treatment">
        </div>
    </div>
</div>

<script>
    document.getElementById('other-treatment-checkbox').addEventListener('change', function() {
        var otherTreatmentContainer = document.getElementById('other-treatment-container');
        if (this.checked) {
            otherTreatmentContainer.style.display = 'block';
        } else {
            otherTreatmentContainer.style.display = 'none';
            document.getElementById('other-treatment').value = ''; // Clear the input if unchecked
        }
    });
</script>



  <label for="fileToUpload">Select image to upload:</label>
        <input type="file" name="fileToUpload" id="fileToUpload" accept=".jpg,.jpeg,.png,.gif,.heic" required><br>

                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10 text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>
                        <button type="button" class="btn btn-info" onclick="window.location.href='view_data.php'">View Data</button>
    
            </form>
        </div>
        <div class="col-sm-3"></div>
    </div>

```