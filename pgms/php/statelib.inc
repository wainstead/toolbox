<?php

error_reporting(E_ALL);

/**
 * Page flow for the shopping cart is implemented via the State pattern.
 *
 * $Id: statelib.inc,v 1.2 2007/04/16 19:48:56 swain Exp $
 */


interface State {
    public function needAddresses();
    public function needPaymentMethod();
    public function confirmOrder();
    public function checkoutSuccess();
    public function viewOrder();
}


class CartContext {

    // Our primary objects are the $state and the $webuesr
    var $state;
    var $webuser;

    // All the classes that implement the State interface
    var $emptyCartState;
    var $needAddressesState;
    var $needPaymentMethodState;
    var $confirmOrderState;
    var $checkoutSuccessState;
    var $viewOrderState;

    // flag variable
    private $cart_is_empty;

    function __construct(WebUser $webuser) {

        $this->emptyCartState         = new EmptyCartState(         $this, $webuser);
        $this->needAddressesState     = new NeedAddressesState(     $this, $webuser);
        $this->needPaymentMethodState = new NeedPaymentMethodState( $this, $webuser);
        $this->confirmOrderState      = new ConfirmOrderState(      $this, $webuser);
        $this->checkoutSuccessState   = new CheckoutSuccessState(   $this, $webuser);
        $this->viewOrderState         = new ViewOrderState(         $this, $webuser);

        $this->webuser = $webuser;
        $this->webuser->setContext($this); // WebUser subclasses
                                           // occassionally need to
                                           // override the sequence of
                                           // states

        // for our initial context we assume the cart is empty
        $this->cart_is_empty = true;
        $this->state = $this->emptyCartState;
    }

    function getState() { return $this->state->getState(); }

    function setState(State $state) {
        $this->state = $state;
        printf("State is now: '%s'\n", $this->state->getState());
    }

    public function cartNoLongerEmpty() {
        if ($this->cart_is_empty == true) {
            $this->cart_is_empty = false;
            $this->state = $this->needAddressesState;
        }
    }

    // The crux of the State pattern: invoke the next action. We don't
    // care which subclass it is since they all have the same
    // interface.

    public function needAddresses() {
        $this->state->needAddresses();
    }
    public function needPaymentMethod() {
        $this->state->needPaymentMethod();
    }
    public function confirmOrder() {
        $this->state->confirmOrder();
    }
    public function checkoutSuccess() {
        $this->state->checkoutSuccess();
    }
    public function viewOrder() {
        $this->state->viewOrder();
    }


}

class BaseState implements State {
    public function needAddresses()     { $this->badStateCall(__CLASS__, __METHOD__); }
    public function needPaymentMethod() { $this->badStateCall(__CLASS__, __METHOD__); }
    public function confirmOrder()      { $this->badStateCall(__CLASS__, __METHOD__); }
    public function checkoutSuccess()   { $this->badStateCall(__CLASS__, __METHOD__); }
    public function viewOrder()         { $this->badStateCall(__CLASS__, __METHOD__); }

    protected function badStateCall($class, $method) {
        die("Fatal error: called $class -> $method during state " . $this->cartcontext->getState() . "\n" );
    }
}

class EmptyCartState extends BaseState {
    var $cartcontext;
    var $webuser;
    function __construct(CartContext $cartcontext, WebUser $webuser) {
        $this->cartcontext = $cartcontext;
        $this->webuser     = $webuser;
    }
    public function needAddresses()     { $this->redirect(); }
    public function needPaymentMethod() { $this->redirect(); }
    public function confirmOrder()      { $this->redirect(); }
    public function checkoutSuccess()   { $this->redirect(); }
    public function viewOrder()         { $this->redirect(); }
    public function getState()          { return "EmtpyCartState"; }
    private function redirect()         { print "Go fill your cart!\n"; }
}


class NeedAddressesState extends BaseState {
    var $cartcontext;
    var $webuser;
    function __construct(CartContext $cartcontext, WebUser $webuser) {
        $this->cartcontext = $cartcontext;
        $this->webuser     = $webuser;
    }
    public function needAddresses()     {
        //print "Location: getAddressFromUser.php\n"; // replace this with an invocation on WebUser subclass
        $this->webuser->enterAddresses();
        $this->cartcontext->setState($this->cartcontext->needPaymentMethodState);
    }
    public function needPaymentMethod() { $this->badStateCall(__CLASS__, __METHOD__); }
    public function confirmOrder()      { $this->badStateCall(__CLASS__, __METHOD__); }
    public function checkoutSuccess()   { $this->badStateCall(__CLASS__, __METHOD__); }
    public function viewOrder()         { $this->badStateCall(__CLASS__, __METHOD__); }
    public function getState()          { return "NeedAddressesState"; }
}

class NeedPaymentMethodState extends BaseState {
    var $cartcontext;
    var $webuser;
    function __construct(CartContext $cartcontext, WebUser $webuser) {
        $this->cartcontext = $cartcontext;
        $this->webuser     = $webuser;
    }
    public function needAddresses()     { $this->badStateCall(__CLASS__, __METHOD__); }
    public function needPaymentMethod() { 
        //print "Location: getPaymentMethod.php\n";
        $this->webuser->enterPaymentMethod();
        $this->cartcontext->setState($this->cartcontext->confirmOrderState);
    }
    public function confirmOrder()      { $this->badStateCall(__CLASS__, __METHOD__); }
    public function checkoutSuccess()   { $this->badStateCall(__CLASS__, __METHOD__); }
    public function viewOrder()         { $this->badStateCall(__CLASS__, __METHOD__); }
    public function getState()          { return "NeedPaymentMethodState"; }
}

class ConfirmOrderState extends BaseState {
    var $cartcontext;
    var $webuser;
    function __construct(CartContext $cartcontext, WebUser $webuser) {
        $this->cartcontext = $cartcontext;
        $this->webuser     = $webuser;
    }
    public function needAddresses()     { $this->badStateCall(__CLASS__, __METHOD__); }
    public function needPaymentMethod() { $this->badStateCall(__CLASS__, __METHOD__); }
    public function confirmOrder()      {
        //print "Location: confirmOrder.php\n";
        $this->webuser->confirmOrder();
        $this->cartcontext->setState($this->cartcontext->checkoutSuccessState);
    }
    public function checkoutSuccess()   { $this->badStateCall(__CLASS__, __METHOD__); }
    public function viewOrder()         { $this->badStateCall(__CLASS__, __METHOD__); }
    public function getState()          { return "ConfirmOrderState"; }
}

class CheckoutSuccessState extends BaseState {
    var $cartcontext;
    var $webuser;
    function __construct(CartContext $cartcontext, WebUser $webuser) {
        $this->cartcontext = $cartcontext;
        $this->webuser     = $webuser;
    }
    public function needAddresses()     { $this->badStateCall(__CLASS__, __METHOD__); }
    public function needPaymentMethod() { $this->badStateCall(__CLASS__, __METHOD__); }
    public function confirmOrder()      { $this->badStateCall(__CLASS__, __METHOD__); }
    public function checkoutSuccess()   {
        //print "Location: checkoutSuccess.php\n";
        $this->webuser->checkoutSuccess();
        $this->cartcontext->setState($this->cartcontext->viewOrderState);
    }
    public function viewOrder()         { $this->badStateCall(__CLASS__, __METHOD__); }
    public function getState()          { return "CheckoutSuccessState"; }
}

class ViewOrderState extends BaseState {
    var $cartcontext;
    var $webuser;
    function __construct(CartContext $cartcontext, WebUser $webuser) {
        $this->cartcontext = $cartcontext;
        $this->webuser     = $webuser;
    }
    public function needAddresses()     { $this->badStateCall(__CLASS__, __METHOD__); }
    public function needPaymentMethod() { $this->badStateCall(__CLASS__, __METHOD__); }
    public function confirmOrder()      { $this->badStateCall(__CLASS__, __METHOD__); }
    public function checkoutSuccess()   { $this->badStateCall(__CLASS__, __METHOD__); }
    public function viewOrder()         {
        //print "Location: viewOrder.php\n";
        $this->webuser->viewOrder();
        $this->cartcontext->setState($this->cartcontext->emptyCartState);
    }
    public function getState()          { return "ViewOrderState"; }
}

?>