<?php
	$host ="mysql.hostinger.ro";
	$user="u272993050_a";
	$pass="qwerty";
	$db="u272993050_a";
	
$con = mysqli_connect($host,$user,$pass,$db);

	if (mysqli_connect_errno())
	{
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

?>