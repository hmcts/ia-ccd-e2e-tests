import { CcdFormPage } from '../../../pages/ccd-form.page';
import { startBailApplicationFlow } from '../../../flows/start-bail-application.flow';
import { Given } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();
const startBailApplicationFlow = new StartBailApplicationFlow();

Given('I complete the `Before you start` page', async function () {
    expect(await ccdFormPage.headingContains('Before you start')).to.equal(true);
    await startBailApplicationFlow.confirmStart(true);
});

Then('I am on the `{ heading }` page', async function () {
    expect(await ccdFormPage.headingContains( { heading } )).to.equal(true);
});