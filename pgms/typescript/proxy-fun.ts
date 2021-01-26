const axios = require('axios')

const payload = JSON.parse(`{
	"gauge": [
		{
			"metric": "environment.live",
			"dimensions": { "sre_part-of": "messenger", "sre_environment": "prod","sre_group": "prod01", "sre_tier": "prod", "sre_appteam": "messenger", "sre_site": "tor12p1", "state": "live" },
			"value": 1
		},
		{
			"metric": "environment.live",
			"dimensions": { "sre_part-of": "boards", "sre_environment": "prod","sre_group": "prod01", "sre_tier": "prod", "sre_appteam": "boards", "sre_site": "tor12p1", "state": "live" },
			"value": 1
		},
		{
			"metric": "environment.live",
			"dimensions": { "sre_part-of": "boardeffect", "sre_environment": "prod","sre_group": "prod01", "sre_tier": "prod", "sre_appteam": "boardeffect", "sre_site": "tor12p1", "state": "live" },
			"value": 0
		}
	]
}
`)

const options = {
  headers: {
    'Content-Type': 'application/json',
    'X-SF-TOKEN': process.env.SIGNALFX_TOKEN
  },
  proxy: {
    host: process.env.DIL_PROXY_HOST,
    port: 3128
  }
}

axios
  .post('https://ingest.us1.signalfx.com/v2/datapoint', payload, options)
  .then((res) => {
    console.log(res.status)
    console.log(res)
  })
  .catch((e) => {
    console.log('Ooops!')
    console.log(e.message)
  })
