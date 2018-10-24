import { AnyCcdPage } from '../../../pages/any-ccd.page';
import { When } from 'cucumber';

const anyCcdPage = new AnyCcdPage();

When('I go to the Case List', {timeout: 30 * 1000}, async function () {
    await anyCcdPage.getWithoutWaitingForAngular('/list/case');
});
