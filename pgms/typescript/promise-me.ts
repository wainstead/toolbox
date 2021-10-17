/** make a promise */

// const wrapper = (flag: string): Promise<string> => {
//   console.log(`passed: ${flag}`)
//   return new Promise((resolve, reject) => {
//     if (flag != '0') {
//       resolve('Hello sailor!')
//     } else {
//       reject(new Error('Run home to momma little boy!'))
//     }
//   })
// }
// //console.log(process.argv)
// wrapper(process.argv[2])
//   .then((res) => {
//     console.log(res) // I get called: true
//   })
//   .catch((err) => {
//     console.log(`oops I caught an error: ${err}`)
//   })

//playing with the dotenv package
//require('dotenv').config()
//console.log(process.env.ENV_LOADED)

const simple = async (wait_interval: number) => {
  console.log(`starting loop. wait_interval is ${wait_interval}`)
  //for (let x = 0; x < 10; x++) {
  while (true) {
    await new Promise((resolve) => setTimeout(resolve, wait_interval))
    console.log('OK computer!')
  }
  console.log('done.')
}
console.log("Calling 'simple'...")
simple(3000)
console.log("'simple' called!")
// for (let x = 0; x < 10; x++) {
//   simple()
// }

// const timer = (interval: number): Promise<number> => {
//   console.log(`passed interval: ${interval}`)

// }
// Promise.resolve(123)
//   .then((res) => {
//     console.log(res) // 123
//     return 456
//   })
//   .then((res) => {
//     console.log(res) // 456
//     return Promise.resolve(123) // Notice that we are returning a Promise
//   })
//   .then((res) => {
//     console.log(res) // 123 : Notice that this `then` is called with the resolved value
//     return 123
//   })

// // Create a rejected promise
// Promise.reject(new Error('something bad happened'))
//   .then((res) => {
//     console.log(res) // not called
//     return 456
//   })
//   .then((res) => {
//     console.log(res) // not called
//     return 123
//   })
//   .then((res) => {
//     console.log(res) // not called
//     return 123
//   })
//   .catch((err) => {
//     console.log(err.message) // something bad happened
//   })
