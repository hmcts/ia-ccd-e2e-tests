import { CcdFormPage } from '../../../pages/ccd-form.page';
import { StartBailApplicationFlow } from '../../../flows/start-bail-application.flow';
import { Given, Then } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();
const startBailApplicationFlow = new StartBailApplicationFlow();

Given('I complete the `Before you start` page', async function () {
    expect(await ccdFormPage.headingContains('Before you start')).to.equal(true);
    await startBailApplicationFlow.confirmStart(true);
});

Then(/^I am on the `?([^`]+)`? page$/, async function (pageName) {
    expect(await ccdFormPage.headingContains(pageName)).to.equal(true);
});
