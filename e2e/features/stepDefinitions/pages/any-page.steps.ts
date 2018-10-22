import {AnyCcdPage} from '../../../pages/any-ccd.page';
import {Then} from 'cucumber';
import {expect} from 'chai';

const anyCcdPage = new AnyCcdPage();

Then(/^I should see the (.+) page/, async function (headingText) {
    await anyCcdPage.waitUntilLoaded();
    expect(await anyCcdPage.pageHeadingContains(headingText)).to.be.true;
});
