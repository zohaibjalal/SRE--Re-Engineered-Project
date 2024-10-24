<html>
    <body>
    <?php
        ///user_name start
    
  if (empty($_POST["user_name"])) {
    $user_nameErr = "name is required";
  } else {
    $user_name = test_input($_POST["user_name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$user_name)) {
      $user_nameErr = "Only letters and white space allowed"; 
    }else
    	$user_name1 = $_POST["user_name"];
  }echo "<br>"; /// user_name over
    
    
  /// password start
  

if (empty($_POST["password"])) {
  $passwordErr = "password is required";
} else {
  $password = test_input($_POST["password"]);
  // check if password contains only contains letters
      $password1 = $_POST["password"];
     if (!preg_match("/^[a-zA-Z]*$/",$password)) {
    $passwordErr = "Only letters allowed"; 
  }else
      $password = $_POST["password"];
}
    echo "<br>";

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

$conn->close()
    ?>
    </body>
</html>