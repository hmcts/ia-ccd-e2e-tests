import { CaseDetailsPage } from '../../../pages/case-details.page';
import { Then } from 'cucumber';
import { expect } from 'chai';

const caseDetailsPage = new CaseDetailsPage();

Then('I should see an alert confirming the case has been created', async function () {
    expect(await caseDetailsPage.alertContains('has been created')).to.equal(true);
});

Then(/^I select the (.+) Next step$/, async function (nextStep) {
    await caseDetailsPage.selectNextStep(nextStep)
    await caseDetailsPage.click('Go')
});

Then(/^Within the (.+) collection, I should see (.+) for the ([^\s]+) (.+) field$/,
    async function (
        collectionLabel,
        fieldValue,
        collectionItemNumber,
        fieldLabel
    ) {
        expect(
            await caseDetailsPage.isCollectionItemFieldValueDisplayed(
                collectionLabel,
                collectionItemNumber,
                fieldLabel,
                fieldValue
            )
        ).to.equal(true);
    });

Then(/^Within the (.+) fieldset, I should see (.+) for the (.+) field$/,
    async function (
        fieldsetLabel,
        fieldValue,
        fieldLabel
    ) {
        expect(
            await caseDetailsPage.isFieldsetFieldValueDisplayed(
                fieldsetLabel,
                fieldLabel,
                fieldValue
            )
        ).to.equal(true);
    });
