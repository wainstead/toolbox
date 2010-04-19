#!/opt/php5/bin/php
<?php

define('SERVICE_ID', 'myphotodevel.com');

function stderr($message) {
    $stderr = fopen('php://stderr', 'w');
    fwrite($stderr, "$message\n");
    fclose($stderr);
}

$_SERVER['REMOTE_ADDR'] = '65.55.109.213';
echo (strpos($_SERVER['REMOTE_ADDR']     , '65.55.')     !== false), "\n";

$_SERVER['HTTP_USER_AGENT'] = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)";
echo strpos($_SERVER['HTTP_USER_AGENT'] , 'Googlebot'), "\n";

  // fuck bing and their raping of our sites
if (SERVICE_NAME == 'myphotodevel.com') {
    if (strpos($_SERVER['REMOTE_ADDR']     , '65.55.')     !== false ) stderr("fuck bing!");        exit;
    if (strpos($_SERVER['REMOTE_ADDR']     , '65.55.')     !== false ) stderr("fuck bing!");        exit;
    if (strpos($_SERVER['REMOTE_ADDR']     , '65.55.')     !== false ) stderr("fuck bing!");        exit;
    if (strpos($_SERVER['HTTP_USER_AGENT'] , 'Googlebot')) stderr("Sorry, GoogleBot!"); exit;
}
