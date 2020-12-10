<?php
include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
<head>
  </head>
  
  <h2> GM Finder </h2>
  
  <hr>
  
  
<?php
  
$adv_name = $_POST['aname'];

$adv_name = mysqli_real_escape_string($conn, $adv_name);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "SELECT gmname from campaign 
	join gamemaster on (gamemaster_idgamemaster = idgamemaster) 
	join sourcebooks on (sourcebooks_idsourcebooks = idsourcebooks)
        where title like ";

$query = $query."'".$adv_name."';"
?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p
>
The GM of the chosen Adventure is:
<br>
Result of query:
<p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {       
 	  print "$row[gmname]";
	  print "\n";
}
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
<hr>

<p>
<a href="finalhome.php" >Back to Home</a>
 
</body>
</html>
	  
