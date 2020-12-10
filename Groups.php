<html>
<head>
<title> Aarcher CS451 Final </title>
<body>

<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
	        or die('Error connecting to MySQL server.');
?>


<h2> Showing Groups that need Players! </h2>
<?php
$query = "select DISTINCT title, count(character_idcharacter) as numplayers from campaign_has_character  join campaign on (campaign_idcampaign = idcampaign) join sourcebooks on (sourcebooks_idsourcebooks = idsourcebooks)
group by title
having numplayers <4"
?>


<p>
The query:
<?php print $query;?>
</p>

<hr>
<p>
Typically a group has 4 players! Here are groups that need players </p>
Result of query:<br>



<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

echo "<table> <thread> <tr>
	<th scope='col'>Adventure Title</th>
	<th scope='col'>Number of Players</th>
	</tr></thread><tbody>";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH)){
	echo "<tr>";
        echo "<td align='center'>".$row[title]."</td>";
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
