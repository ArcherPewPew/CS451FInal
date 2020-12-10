<?php
include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
<head>
  <title>Aarcher Final Demo</title>
  </head>

  <body bgcolor="white">
  <h2> F20 CS451 </h2>

  <hr>


<?php

$ele_name = $_POST['elename'];

$ele_name = mysqli_real_escape_string($conn, $ele_name);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "select cname, count(spname) as `numspells` from class_has_spell 
          join spell on (spell_idspell = idspell)
          join class on (class_idclass = idclass)
          where element like
          ";
$query = $query."'".$ele_name."' group by cname;"; 

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

echo "<table>
	 <thread>
	 <tr>
         <th scope='col'>Class</th>
	 <th scope='col'># $ele_name Spells</th>
         </tr>
         </thread>
         <tbody>";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
  echo "<tr>";
  echo "<td align='center'>" . $row[cname] . "</td>";
  echo "<td align='center'>" . $row[numspells] . "</td>";
  echo "</tr>";
   }
  echo "</tbody>
  </table>";


mysqli_free_result($result);

mysqli_close($conn);

?>
<a href ="findEleSpells.php?elename=<?php echo $ele_name?>">
<p>Perhaps you'd like to see a list of the spells?
</a>

<hr>

<p>
<a href="findCustManu.txt" >Contents</a>
of the PHP program that created this page.

</body>
</html>
