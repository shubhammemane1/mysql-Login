<?php
    $HostName = "localhost";
    
    $DatabaseName = "first";
    
    $HostUser = "root";
    
    $HostPass = ""; 

    $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);


    $userName = $_POST["userName"];
    $email = $_POST["email"];
    $pass = $_POST["pass"];
 
// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM admin WHERE userName='$userName'";
 
// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));
 
 
if(isset($check)){
 
	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	 
	// Echo the message on Screen.

	 echo $existEmailJSON ; 
 
  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into admin (userName,email,pass) values ('$userName','$email','$pass')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	 
		echo 'Try Again';
	 
	 }
 }
?>
