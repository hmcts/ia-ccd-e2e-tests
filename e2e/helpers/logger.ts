import moment = require('moment');

export class Logger {

    public static log(o: Object) {
        console.log(`${moment().toISOString()} -  ${o}`);
    }
}
