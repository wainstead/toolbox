/** Trying out the 'type' keyword. It is like 'interface' but it cannot be extended, in the OO sense.
 * But you can "extend" a type by using the intersection operator, see the manual.
 * https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases
 */
console.log('Hello, sailor!')
type CountingThing = number
let x: CountingThing = 42
console.log(x)

type SwainType<S> = {
  mything: S
  left: string
  right: string
}

let y: SwainType<number> = { mything: 714, left: 'Hello', right: 'sailor!' }
console.log(JSON.stringify(y))
// Fails, we are trying to use a string where we specified a number
// let z: SwainType<number> = { mything: '715', left: 'need', right: 'a date?' }
let z: SwainType<string> = { mything: '715', left: 'need', right: 'a date?' }
console.log(JSON.stringify(z))
