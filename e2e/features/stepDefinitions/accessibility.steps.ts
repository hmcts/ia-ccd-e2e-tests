import { CcdPage } from '../../pages/ccd.page';
import { Then } from 'cucumber';

const ccdPage = new CcdPage();

Then(/^the page is accessible$/, async function () {
    expect(await ccdPage.runAccessbility());
});
