<?php

error_reporting(E_ALL);

/**
 * The idea: use the Template Method pattern as the basis for a
 * WebUser base class. Subclasses override the parts of the
 * algorithm.
 *
 * Then, we can use the State pattern to invoke whatever method on the
 * WebUser subclass that is appropriate, perhaps.
 *
 * $Id: webuser.lib.inc,v 1.2 2007/04/16 19:49:58 swain Exp $
 */

class WebUser {

    protected $context;

    function __construct() {
    }

    public function enterAddresses() {
    }

    public function enterPaymentMethod() {
    }

    public function confirmOrder() {
    }

    public function checkoutSuccess() {
    }

    public function viewOrder() {
    }

    public function setContext(CartContext $context) {
        //print "Setting context on this WebUser...\n";
        $this->context = $context;
    }
}

class AnonymousUser extends WebUser {
    function __construct() {
        parent::__construct();
    }
    public function enterAddresses() {
        print("AnonymousUser: enter address!\n");
    }

    public function enterPaymentMethod() {
        print("AnonymousUser: enter payment method!\n");
    }

    public function confirmOrder() {
        print("AnonymousUser: confirm your order\n");
    }

    public function checkoutSuccess() {
        print("AnonymousUser: success!\n");
    }

    public function viewOrder() {
        print("AnonymousUser: You can't view an order because you have no account.\n");
    }
}


class RegisteredUser extends WebUser {
    function __construct() {
        parent::__construct();
    }
    public function enterAddresses() {
        print("RegisteredUser: Changing the state of the CartContext, because I don't need them to enter an address...\n");
        $this->context->setState($this->context->needPaymentMethodState);
    }

    public function enterPaymentMethod() {
        print("RegisteredUser: choose credit card or paypal or what...\n");
    }

    public function confirmOrder() {
        print("RegisteredUser: confirm your order, user\n");
    }

    public function checkoutSuccess() {
        print("RegisteredUser: success!\n");
    }

    public function viewOrder() {
        print("RegisteredUser: Here's the view of your order\n");
    }
}


class NewUser extends WebUser {
    function __construct() {
        parent::__construct();
    }
    public function enterAddresses() {
        print("NewUser: enter your addresses\n");
    }

    public function enterPaymentMethod() {
        print("NewUser: enter your payment method\n");
    }

    public function confirmOrder() {
        print("NewUser: confirm your order\n");
    }

    public function checkoutSuccess() {
        print("NewUser: success!\n");
    }

    public function viewOrder() {
        print("NewUser: Here's the view of your order\n");
    }
}

?>