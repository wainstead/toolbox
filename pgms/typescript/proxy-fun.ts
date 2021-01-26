const axios = require('axios')

axios
  .get('https://diligent.com/', {
    proxy: {
      host: process.env.DIL_PROXY_HOST,
      port: 3128
    }
  })
  .then((res) => {
    console.log(res.status)
  })
  .catch((e) => {
    console.log('Ooops!')
    console.log(e.message)
  })
