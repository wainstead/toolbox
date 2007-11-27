#!/opt/php5/bin/php
<?php

// tutorial thingie from http://www.filipdewaard.com/php/SQLite-in-memory-databases/
// $Id: db.php,v 1.3 2007/11/01 19:04:34 swain Exp $
echo "hello, sailor!\n";

// open the database, note that ':memory:' is used as filename
$db = sqlite_open(":memory:");

//create a table and insert some data
sqlite_exec($db, "
BEGIN;
CREATE TABLE plays (id, author, title);
INSERT INTO plays (id, author, title) VALUES (1, 'Goethe', 'Faust');
INSERT INTO plays (id, author, title) VALUES (2, 'Shakespeare', 'Hamlet');
INSERT INTO plays (id, author, title) VALUES (3, 'Sophocles', 'Oedipus Rex');
COMMIT;
");

//select all records from our table
$result = sqlite_query($db, "SELECT * FROM plays");
//fetch them into an array of arrays
$data = sqlite_fetch_all($result);

//display the data
echo "<ul>";
foreach($data as $key => $row)
{
    echo "<li>".$row['title']." (by ".$row['author'].")</li>";
}
echo "</ul>";


sqlite_close($db);

/* once closed, the db is gone forever, which is what we'd expect...

$db = sqlite_open(":memory:");
//select all records from our table
$result = sqlite_query($db, "SELECT * FROM plays");
//fetch them into an array of arrays
$data = sqlite_fetch_all($result);

//display the data
echo "<ul>";
foreach($data as $key => $row)
{
    echo "<li>".$row['title']." (by ".$row['author'].")</li>";
}
echo "</ul>";
*/
?>