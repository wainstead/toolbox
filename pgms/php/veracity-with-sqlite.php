#!/opt/php5/bin/php
<?php


$columns = array(
                 'gthumb' => 'int',
                 'ghigh'  => 'int',
                 'gsized' => 'int',
                 'gfull'  => 'int',
                 'fthumb' => 'int',
                 'fhigh'  => 'int',
                 'fsized' => 'int',
                 'ffull'  => 'int',
 //                 'dthumb' => 'int',
//                  'dhigh'  => 'int',
//                  'dsized' => 'int',
//                  'dfull'  => 'int'
                 );


$inmemdb = create_inmemory_database();

$insert = "INSERT INTO snapshot VALUES('G', 'album01', 'P110023', 'jpg', 100, 200, 300, 100000000, 100, 200, 300, 100000000)";
if (sqlite_query($inmemdb, $insert) == false) {
    print "Oh hamburgers! The query failed.\n";
} else {
    print "Huzzah! Inserted!\n";
}


sqlite_query($inmemdb, "INSERT INTO snapshot VALUES('G', 'album01', 'P110024', 'jpg', 100, 200, 0, 100000000, 100, 200, 300, 0)");
sqlite_query($inmemdb, "INSERT INTO snapshot VALUES('G', 'album01', 'P110025', 'jpg', 100, 200, NULL, 100000000, 100, 200, 300, NULL)");
sqlite_query($inmemdb, "INSERT INTO snapshot VALUES('G', 'album01', 'P110026', 'jpg', 100, 200, NULL, 100000000, 100, 200, 300, NULL)");
sqlite_query($inmemdb, "INSERT INTO snapshot VALUES('G', 'album01', 'P110027', 'jpg', 100, 200, NULL, 100000000, 100, 200, 300, NULL)");


// select all records from our table
//$result = sqlite_query($inmemdb, "SELECT * FROM snapshot");

// fetch them into an array of arrays
//$data = sqlite_fetch_all($result);
//print_r($data);

// display the data
// foreach($data as $key => $row)
// {
//     echo "<li>".$row['title']." (by ".$row['author'].")</li>";
// }

print "\n";

// how we will test the veracity of a site:
foreach ($columns as $column => $type) {
    $query = "SELECT store, album, id, ext FROM snapshot WHERE $column IS NULL";
    test_veracity($inmemdb, $query);
    $query = "SELECT store, album, id, ext FROM snapshot WHERE $column = 0";
    test_veracity($inmemdb, $query);

}

sqlite_close($inmemdb);


function test_veracity($inmemdb, $query) {
    print "$query\n";
    $res = sqlite_query($inmemdb, $query);
    print "result: $res\n";

    if (sqlite_num_rows($res) == 0) {
        print "No matches.\n";
    } else {
        while ($arr = sqlite_fetch_array($res, SQLITE_ASSOC)) {
            print_r($arr);
        }
    }
}


function create_inmemory_database() {

    global $columns;


    // open the database, note that ':memory:' is used as filename
    $inmemdb = sqlite_open(":memory:");
    
    $create_table = "
CREATE TABLE snapshot (
store char(1) not null,
album varchar(32),
id varchar(32),
ext varchar(4),                            
";

    $needcomma = false;

    foreach ($columns AS $col => $type) {
        if ($needcomma) {
            $create_table .= ",\n";
        } else {
            $needcomma = true;
        }
        $create_table .= "$col $type(7)";
    }
    
    // close the table
    $create_table .= "\n);";

    print "\n$create_table\n";

    sqlite_exec($inmemdb, $create_table);
    return $inmemdb;
    
}


?>