/** Trying out the 'type' keyword. It is like 'interface' but it cannot be extended, in the OO sense.
 * But you can "extend" a type by using the intersection operator, see the manual.
 * https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases
 *
 *
 * Run this script from the terminal window:
 * tsc index.ts && node index.js
 */
console.log('Hello, sailor!')
type CountingThing = number
type SpecificNumber = 42 | 714 | 666 | 69 | 31337
let x: CountingThing = 42
// The following is illegal:
// let a: CountingThing = 'ha ha only serious'
// Gives you:
// index.ts:12:5 - error TS2322: Type '"ha ha only serious"' is not assignable to type 'number'.
console.log(x)
let s: SpecificNumber = 31337
console.log(s)

type ItsATree = ({ closeReason }: { closeReason: CountingThing }) => void
// Understanding functions in type declarations
type FunkyPoodle = {
  onClosePopover: ItsATree
  onStatusChange: (status: CountingThing) => void
  onRequestCloseExportPopover: () => void
  isOpen: boolean
  anchorElement: any
  closeReason?: string
}

const f: FunkyPoodle = {
  onClosePopover: (closeReason) => void,
  onStatusChange: (status: CountingThing) => void,
  onRequestCloseExportPopover: () => void,
  isOpen: true,
  anchorElement: "ha",
  closeReason: "foo"
}

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
