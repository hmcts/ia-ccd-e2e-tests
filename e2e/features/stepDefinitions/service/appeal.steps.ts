import { CcdPage } from '../../../pages/ccd.page';
import { Then } from 'cucumber';
import { Wait } from '../../../enums/wait';
import { expect } from 'chai';

const ccdPage = new CcdPage();

Then(/^I should (see|not see) the appeal details$/, async function (seeOrNotSee) {
  const isDisplayed = seeOrNotSee === 'see';

  expect(await ccdPage.headingContains('Appeal details', !isDisplayed)).to.equal(isDisplayed);

  if (isDisplayed) {
    const referenceNumberIsDraft = await ccdPage.isFieldValueDisplayed('Appeal reference', 'DRAFT');
    const referenceNumberIsCorrectLength = await ccdPage.isFieldValueCorrectLength('Appeal reference', 13);

    expect(referenceNumberIsDraft || referenceNumberIsCorrectLength).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Appellant name', 'José González')).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Type of appeal', 'Refusal of protection claim')).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Grounds of appeal', "Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention")).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Explain these new matters and their relevance to the appeal', 'Birth of a child')).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Previous appeals', 'No')).to.equal(true);
  } else {
    expect(await ccdPage.contentContains('Appeal reference', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Appellant name', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Type of appeal', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Grounds of appeal', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Explain these new matters and their relevance to the appeal', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Previous appeals', Wait.instant)).to.equal(false);
  }
});

Then(/^I should (see|not see) the submission details$/, async function (seeOrNotSee) {
  const isDisplayed = seeOrNotSee === 'see';

  expect(await ccdPage.headingContains('Submission details', !isDisplayed)).to.equal(isDisplayed);

  if (isDisplayed) {
    // expect(await ccdPage.isFieldValueDisplayed('Home Office decision letter sent', '{$TODAY|D MMM YYYY}')).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Appeal submitted', '{$TODAY|D MMM YYYY}')).to.equal(true);
    expect(await ccdPage.isFieldValueDisplayed('Was the appeal submission late?', 'No')).to.equal(true);
  } else {
    expect(await ccdPage.contentContains('Home Office decision letter sent', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Appeal submitted', Wait.instant)).to.equal(false);
    expect(await ccdPage.contentContains('Was the appeal submission late?', Wait.instant)).to.equal(false);
  }
});
