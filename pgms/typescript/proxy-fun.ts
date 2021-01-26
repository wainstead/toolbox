import { isConstructorDeclaration } from 'typescript'

export {}
const axios = require('axios')

// console.log('Hello!')
// console.log(`Hello! ${process.env.FOO}`)

const callit = async () => {
  const res = await axios.get('https://diligent.com/', {
    proxy: {
      host: process.env.DIL_PROXY_HOST,
      port: 3128
    }
  })
  return res
}
// .then() {
//     console.log(res.data)
// }
// .catch (e) {
//     console.log(e)
// }

//console.log(res)
callit()
  .then((res) => {
    console.log(res.status)
  })
  .catch((e) => {
    console.log('Ooops!')
    console.log(e.message)
  })
