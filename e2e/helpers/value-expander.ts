import moment = require('moment');
import * as path from 'path';

export class ValueExpander {

    private static FILE_PATTERN = /{@([^\\/}]+)}/gi;
    private static TODAY_PATTERN = /{\$TODAY([+-]?\d*?)\|?([^0-9]*?)}/gi;

    public async expand(value: string) {

        value = this.expandFiles(value);
        value = this.expandToday(value);

        return value;
    }

    private expandFiles(value: string) {

        const fileRegExp = new RegExp(ValueExpander.FILE_PATTERN);

        let match = fileRegExp.exec(value);

        while (match != null) {

            const absoluteFilename = path.resolve('./documents/' + match[1]);

            value = value.replace(match[0], absoluteFilename);

            match = fileRegExp.exec(value);
        }

        return value;
    }

    private expandToday(value: string) {

        const todayRegExp = new RegExp(ValueExpander.TODAY_PATTERN);

        let match = todayRegExp.exec(value);

        while (match != null) {

            let plusOrMinus = '+';
            let dayAdjustment = 0;

            if (!!match[1]) {

                plusOrMinus = match[1].charAt(0);
                dayAdjustment = +match[1].substring(1);
            }

            let date = moment();

            if (plusOrMinus === '+') {
                date = date.add(dayAdjustment, 'days');
            } else {
                date = date.subtract(dayAdjustment, 'days');
            }

            let dateFormat = 'DD-MM-YYYY';
            if (!!match[2]) {
                dateFormat = match[2];
            }

            value = value.replace(match[0], date.format(dateFormat))

            match = todayRegExp.exec(value);
        }

        return value;
    }
}
