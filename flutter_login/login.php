<?php
    $HostName = "localhost";
    
    $DatabaseName = "first";
    
    $HostUser = "root";
    
    $HostPass = ""; 

    $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);


        $userName = $_POST["userName"];
        $pass = $_POST["pass"];


        $query ="SELECT * FROM admin WHERE userName ='".$userName."' AND pass= '".$pass."'";

        $res= mysqli_query($con, $query);
        $data = mysqli_num_rows($res);

            if($data ==1){
                echo json_encode("Success");
            }else{
                echo json_encode("Error");
            }

?>