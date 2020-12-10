<html>
<head>
<title> Aarcher CS451 Final </title>
<body>



<?php
$ele_name = $_GET['elename'];
include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
	or die('Error connecting to MySQL server.');

?>
	<h2> Showing <?php echo $ele_name ?> Spell Names</h2>
<?php
$query = "select cname, spname from spell
join class_has_spell on (spell_idspell = idspell)
join class on (class_idclass = idclass)
where element like";
$query = $query."'".$ele_name."'order by cname;"; 
?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p>
Result of query:
<p>
<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

echo "<table> <thread><tr> 
	<th scope='col'>Class</th>
        <th scope='col'>$ele_name Spells</th>
        </tr>
        </thread>
        <tbody>";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
	  echo "<tr>";
	    echo "<td align='center'>" . $row[cname] . "</td>";
	    echo "<td align='center'>" . $row[spname] . "</td>";
	      echo "</tr>";
	       }
  echo "</tbody>
	    </table>";


mysqli_free_result($result);

mysqli_close($conn);

?>
	
<a href ="finalhome.php"> Back to Home </a>
</body>
</html>



