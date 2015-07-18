<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Location Entry</title>
</head>

<body>
<?php
    include ("db_connect.php");

?>
<?php

     $device_id = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['device_id']))));
     $long = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['long']))));
     $lat = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['lat']))));
	   $spd = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['spd']))));
	    $time = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['time']))));
	    $dis = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['dis']))));
		 $bear = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['bear']))));
		  $acc = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['acc']))));
		    $alt = mysql_real_escape_string(stripcslashes(strip_tags(htmlspecialchars($_GET['alt']))));

     if($device_id != "" && $long !="" && $lat !="" && $spd!="" && $dis!="" && $bear!="" && $acc!="" && $alt!=""){
if($time==0)
 $sql= "INSERT INTO `gps` (`DeviceId`,`Longitude`,`Latitude`,`speed`,`Time`,`Distance`,`Bearing`,`Accuracy`,`Altitude`) 
	         VALUES ('$device_id' , '$long' , '$lat','$spd',current_timestamp,'$dis','$bear','$acc','$alt')";
else
     $sql= "INSERT INTO `gps` (`DeviceId`,`Longitude`,`Latitude`,`speed`,`Time`,`Distance`,`Bearing`,`Accuracy`,`Altitude`) 
	         VALUES ('$device_id' , '$long' , '$lat','$spd','$time','$dis','$bear','$acc','$alt')";
     if (!mysql_query($sql))
       {
			echo "error";	
			die('Error: ' . mysql_error());
      }else{
		echo "success $time"; 
	  }
	  }
	  else{
	  echo "Enter All Variables";
	  }
?>
<?php
    include ("db_disconnect.php");
?>
</body>

</html>