import { CcdFormPage } from '../../../pages/ccd-form.page';
import { Then } from 'cucumber';
import { expect } from 'chai';

const ccdFormPage = new CcdFormPage();

Then('I wait for Share case page to load', async function () {
  expect(await ccdFormPage.headingContains('Share case with colleague')).to.equal(true);
  expect(await ccdFormPage.contentContains('Choose colleague from below list to share the case')).to.equal(true);
  const colleagues = await ccdFormPage.getFieldOptions('Colleague');
  expect(colleagues.includes('ia.legalrep.orgcreator@fake.hmcts.net')).to.equal(true);
  expect(colleagues.includes('ia.legalrep.a.xui@fake.hmcts.net')).to.equal(true);
  expect(colleagues.includes('ia.legalrep.bb.xui@fake.hmcts.net')).to.equal(true);
  expect(await ccdFormPage.isButtonEnabled('Continue')).to.equal(true);
});

Then(/^I choose `?(?:|Legal Org User Rep)(?:| A| B)`?$/, async function () {
  await ccdFormPage.setFieldValue('Colleague', 'ia.legalrep.bb.xui@fake.hmcts.net');
  await ccdFormPage.click('Continue');
});

Then('I complete the `Share a case check your answers` page', async function () {
  expect(await ccdFormPage.headingContains('Check your answers')).to.equal(true);
  expect(await ccdFormPage.contentContains('Check the information below carefully.')).to.equal(true);
  expect(await ccdFormPage.isButtonEnabled('Previous')).to.equal(true);
  expect(await ccdFormPage.isButtonEnabled('Share case')).to.equal(true);
  await ccdFormPage.click('Share case');
});
