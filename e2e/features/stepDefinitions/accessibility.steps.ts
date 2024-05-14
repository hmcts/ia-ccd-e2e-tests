import { CcdPage } from '../../pages/ccd.page';
import { Then } from '@cucumber/cucumber';

const iaConfig = require('../../ia.conf');
const ccdPage = new CcdPage();

Then(/^The page is accessible$/, async function () {
    console.log('outside if');
    if (iaConfig.TestForAccessibility) {
        console.log('inside if');
        await ccdPage.runAccessbility();
    }
});
