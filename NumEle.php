
<html>
<head>
       <title> Final Demo</title>
</head>

<body>

<h2>CS451 20F </h2>
<h3>Connecting to dnd using MySQL/PHP</h3>


<hr>


<?php include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port) or die("Immediate error connecting to MySQL server.");
?>


<form action="findNumEle.php" method="POST">
<select name='elename'>
<option selected disabled>"Select an element"</option>
<?php
$query = "SELECT DISTINCT element FROM spell;";
$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
print "<option value='$row[element]'>$row[element]</option>";
}
?>
</select>

<input type="submit" value="submit">
<input type="reset" value="erase">
</form>

<hr>





</body>
</html>
~                                                                                                                                          ~                                                                                                                                          ~                                                                                                                                          ~                                                                                                                                          ~                                      
