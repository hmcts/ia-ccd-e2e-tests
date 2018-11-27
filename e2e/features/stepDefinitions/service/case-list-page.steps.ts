import { CcdPage } from '../../../pages/ccd.page';
import { When } from 'cucumber';

const ccdPage = new CcdPage();

When('I go to the `Case List`', async function () {
    await ccdPage.get('/list/case');
});

When('I attempt to go to the `Case List`', async function () {
    await ccdPage.getWithoutWaitingForAngular('/list/case');
});

When('I open 1543316153347598', async function () {
    await ccdPage.get('/case/IA/Asylum/1543316153347598');
});
