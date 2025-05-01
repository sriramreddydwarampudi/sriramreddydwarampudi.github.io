
```php

<!DOCTYPE html>
<html lang="en">
<head>
  <head>
        <meta charset="utf-8" />
        <title> Survey Form PHD</title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="description" />
        <meta content="" name="MartDevelopers" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="./assets/images/favicon.ico">

        <!-- App css -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="./assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="./assets/css/app.min.css" rel="stylesheet" type="text/css" />
        <!--Load Sweet Alert Javascript-->
        
        <script src="./assets/js/swal.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        form { max-width: 600px; margin: 0 auto; }
        label { display: block; margin: 10px 0 5px; }
        input, textarea { width: 100%; padding: 8px; margin-bottom: 10px; }
        input[type="submit"] { width: auto; padding: 10px 20px; }
   
        .tooth-17-parent, .tooth-18-parent {
            fill: none; /* Default color */
        }
        
    .tooth-18, .tooth-17, .tooth-16, .tooth-15, .tooth-14,
.tooth-13, .tooth-12, .tooth-11, .tooth-21, .tooth-22,
.tooth-23, .tooth-24, .tooth-25, .tooth-26, .tooth-27,
.tooth-28, .tooth-31, .tooth-32, .tooth-33, .tooth-34,
.tooth-35, .tooth-36, .tooth-37, .tooth-38, .tooth-41,
.tooth-42, .tooth-43, .tooth-44, .tooth-45, .tooth-46,
.tooth-47, .tooth-48, .tooth-55, .tooth-54, .tooth-53, .tooth-52,
.tooth-51, .tooth-61, .tooth-62, .tooth-63, .tooth-64,
.tooth-65, .tooth-71, .tooth-72, .tooth-73, .tooth-74,
.tooth-75, .tooth-81, .tooth-82, .tooth-83, .tooth-84,
.tooth-85 {
    cursor: pointer;
    pointer-events: all; /* Ensure clicks are registered */
    border: 2px solid #000; /* Add border for better visibility */
    padding: 10px; /* Optional: add padding */
    box-sizing: border-box; /* Include padding and border in total width/height */
    border-radius: 4px; /* Optional: rounded corners */
}

.tooth-18:hover, .tooth-17:hover, .tooth-16:hover, .tooth-15:hover, .tooth-14:hover,
.tooth-13:hover, .tooth-12:hover, .tooth-11:hover, .tooth-21:hover, .tooth-22:hover,
.tooth-23:hover, .tooth-24:hover, .tooth-25:hover, .tooth-26:hover, .tooth-27:hover,
.tooth-28:hover, .tooth-31:hover, .tooth-32:hover, .tooth-33:hover, .tooth-34:hover,
.tooth-35:hover, .tooth-36:hover, .tooth-37:hover, .tooth-38:hover, .tooth-41:hover,
.tooth-42:hover, .tooth-43:hover, .tooth-44:hover, .tooth-45:hover, .tooth-46:hover,
.tooth-47:hover, .tooth-48:hover, .tooth-55:hover, .tooth-54:hover, .tooth-53:hover,
.tooth-52:hover, .tooth-51:hover, .tooth-61:hover, .tooth-62:hover, .tooth-63:hover,
.tooth-64:hover, .tooth-65:hover, .tooth-71:hover, .tooth-72:hover, .tooth-73:hover,
.tooth-74:hover, .tooth-75:hover, .tooth-81:hover, .tooth-82:hover, .tooth-83:hover,
.tooth-84:hover, .tooth-85:hover {
    border-color: #007BFF; /* Change border color on hover */
}
        
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
        
        
        .summary, .treatment-plan {
            margin-top: 20px;
        }
        
         .hidden {
            display: none;
        }
        .complaint-row {
            margin-bottom: 10px;
        }
        .complaint-preview {
            font-style: italic;
            color: #555;
            margin-top: 5px;
        }
        /* SVG Tooth color styling */
        .highlighted {
            fill: red; /* Change color as per the requirement */
        
    </style>
</head>

<body>
  
  
  

<h2>Register Patient</h2>

<form method="post" action="handle_registration.php"  enctype="multipart/form-data">
   
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
             


</head>
<body>

   



                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label class="col-sm-3" for="systemic">Any systemic diseases:</label>
                    <div class="col-sm-7">
                        <input type="text" name="systemic" class="form-control" id="Anyothersys" placeholder="any other known systemic diseases">
                    </div>
                </div>
                
                
         <div>       
                
    <!-- Dropdown menu -->
<label for="toothType">Select Tooth Type:</label>
<select id="toothType">
    <option value="" disabled selected>Select Dentition</option> <!-- Placeholder option -->
    <option value="edentulous">Edentulous</option>
    <option value="permanent">Permanent</option>
    <option value="mixed">Mixed</option>
    <option value="primary">Primary</option> <!-- Added Primary option here -->
</select>
    

    <!-- Complaint Selection -->
    <label for="chief-complaint">Chief Complaint:</label>
    <select id="chief-complaint">
        <option value="no">No</option>
        <option value="yes">Yes</option>
    </select>

    <div id="complaint-rows" class="hidden">
        <label for="complaint-count">Number of Complaints:</label>
        <select id="complaint-count">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        <div id="complaints-container"></div>
    </div>

    <!-- Summary and Suggestion -->
    <div>
        <p id="summary-complaints">Chief Complaints: </p>
        <p id="suggestion-box">Suggestions: </p>
    </div>
    
    
    
    
                <h1>Odontogram</h1>
                
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
                                <defs>   <marker refX="0" refY="0" orient="auto" overflow="visible">
      <circle r="0.8" cy="0" cx="3"/>
      <circle r="0.8" cy="0" cx="6.5"/>
      <circle r="0.8" cy="0" cx="10"/>
    </marker>
    <marker orient="auto" refY="0" refX="0" overflow="visible">
      <path d="m5.77 0-8.65 5 0-10 8.65 5z" transform="scale(-0.2,-0.2)" style="fill-rule:evenodd;marker-start:none;stroke-width:1pt;stroke:#000"/>
    </marker>
    <marker orient="auto" refY="0" refX="0" overflow="visible">
      <path d="M0 0 5-5-12.5 0 5 5 0 0z" transform="matrix(0.2,0,0,0.2,1.2,0)" style="fill-rule:evenodd;marker-start:none;stroke-width:1pt;stroke:#000"/>
    </marker>
    <marker orient="auto" refY="0" refX="0" overflow="visible">
      <path d="M0 0 5-5-12.5 0 5 5 0 0z" transform="matrix(0.8,0,0,0.8,10,0)" style="fill-rule:evenodd;marker-start:none;stroke-width:1pt;stroke:#000"/>
    </marker></defs>
    
    
    <path
    class="tooth-11 tooth-11-parent"
    d="m 113.894,31.723601 c 0.0561,0.43476 3.08165,4.91178 3.84449,6.93412 1.03137,2.18327 2.67371,4.15697 7.0469,5.19412 3.57083,-0.36803 7.19248,-0.4467 10.19825,-4.03315 l 7.38989,-9.40518 1.34756,-2.99193 c 0.97308,-2.16029 -1.13419,-4.14679 -3.10702,-4.99829 l -5.34936,-1.19716 c -3.12438,-0.16807 -5.19809,-0.93656 -11.30278,0.59905 l -5.72815,1.04816 c -2.08382,0.77109 -4.86648,0.46927 -4.92056,4.35665 0.10953,1.48595 -0.58405,2.8577 0.58078,4.49361 z"
    style="fill:lightblue;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-11"
    d="m 119.37781,37.475811 -1.30961,-9.17465 c 0.71031,0 -0.79931,-1.85218 1.86701,-2.67885 9.73684,-3.18201 15.36382,-0.84956 16.95192,-0.1499 1.58809,0.69959 2.96678,2.61285 2.6621,4.62294 -0.30463,2.01002 -0.97137,2.49278 -1.42348,3.49091"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-12 tooth-12-parent"
    d="m 91.428666,35.605041 c 11.503464,-6.33738 9.146764,-4.4876 14.070254,-5.89646 1.71617,-0.51474 3.14074,-0.59168 3.86485,0.38286 l 2.6696,2.25199 c 1.81413,1.91332 1.6934,2.3195 1.92366,2.99912 0.8546,5.9162 -0.13307,5.84195 -0.32349,8.35998 -1.31549,2.1432 -2.9041,4.05602 -5.59189,5.04156 -1.65863,0.98199 -3.95557,0.88559 -6.39559,0.54752 l -4.012326,-0.81993 c -1.573083,0.19851 -2.928476,-0.68202 -4.307691,-1.44457 -2.910666,-1.71458 -3.662865,-4.14821 -4.663646,-6.49914 -0.201289,-1.52053 0.314192,-2.86745 1.499619,-4.05225 z"
    style="fill:lightblue;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-12"
    d="m 94.666436,46.343741 c -1.544027,-2.01495 -4.015778,-3.64326 -1.017236,-7.55177 2.750396,-1.80114 4.902858,-2.35706 7.29674,-3.41563 2.06063,-0.87054 4.10556,-1.71496 5.58118,-1.60995 6.1448,-0.49504 3.61491,0.73686 5.2752,1.13465"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-12"
    d="m 107.55706,37.262661 c 0.52599,2.30909 1.01611,4.67803 2.51107,5.37139"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-12"
    d="m 104.03277,46.863471 c 0.2176,-1.96646 -3.19877,-2.7984 -6.010321,-3.81921"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>	
  <path
    class="tooth-13 tooth-13-parent"
    d="m 76.924949,61.279161 c -4.661053,-1.305 -6.843883,-3.69247 -7.339272,-6.81701 -0.575848,-3.05499 0.06037,-6.03463 2.258302,-8.91722 1.922291,-4.48919 3.829829,-4.24058 5.739016,-4.5421 1.703054,0.18022 3.25096,0.0983 4.758501,-0.0522 4.556612,-0.16942 6.253977,1.56471 7.352032,2.69905 3.845015,4.32077 3.420426,6.83837 4.35558,9.93011 0.481064,3.41383 0.268826,6.33289 -1.809063,7.91994 -6.322272,3.96823 -7.396961,2.02387 -10.042838,1.84972 -4.927107,-1.74143 -3.659851,-1.42841 -5.272258,-2.07053 z"
    style="fill:lightblue;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-13"
    d="m 74.039227,56.842881 c 0.221473,-4.22581 0.644762,-8.23493 3.005608,-10.16346 2.336081,-2.05381 5.341768,-3.54265 9.455081,-4.0972"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-13"
    d="m 88.421251,46.330051 c 2.787923,9.10135 3.996541,11.24926 -3.288822,5.60813"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-13"
    d="m 81.92554,55.113251 c 6.138064,6.23387 2.066664,5.31188 -4.543407,2.61052"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14 tooth-14-parent"
    d="m 64.287549,60.689891 c -7.036983,2.05655 -7.499595,4.89403 -7.533489,7.78258 -0.357912,12.705 12.493542,12.48996 14.982456,11.51324 3.915814,0.40697 6.635348,0.029 8.775402,-0.72941 3.996026,-0.2573 5.920727,-2.26187 6.559363,-5.35139 0.584996,-1.65849 0.784388,-3.47976 -0.204908,-5.80303 -0.723248,-1.2977 -0.231398,-2.54169 -4.671496,-4.00347 -4.681827,-0.43301 -6.163843,-1.42956 -8.096137,-2.51347 -2.779381,-2.5312 -6.236813,-1.97896 -9.811191,-0.89505 z"
    style="fill:lightblue;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14"
    d="m 70.978866,60.704571 c 0.0319,0.62403 0.571799,1.24913 -1.269769,1.86896 -3.189123,2.1702 -2.973255,3.77656 -2.247001,5.29849 1.476584,2.35431 0.950066,3.46905 -0.532899,3.99204 -4.599213,3.74372 -3.551609,4.51177 -4.778427,6.47835"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14"
    d="m 65.279354,76.415121 c 4.29831,-0.5114 7.758754,-1.93772 8.717783,-6.09536 0.507031,-2.40736 -1.153684,-3.78149 -3.404816,-4.87414"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14"
    d="m 80.848615,66.653581 c -5.617237,0.47275 -7.424129,1.68252 -6.70124,3.16737 -0.01555,3.9172 1.465284,2.98769 2.514615,4.24825"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14"
    d="m 71.523837,76.678431 c 0.797156,-0.87177 0.530229,-1.74585 0.156881,-2.62015"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14"
    d="m 76.168244,65.520251 c -1.961012,1.51323 -2.158947,2.29157 -2.165412,2.99014"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-14"
    d="m 82.63766,65.160111 c 1.377059,2.5781 0.0085,4.69009 0.27693,6.55188 0.256583,2.59532 -0.660889,4.80462 -3.959888,6.23063 -2.028464,0.95862 -4.49012,1.15425 -6.695376,1.29552"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15 tooth-15-parent"
    d="m 57.473765,80.464991 c -8.431027,1.00936 -12.429637,4.65891 -9.877252,12.21083 2.688393,2.77158 5.132545,5.74701 9.695968,6.95317 1.616986,-0.0283 3.036904,0.10824 4.006631,0.620389 1.399996,0.32137 3.003957,0.31919 4.73703,0.11232 3.263724,-1.454589 7.652073,-0.2444 9.490541,-5.075989 1.517631,-3.86591 1.258553,-7.27018 -2.398877,-9.79138 -7.228529,-5.07305 -11.201614,-4.64639 -15.654041,-5.02934 z"
    style="fill:lightblue;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15"
    d="m 64.017607,99.560231 c 3.218535,-1.83743 7.516836,-0.29878 8.940041,-5.84531 0.251569,-1.76849 1.693998,-3.85582 -1.610955,-7.92747"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15"
    d="m 59.537149,80.979141 c -1.068561,1.04034 -2.062091,2.01914 -1.663212,3.13974 -0.465371,1.29699 -0.463993,1.67812 -0.539801,2.15625 -0.660628,1.03004 -0.710131,1.29501 -0.733588,1.52747 0.02241,1.78692 0.379987,2.18359 0.720566,2.65202 0.962308,2.36493 0.08107,2.86361 -0.497281,3.66865 -0.586201,0.7973 -1.405345,0.40277 -1.708838,2.64665"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15"
    d="m 65.803025,97.201131 c -4.094686,-1.19002 -4.354798,-3.01483 -3.628538,-5.00291 -0.431478,-3.19923 1.120741,-5.05945 2.209051,-7.23283"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15"
    d="m 68.144634,86.400831 c -1.701079,0.17297 -3.401807,0.21793 -5.104514,0.90622"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15"
    d="m 60.255473,84.344691 c 1.8564,1.33738 2.431475,2.4029 3.025951,3.47262"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-15"
    d="m 57.544054,96.877191 c 0.78275,-0.67 2.222159,-1.66864 4.62569,-3.14996"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-16 tooth-16-parent"
    d="m 40.400929,101.93638 c 8.540214,-6.220469 14.83636,-2.627509 21.132851,0.9639 1.70039,1.7707 3.363687,3.5413 5.692529,5.31326 7.131417,5.75158 5.79007,9.65482 1.660196,12.94987 -2.573952,2.39643 -5.039142,4.74748 -6.337117,6.61203 -1.48762,1.28541 -2.855361,2.27152 -4.017065,2.7435 -5.497444,2.07161 -7.596361,-0.81763 -10.682339,-2.26609 -11.087339,-4.90405 -15.057835,-11.73539 -12.204887,-20.4145 0.31436,-3.34607 2.189645,-4.99871 4.755832,-5.90197 z"
    style="fill:lightblue;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-16"
    d="m 41.71356,109.48273 c -1.793872,-6.97856 2.534794,-6.20622 4.883559,-7.94042 4.080457,-0.82336 7.498474,-2.828319 14.329591,1.25469 5.087701,5.94121 3.566612,9.2765 4.209478,13.4651 0.314098,3.99921 -1.116603,6.42981 -3.059932,7.43475 -0.483572,2.15731 -0.369384,4.22178 -4.634918,6.10614 -3.630005,2.71627 -6.181271,0.37991 -8.863197,-1.34468 -4.038369,-0.91091 -4.687008,-3.13754 -4.596452,-6.2283 -8.218179,-2.99932 -3.622847,-8.66354 -2.268129,-12.74728 z"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none"/>
  <path
    class="tooth-16"
    d="m 57.646425,102.99366 c -0.835531,0.82319 -1.950837,0.9361 -2.196631,3.25721 0.377749,2.37943 -1.179557,4.75452 -2.694602,7.12975 -1.566707,1.27953 -1.058127,4.7477 -1.480204,7.23439 1.534795,1.22758 3.073385,1.24141 4.612322,1.13147 l 2.90866,2.14709"
    style="fill:none;stroke:#000000;stroke-width:1;stroke-linecap:round;stroke-linejoin:miter
  <text xml:space="preserve" class="tooth-11" x="120.37785" y="17.284296" font-size="10px"
    fill="black">11</text>
  
   <text xml:space="preserve" class="tooth-12" x="85.630409" y="28.142862" font-size="10px"
    fill="black">12</text>
    
 <text xml:space="preserve" class="tooth-13" x="56.67421" y="43.344887" font-size="10px"
    fill="black">13</text>
    
  <text xml:space="preserve" class="tooth-14" x="42.92001" y="64.338097" font-size="10px"
    fill="black">14</text>
  
  <text xml:space="preserve" class="tooth-15" x="32.785339" y="88.226982"font-size="10px"
    fill="black" >15
  </text>
  <text xml:space="preserve" class="tooth-16" x="19.031139" y="110.66804" font-size="10px"
    fill="black">16 </text>
  
  <text xml:space="preserve"  class="tooth-17" x="12.515995" y="141.07207" font-size="10px"
    fill="black">17</text>
  <text xml:space="preserve" class="tooth-18"  x="8.8964691" y="172.2" font-size="10px"
    fill="black">18</text>
  
  <text xml:space="preserve" class="tooth-21" x="155.84921" y="17.284296" font-size="10px"
    fill="black">21</text>
  <text xml:space="preserve" class="tooth-22" x="192.76837" y="29.590677" font-size="10px"
    fill="black">22</text>
  <text xml:space="preserve" class="tooth-23" x="220.27673" y="44.068779"font-size="10px"
    fill="black">23</text>
  <text xml:space="preserve" class="tooth-24" x="236.20268" y="64.338097" font-size="10px"
    fill="black">24</text>
  <text xml:space="preserve" class="tooth-25" x="247.06125" y="86.779167" font-size="10px"
    fill="black">25</text>
  <text xml:space="preserve" class="tooth-26" x="258.64374" y="109.22027" font-size="10px"
    fill="black">26</text>
  <text xml:space="preserve" class="tooth-27" x="264.43497" y="139.62425" font-size="10px"
    fill="black">27</text>
  <text xml:space="preserve" class="tooth-28" x="268.77841" y="169.3044"font-size="10px"
    fill="black">28</text>
  <text xml:space="preserve"  class="tooth-31" x="151.50578" y="360.41531" font-size="10px"
    fill="black">31</text>
  <text xml:space="preserve" class="tooth-32" x="176.84245" y="355.34799" font-size="10px"
    fill="black">32</text>
  <text xml:space="preserve"  class="tooth-33" x="202.17912" y="346.6611" font-size="10px"
    fill="black">33</text>
  <text xml:space="preserve" class="tooth-34" x="222.44849" y="330.01129" font-size="10px"
    fill="black">34</text>
  <text xml:space="preserve" class="tooth-35"  x="240.5461" y="309.01804" font-size="10px"
    fill="black">35</text>
  <text xml:space="preserve" class="tooth-36" x="257.91986" y="282.95749" font-size="10px"
    fill="black">36</text>

</svg>

   <script>
        document.getElementById('toothType').addEventListener('change', function () {
    var selectedValue = this.value;

    // Hide all teeth initially by selecting paths that contain classes starting with "tooth-"
    document.querySelectorAll('[class^="tooth-"]').forEach(function (path) {
        path.style.display = 'none';
    });

    // Show teeth based on the selected option
    if (selectedValue === 'permanent') {
        // Show all teeth with classes starting with "tooth-"
        document.querySelectorAll('.tooth-11, .tooth-12,.tooth-13, .tooth-14, .tooth-15, .tooth-16, .tooth-17,.tooth-18,.tooth-21,.tooth-22,.tooth-23,.tooth-24,.tooth-25,.tooth-26,.tooth-27,.tooth-28,.tooth-31,.tooth-32,.tooth-33,.tooth-34,.tooth-35,.tooth-36,.tooth-37,.tooth-38,.tooth-41,.tooth-42,.tooth-43,.tooth-44,.tooth-45,.tooth-46,.tooth-47,.tooth-48').forEach(function (path) {
            path.style.display = 'block';
        });
    } else if (selectedValue === 'mixed') {
        // Show specific teeth with class "tooth-11" and "tooth-12"
        document.querySelectorAll('[class^="tooth-"]').forEach(function (path) {
            path.style.display = 'block';
        });
    }
    
    else if (selectedValue === 'primary') {
        // Show specific teeth with class "tooth-11" and "tooth-12"
        document.querySelectorAll('.tooth-51,.tooth-52,.tooth-53,.tooth-54,.tooth-55,.tooth-61,.tooth-62,.tooth-63,.tooth-64,.tooth-65,.tooth-71,.tooth-72,.tooth-73,.tooth-74,.tooth-75,.tooth-81,.tooth-82,.tooth-83,.tooth-84,.tooth-85').forEach(function (path) {
            path.style.display = 'block';
        });
    }
    // For 'edentulous', no teeth are shown as they're hidden by default
});
    </script>





<div id="inputContainer" style="display: none;">
    <div class="input-grid">
        <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_18" data-tooth="18" placeholder="Enter findings">
            <span class="tooth-number">18</span>
        </div>
        <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_17" data-tooth="17" placeholder="Enter findings">
            <span class="tooth-number">17</span>
        </div>
        <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_16" data-tooth="16" placeholder="Enter findings">
            <span class="tooth-number">16</span>
        </div>
        <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_15" data-tooth="15" placeholder="Enter findings">
            <span class="tooth-number">15</span>
        </div>
       <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_14" data-tooth="14" placeholder="Enter findings">
            <span class="tooth-number">14</span>
        </div>
        <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_13" data-tooth="13" placeholder="Enter findings">
            <span class="tooth-number">13</span>
        </div>
        <div class="input-wrapper">
            <input type="text" class="input-box" name="findings_12" data-tooth="12" placeholder="Enter findings">
            <span class="tooth-number">12</span>
        </div>

   
        
    </div>
</div>

<div>
    <h2>Tooth Conditions Summary</h2>
    <p id="summary-decayed">Decayed: </p>
    <p id="summary-missing">Missing: </p>
    <p id="summary-treated">Treated: </p>
  <p id="summary-viable">non-viable: </p>
   <p id="summary-minor">minor: </p>
   <p id="summary-none">Normal: </p>
</div>


<div id="dmft"></div>
<div id="kennedy-classification"></div>

    <script>
        document.getElementById('manualInputButton').addEventListener('click', function() {
            var inputContainer = document.getElementById('inputContainer');
            if (inputContainer.style.display === 'none') {
                inputContainer.style.display = 'block';
            } else {
                inputContainer.style.display = 'none';
            }
        });
    </script>

                        
                  
                    
                    
                    
                        <div class="treatment-plan" id="treatment-plan">
            <h2>Treatment Plan</h2>
            <!-- Treatment plan inputs will be dynamically added here -->
        </div>
        
        
        </div>
        <div class="col-sm-3"></div>
    </div>
    
                        <div class="treatment-plan" id="treatment-plan">
            <!-- Treatment plan inputs will be dynamically added here -->
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




 
    
    <!-- chief complaint script -->

  
    <script>
      $(document).ready(function() {
    // Show or hide the complaint rows based on the chief complaint selection
    $('#chief-complaint').on('change', function() {
        if ($(this).val() === 'yes') {
            $('#complaint-rows').removeClass('hidden');
            $('#complaint-count').val(1).change(); // Set complaint count to 1
        } else {
            $('#complaint-rows').addClass('hidden');
            $('#complaints-container').empty();
            $('#summary-complaints').text('Chief Complaints: ');
            $('#suggestion-box').text('Suggestions: ');
            resetToothColors(); // Reset tooth colors on 'No'
        }
    });
   // Handle changes in the number of complaints
    $('#complaint-count').on('change', function() {
        var count = $(this).val();
        var complaintOptions = ['Pain', 'Discoloration', 'Sensitivity', 'Swelling', 'Bleeding'];
        var toothOptions = [11, 12, 13, 14, 15]; // Add relevant tooth numbers

        // Clear existing complaint rows
        $('#complaints-container').empty();

        // Generate complaint rows based on the selected count
        for (var i = 0; i < count; i++) {
            var complaintRow = `
                <div class="complaint-row">
                    <label>Complaint ${i + 1}:</label>
                    <select class="complaint-type">
                        ${complaintOptions.map(opt => `<option value="${opt}">${opt}</option>`).join('')}
                    </select>
                    <select class="complaint-region">
                        ${toothOptions.map(opt => `<option value="${opt}">${opt}</option>`).join('')}
                    </select>
                    <input type="datetime-local" class="complaint-time">
                    <!-- Preview area for the complaint -->
                    <div class="complaint-preview" id="preview-${i}">Preview: None selected yet</div>
                </div>`;
            $('#complaints-container').append(complaintRow);
        }

        updateChiefComplaintSummary();
    });

    // Function to format time into a semantic string
    function formatTimeSince(datetime) {
        const now = new Date();
        const past = new Date(datetime);
        const seconds = Math.floor((now - past) / 1000);
        let interval;

        if (seconds < 60) return 'just now';
        interval = Math.floor(seconds / 31536000); // Years
        if (interval >= 1) return `${interval} year${interval > 1 ? 's' : ''} ago`;
        interval = Math.floor(seconds / 2592000); // Months
        if (interval >= 1) return `${interval} month${interval > 1 ? 's' : ''} ago`;
        interval = Math.floor(seconds / 86400); // Days
        if (interval >= 1) return `${interval} day${interval > 1 ? 's' : ''} ago`;
        interval = Math.floor(seconds / 3600); // Hours
        if (interval >= 1) return `${interval} hour${interval > 1 ? 's' : ''} ago`;
        interval = Math.floor(seconds / 60); // Minutes
        if (interval >= 1) return `${interval} minute${interval > 1 ? 's' : ''} ago`;
        
        return 'just now';
    }


    // Set to track currently highlighted teeth
    var highlightedTeeth = new Set();

    // Function to reset all tooth colors
    function resetToothColors() {
        $('[class^=tooth-]').attr('fill', 'black'); // Reset to original color
    }

    // Function to update the colors of all teeth based on the highlighted set
    function updateToothColors() {
        resetToothColors(); // First reset all colors
        highlightedTeeth.forEach(function(toothNumber) {
            $(`.tooth-${toothNumber}`).attr('fill', 'red'); // Highlight selected teeth
        });
    }

    

    // Function to update the summary of chief complaints
    function updateChiefComplaintSummary() {
        var count = $('#complaint-count').val();
        var summary = `Number of Chief Complaints: ${count}. Chief Complaints: `;

        highlightedTeeth.clear(); // Clear previous highlights

        $('.complaint-row').each(function() {
            var type = $(this).find('.complaint-type').val();
            var region = $(this).find('.complaint-region').val();
            var time = $(this).find('.complaint-time').val();
            if (type && region && time) {
                var semanticTime = formatTimeSince(time);
                summary += `Patient complains of ${type} in tooth ${region} since ${semanticTime}. `;
                highlightedTeeth.add(region); // Add the tooth number to highlighted set
            }
        });

        updateToothColors(); // Update the highlights based on the current selections
        $('#summary-complaints').text(summary);
        highlightTeethInPreview(); // Update the preview highlights
    }

    // Update the preview for each complaint row
    function updateComplaintPreview() {
        $('.complaint-row').each(function(index) {
            var type = $(this).find('.complaint-type').val();
            var region = $(this).find('.complaint-region').val();
            var time = $(this).find('.complaint-time').val();

            var previewText = `Selected: ${type ? type : 'None'}, Tooth: ${region ? region : 'None'}, Time: ${time ? time : 'None'}`;
            $(`#preview-${index}`).text(previewText);
        });
    }

    // Update the preview, summary, and suggestion box when complaint details are changed
    $(document).on('change', '.complaint-row select, .complaint-row input', function() {
        updateComplaintPreview();
        updateChiefComplaintSummary();
    });

    // Handle form submission
    $('#submit-button').on('click', function(e) {
        e.preventDefault();
        alert('Form submitted!');
        // Add form submission logic here
    });
});
                // Clear existing complaint rows
                
            
          //colour change after selecting tooth number

            // Function to highlight a tooth in the SVG
            
    </script>



<script>
  $(document).ready(function() {
    var states = ['decayed', 'missing', 'treated', 'viable', 'none'];
    var currentIndex = {
        11: 0, 12: 0, 13: 0, 14: 0, 15: 0, 16: 0, 17: 0, 18: 0,
        21: 0, 22: 0, 23: 0, 24: 0, 25: 0, 26: 0, 27: 0, 28: 0,
        31: 0, 32: 0, 33: 0, 34: 0, 35: 0, 36: 0, 37: 0, 38: 0,
        41: 0, 42: 0, 43: 0, 44: 0, 45: 0, 46: 0, 47: 0, 48: 0,
        51: 0, 52: 0, 53: 0, 54: 0, 55: 0,
        61: 0, 62: 0, 63: 0, 64: 0, 65: 0,
        71: 0, 72: 0, 73: 0, 74: 0, 75: 0,
        81: 0, 82: 0, 83: 0, 84: 0, 85: 0
    };

    var toothConditions = {
        decayed: [],
        missing: [],
        treated: [],
        viable: [],
        none: [],
    };

    function updateState(tooth, toothNumber, state) {
        switch (state) {
            case 'decayed':
                $(tooth).css('fill', '#795C34'); // Decayed
                break;
            case 'missing':
                $(tooth).css('fill', 'black'); // Missing
                break;
            case 'treated':
                $(tooth).css('fill', 'green'); // Treated
                break;
            case 'viable':
                $(tooth).css('fill', 'red'); // Viable
                break;
            default:
                $(tooth).css('fill', 'none'); // None
                break;
        }

        Object.keys(toothConditions).forEach(function(key) {
            var index = toothConditions[key].indexOf(toothNumber);
            if (index !== -1) {
                toothConditions[key].splice(index, 1);
            }
        });
        toothConditions[state].push(toothNumber);

        updateSummary();
        updateTreatmentPlan();
        calculateDMFT();
        classifyKennedy();
    }

    function updateSummary() {
        $('#summary-decayed').text('Decayed: ' + toothConditions.decayed.join(', '));
        $('#summary-missing').text('Missing: ' + toothConditions.missing.join(', '));
        $('#summary-treated').text('Treated: ' + toothConditions.treated.join(', '));
        $('#summary-viable').text('Viable: ' + toothConditions.viable.join(', '));
        $('#summary-none').text('Normal: ' + toothConditions.none.join(', '));
    }

    function updateTreatmentPlan() {
        $('#treatment-plan').empty();
        var groupedConditions = {
            decayed: [],
            missing: [],
            treated: [],
            viable: []
        };

        toothConditions.decayed.forEach(function(tooth) {
            groupedConditions.decayed.push(tooth);
        });
        toothConditions.missing.forEach(function(tooth) {
            groupedConditions.missing.push(tooth);
        });
        toothConditions.treated.forEach(function(tooth) {
            groupedConditions.treated.push(tooth);
        });
        toothConditions.viable.forEach(function(tooth) {
            groupedConditions.viable.push(tooth);
        });

        for (var key in groupedConditions) {
            if (groupedConditions[key].length > 0) {
                var section = $('<div>').append($('<h3>').text(key.charAt(0).toUpperCase() + key.slice(1) + ' Teeth'));
                groupedConditions[key].forEach(function(tooth) {
                    var inputType;

                    if (key === 'decayed') {
                        if (['11', '12','13','21','22','23','31','32','33','41','42','43'].includes(tooth.toString())) {
                            inputType = $('<select>').append(
                                $('<option>').val('pit').text('pit and fissure caries'),
                                $('<option>').val('proximal').text('proximal caries'),
                                $('<option>').val('root').text('root caries'),
                                
                                $('<option>').val('pulpitis').text('Pulpitis')
                            );
                            
                            if (key === 'proximal')
                            inputType = $('<select>').append(
                                $('<option>').val('lingual').text('lingual caries'),
                                $('<option>').val('labial').text('labial caries'),
                                $('<option>').val('distal').text('distal caries'),
                                
                                $('<option>').val('mesial').text('mesial caries')
                            );
                            
                        } else if (['44','45','46', '47', '48','34','35','36','37','38','24','25','26','27','28','15','16','17','18'].includes(tooth.toString())) {
                            inputType = $('<select>').append(
                                $('<option>').val('pit').text('pit and fissure caries'),
                                $('<option>').val('proximal').text('proximal caries'),
                                $('<option>').val('root').text('root caries'),
                                $('<option>').val('pulpitis').text('Pulpitis')
                            );
                        } else {
                            inputType = $('<select>').append(
                                $('<option>').val('class5').text('Class 5'),
                                $('<option>').val('class6').text('Class 6'),
                                $('<option>').val('pulpitis').text('Pulpitis')
                            );
                        }
                    } else {
                        inputType = $('<select>').append(
                            $('<option>').val('root-canal').text('Root Canal'),
                            $('<option>').val('restorative').text('Restorative'),
                            $('<option>').val('prosthesis').text('Prosthesis')
                        );
                    }

                    section.append($('<div>').text('Tooth ' + tooth), inputType.attr('data-tooth', tooth).addClass('treatment-input'));
                });
                $('#treatment-plan').append(section);
            }
        }
    }
    
    

    function calculateDMFT() {
        var decayedCount = toothConditions.decayed.length;
        var missingCount = toothConditions.missing.length;
        var treatedCount = toothConditions.treated.length;
        var dmft = decayedCount + missingCount + treatedCount;

        $('#dmft').text('DMFT Index: ' + dmft);
    }

    function classifyKennedy() {
        var missingTeeth = toothConditions.missing;
        var classification;

        if (missingTeeth.length === 0) {
            classification = 'No Kennedy Classification';
        } else if (missingTeeth.includes(36) || missingTeeth.includes(46)) {
            classification = 'Class I';
        } else if (missingTeeth.includes(37) || missingTeeth.includes(47)) {
            classification = 'Class II';
        } else {
            classification = 'Class III or IV';
        }

        $('#kennedy-classification').text('Kennedy Classification: ' + classification);
    }

    function handleToothClick(toothNumber) {
        var toothClass = '.tooth-' + toothNumber + '-parent';
        var selectedOption = states[currentIndex[toothNumber]];
        updateState(toothClass, toothNumber, selectedOption);
        currentIndex[toothNumber] = (currentIndex[toothNumber] + 1) % states.length;
    }

    $(document).on('click', '[class^="tooth-"]', function() {
        var toothNumber = $(this).attr('class').match(/tooth-(\d+)/)[1];
        handleToothClick(toothNumber);
    });

    $('#submit-button').on('click', function(e) {
        e.preventDefault();
        $.ajax({
            url: $('#odontogram-form').attr('action'),
            type: $('#odontogram-form').attr('method'),
            data: {
                decayed: toothConditions.decayed.join(','),
                missing: toothConditions.missing.join(','),
                treated: toothConditions.treated.join(','),
                viable: toothConditions.viable.join(','),
                none: toothConditions.none.join(','),
                treatmentPlan: $('.treatment-input').map(function() {
                    return { tooth: $(this).data('tooth'), treatment: $(this).val() };
                }).get()
            },
            success: function(response) {
                alert('Data submitted successfully!');
                window.location.href = 'view_data.php';
            },
            error: function(xhr, status, error) {
                alert('Error submitting data: ' + error);
            }
        });
    });
});
  
  
</script>


<div id="summary"></div>


    