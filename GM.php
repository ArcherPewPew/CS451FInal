
<html>
<body>

<h2> HW4 CS451 20F Aarcher</h2>
<h3>Connecting to dnd using MySQL/PHP</h3>


<hr>

<p>
Please select an adventure name from the drop down to see the gamemaster for that game.
</p>



<?php include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port) or die("Immediate error connecting to MySQL server.");
?>




<form action="findGM.php" method="POST">
<select name='aname'>
<option selected disabled>"Select an Adventure"</option>
<?php 
$query = "SELECT DISTINCT title FROM sourcebooks;";
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
print "<option value='$row[title]'>$row[title]</option>";
}
?>
</select>

<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


</body>
</html>
