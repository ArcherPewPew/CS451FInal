<html>
<head>
<title> Aarcher CS451 Final </title>
<body>

<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
	        or die('Error connecting to MySQL server.');
?>


<h2> The roster of player characters by power level </h2>
<?php
$query = "select pname, `character`.cname as CharName, class.cname as `Class Name`, `power value` from player join `character` on (player_idplayer = idplayer) join class on (class_idclass = idclass)
	Order by `power value`
DESC
";

?>


<p>
The query:
<?php print $query;?>
</p>

<hr>
<p>
Result of query:<br>
</p>


<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

echo "<table> <thread> <tr>
	<th scope='col'>Player</th>
	<th scope='col'>Character</th>
	<th scope='col'>Class</th>
	<th scope='col'>Power Value</th>
	</tr></thread><tbody>";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH)){
	echo "<tr>";
        echo "<td align='center'>".$row[pname]."</td>";
        echo "<td align='center'>".$row[CharName]."</td>";
        echo "<td align='center'>".$row["Class Name"]."</td>";
	echo "<td align='center'>".$row["power value"]."</td>";
	echo "</tr>";
}
    echo "</tbody> </table>";

mysqli_free_result($result);

mysqli_close($conn);
?>


<a href ="finalhome.php"> Back to Home </a>
</body>
</html>
