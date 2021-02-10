import { CcdPage } from '../../pages/ccd.page';
import { Then } from 'cucumber';

const ccdPage = new CcdPage();

Then(/^The page is accessible$/, async function () {
    await ccdPage.runAccessbility();
});
