
dooldthing = function() {
    console.log("Old anon function syntax");
}

dooldthing();

dooldthing2 = function foo() {
    console.log("Old named function syntax");
}

dooldthing2();

function dootheroldthing() {
    console.log("Other old thing");
}

dootheroldthing();

// "immediately invoked function expression" (IIFE)
(function hahaonlyserious(msg) {
    console.log("IIFE: " + msg);
})("in the IIFE declaration");

// won't work; function is out of scope
// hahaonlyserious("afer the IIFE declaration");

/* Because an IIFE is just a function, and functions create
   variable scope, using an IIFE in this fashion is often used to
   declare variables that won't affect the surrounding code outside
   the IIFE. */

const dosomething = () => {
    console.log("Hello sailor! ES6 syntax");
}

dosomething();

