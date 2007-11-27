#!/opt/php5/bin/php
<?php

error_reporting(E_ALL);

require( dirname(__FILE__) . '/statelib.inc'  );
require( dirname(__FILE__) . '/webuser.lib.inc'  );

// If $_SESSION['cart_context'] is empty:
$user         = new RegisteredUser();
$cart_context = new CartContext($user);

$cart_context->cartNoLongerEmpty();

$cart_context->getState();
$cart_context->needAddresses();
//$cart_context->needAddresses();
$cart_context->getState();
$cart_context->needPaymentMethod();
$cart_context->getState();
$cart_context->confirmOrder();
$cart_context->checkoutSuccess();
$cart_context->viewOrder();
$cart_context->confirmOrder();
$cart_context->confirmOrder();


?>