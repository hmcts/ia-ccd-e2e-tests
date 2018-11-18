import { AnyCcdCheckAnswersPage } from '../../../pages/any-ccd-check-answers.page';
import { Then } from 'cucumber';
import { expect } from 'chai';

const anyCcdCheckAnswersPage = new AnyCcdCheckAnswersPage();

Then(/^I should see (.+) for the (.+) answer$/, async function (fieldValue, fieldLabel) {
    expect(await anyCcdCheckAnswersPage.isFieldValueDisplayed(fieldLabel, fieldValue)).to.equal(true);
});

Then(/^Within the (.+) collection, I should see (.+) for the ([^\s]+) (.+) answer$/,
    async function (
        collectionLabel,
        fieldValue,
        collectionItemNumber,
        fieldLabel
    ) {
        expect(
            await anyCcdCheckAnswersPage.isCollectionItemFieldValueDisplayed(
                collectionLabel,
                collectionItemNumber,
                fieldLabel,
                fieldValue
            )
        ).to.equal(true);
    });

Then(/^Within the (.+) fieldset, I should see (.+) for the (.+) answer$/,
    async function (
        fieldsetLabel,
        fieldValue,
        fieldLabel
    ) {
        expect(
            await anyCcdCheckAnswersPage.isFieldsetAnswerDisplayed(
                fieldsetLabel,
                fieldLabel,
                fieldValue
            )
        ).to.equal(true);
    });
