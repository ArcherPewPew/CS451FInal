<html>
<head>
<title> Aarcher CS451 Final </title>
<body>

<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
	        or die('Error connecting to MySQL server.');
?>


<h2> Showing Least Popular Classes </h2>
<?php
$query = "select class.cname, count(class.cname) as numplayers from class join `character` on (class_idclass = idclass) group by cname having numplayers < 2"
?>


<p>
The query:
<?php print $query;?>
</p>

<hr>
Result of query:<br>



<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

echo "<table> <thread> <tr>
	<th scope='col'>Class</th>
	<th scope='col'>Number of Players</th>
	</tr></thread><tbody>";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH)){
	echo "<tr>";
        echo "<td align='center'>".$row[cname]."</td>";
	echo "<td align='center'>".$row[numplayers]."</td>";
	echo "</tr>";
}
    echo "</tbody> </table>";

mysqli_free_result($result);

mysqli_close($conn);
?>


<a href ="finalhome.php"> Back to Home </a>
</body>
</html>
