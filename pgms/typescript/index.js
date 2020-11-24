console.log('Hello, sailor!');
var x = 42;
console.log(x);
var y = { mything: 714, left: 'Hello', right: 'sailor!' };
console.log(JSON.stringify(y));
// Fails, we are trying to use a string where we specified a number
// let z: SwainType<number> = { mything: '715', left: 'need', right: 'a date?' }
var z = { mything: '715', left: 'need', right: 'a date?' };
console.log(JSON.stringify(z));
