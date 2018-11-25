// This tells us if we used undeclared variables
"use strict";
let fruits = ['apple', 'banana', 'pear', 'cherry', 'kiwi', 'pepper'];
fruits.name = 'fruitarray';

// looping
fruits.forEach(function(item, index, array) {
    console.log(item, index, array.name);
});

// looping part 2
fruits.forEach(function(item) {
    console.log(item);
});

// using the map method
let funnyfruits = fruits.map(x => 'funny ' + x);
funnyfruits.forEach(function(item) {
    console.log("funny fruit: " + item);
});

// using 'filter' method with regexp. Note 'find' only returns
// the first instance
let re = /a[pnr]/;
let found = fruits.filter(word => word.match(re));
found.forEach(function(item) {
    console.log('filtered out: ' + item);
});

console.log(fruits.concat(funnyfruits));
