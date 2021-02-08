import { collapseTextChangeRangesAcrossMultipleVersions } from "typescript";

/** playground for hot-shots and statsd stuff */
console.log("Hello, I'm going to try to talk to the TIG stack.")
//console.log(process.env.NODE_ENV)
const StatsD = require('hot-shots'),
    client = new StatsD({
        host: 'localhost',
        port: 8125,
        telegraf: true, // use the Telegraf "line protocol," else it defaults to DataDog's and you get parsing errors in the influxdb console output.
        // tagPrefix: '',
        // globalTags: { env: process.env.NODE_ENV },
        globalTags: { env: 'notification_services' }
        // errorHandler: errorHandler, // default is 'none' and errors are sent to console
    });

for (let x = 0; x < 100; x++) {
    client.increment('diligent_hs_counter');
}

client.gauge('my_gauge', 123.45)

console.log("End of line.")