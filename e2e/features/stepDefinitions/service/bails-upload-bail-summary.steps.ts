import { UploadBailSummary } from '../../../flows/bails-upload-bail-summary.flow';
import { CcdFormPage } from '../../../pages/ccd-form.page';
import { Given } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();
const uploadBailSummary = new UploadBailSummary();

Given('I complete the `Upload Bail Summary` page', async function () {
  expect(await ccdFormPage.headingContains('Upload Bail Summary')).to.equal(true);
  await uploadBailSummary.uploadBailSummaryFile(false);
});

Given('I upload the bail summary', async function () {
  await uploadBailSummary.uploadBailSummary(true);
});
