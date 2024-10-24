<html>
    <body>
    <?php
// define variables and set to empty values
$nameErr =$donor_idErr = $nameErr = $blood_groupErr = $ageErr = $phnErr = "";
$name = $donor_id = $name = $blood_group = $age = $phn = "";
$name1 = $donor_id1 = $name1 = $blood_group1 = $age1 = $phn1 ="";

    ///////donor_id start
    
    
    
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  
    if (empty($_POST["donor_id"])) {
    $donor_idErr = "donor_id is required";
  } else {
    $donor_id = test_input($_POST["donor_id"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[0-9 ]*$/",$donor_id)) {
      $nameErr = "Only number and white space allowed"; 
    }else
    	$donor_id1 = $_POST["donor_id"];
  }echo "<br>";
  ///  donor_id over
    
    
    ///name start
    
  if (empty($_POST["name"])) {
    $nameErr = "name is required";
  } else {
    $name = test_input($_POST["name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
      $nameErr = "Only letters and white space allowed"; 
    }else
    	$name1 = $_POST["name"];
  }echo "<br>";

  /// name over
    
    
    /// blood group start
    

  if (empty($_POST["blood_group"])) {
    $blood_groupErr = "Blood_group is required";
  } else {
    $blood_group = test_input($_POST["blood_group"]);
    // check if blood_group contains only contains letters
    	$blood_group1 = $_POST["blood_group"];
       if (!preg_match("/^[a-zA-Z+-]*$/",$blood_group)) {
      $blood_groupErr = "Only letters and operators allowed"; 
    }else
    	$blood_group = $_POST["blood_group"];
  }
  	echo "<br>";
/// blood_groupis over
    
    
  
/// age start
  	if (empty($_POST["age"])) {
    $ageErr = "age is required";
  } else {
    $age = test_input($_POST["age"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[0-9 ]*$/",$age)) {
      $ageErr = "Only  numbers and white space allowed"; 
    } 
    	else  $age1= $_POST["age"];
  }
    echo "<br>";
    /// age end
    
    ////start phone
    
     if (empty($_POST["phn"])) {
    $phnErr = "phone no is required";
  } else {
    $phn = test_input($_POST["phn"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[0-9 ]*$/",$phn)) {
      $phnErr = "Only  numbers and white space allowed"; 
    } 
    	else  $phn1= $_POST["phn"];
  }
    echo "<br>";
    
    
    
}
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

////connection

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "blood bank";



// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
////
$sql = "INSERT INTO donar_details
VALUES ($donor_id1,'$name1','$blood_group1',$age1,$phn1)";
if ($conn->query($sql) === TRUE) {
   
    include 'disptri.php';
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close()

?>
</body>
</html>
