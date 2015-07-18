<?php

$my_file = 'mails.txt';
$handle = fopen($my_file, 'a');
if(isset($_POST["uname"])){$uname = $_POST["uname"];echo $uname;}
if(isset($_POST["ucity"])){$ucity = $_POST["ucity"];echo $ucity;}
if(isset($_POST["uemail"])){$uemail = $_POST["uemail"];echo $uemail;}
if(isset($_POST["utext"])){$utext= $_POST["utext"];echo $utext;}
/*$ucity = $_POST['ucity'];
$uemail = $_POST['uemail'];
$utext = $_POST['utext'];*/
if(isset($_POST['utext']))
$data = " name: $uname  city: $ucity email: $uemail text: $utext ;\n";
else 
$data="";
fwrite($handle, $data);

echo "Thankyou for contacting us";
fclose($handle);
//echo 'here';
header("Location: http://edgnome.com/Contacts%20-%20Copy.html#");
?>

