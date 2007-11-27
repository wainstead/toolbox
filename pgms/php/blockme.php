<html>
<head>
<title>Hello, sailor!</title>
</head>

<body>

<?
/* testbed to explore blocking by referer */

echo "need a date?<p>";

$allowed_urls = array();
$allowed_urls['http://pork/'] = 1;
$allowed_urls['http://devil/'] = 1;
$allowed_urls['https://secure.fortunecitygold.com/'] = 1;
$allowed_urls['devil'] = 1;

reset($allowed_urls); // move pointer to beginning if not there
foreach ($allowed_urls as $key => $value) {
    echo "testing: '$key' against '$_SERVER[HTTP_REFERER]'<p>\n";
    $key = preg_quote($key, "/");
    if ( ($result = preg_match( "/$key/i", $_SERVER['HTTP_REFERER'] )) == 0 ) {

        echo "<h4>$key <font color=red>doesn't match</font> $_SERVER[HTTP_REFERER] (result: $result)</h4>\n";

    } else {

        echo "<h4>You're a good guy: $key matches $_SERVER[HTTP_REFERER]</h4>\n";
        break;

    }
}


if (!isset($_SERVER['HTTP_REFERER'])) {
    echo "You cannot access this page directly.";
    //exit;
} elseif ( ! array_key_exists($_SERVER['HTTP_REFERER'], $allowed_urls) ) {
    echo "You must login to evw first.<p>";
    echo "Not allowed: $_SERVER[HTTP_REFERER]";
    //exit;
}


echo "<h3>you're in: $_SERVER[HTTP_REFERER]</h3>";
?>