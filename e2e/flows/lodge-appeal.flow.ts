import { AnyCcdFormPage } from '../pages/any-ccd-form.page';

export class LodgeAppealFlow {

    private anyCcdFormPage = new AnyCcdFormPage();

    async completeScreeningQuestions(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Tell us about your client')

        await this.anyCcdFormPage.click('My client is at least 18 years old');
        await this.anyCcdFormPage.click('My client is not currently in detention');
        await this.anyCcdFormPage.click('My client isn\'t appealing with other people as part of a linked appeal');
        await this.anyCcdFormPage.click(
            'My client is located in one of these postcodes: ' +
            'BN, CB, CM, HP, IP, ME, N, NR, RH, SE, TN, W, L, LA, M, OL, PR, SK, WA, WN'
        );
        await this.anyCcdFormPage.click('My client is presently in the UK');
        await this.anyCcdFormPage.click('My client is not stateless');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReference(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Home Office reference');

        await this.anyCcdFormPage.setFieldValue('Home Office reference number', 'A123456/001');
        await this.anyCcdFormPage.setFieldValue('Date on the decision letter', '31-10-2018');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeBasicDetails(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Basic details');

        await this.anyCcdFormPage.setFieldValue('Title', 'Mr');
        await this.anyCcdFormPage.setFieldValue('Given names', 'José');
        await this.anyCcdFormPage.setFieldValue('Last name', 'González');
        await this.anyCcdFormPage.setFieldValue('Date of birth', '31-12-1999');
        await this.anyCcdFormPage.addNewCollectionItem('Nationality');
        await this.anyCcdFormPage.setCollectionItemFieldValue('Nationality', 'first', 'Nationality', 'Finland');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeClientAddress(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Your client\'s address');

        await this.anyCcdFormPage.setFieldValue('Does the appellant have a fixed address?', 'No');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeWhyIsClientAppealing(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Why is your client appealing?');

        await this.anyCcdFormPage.setFieldValue('Appeal reason', 'My client\'s protection claim was refused');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeNewMatters(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('New matters');

        await this.anyCcdFormPage.setFieldValue(
            'Are there any new reasons your client wishes to remain in the UK ' +
            'or any new grounds on which they should be permitted to stay?',
            'Yes'
        );
        await this.anyCcdFormPage.setFieldValue(
            'Explain what the new matters are and why they are relevant to this appeal.',
            'Birth of a child'
        );

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeOtherAppeals(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Has your client appealed against any other UK immigration decisions?');

        await this.anyCcdFormPage.setFieldValue('Other appeals', 'No');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeReferenceNumber(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Your own reference number');

        await this.anyCcdFormPage.setFieldValue(
            'If you prefer to use your own reference number for this case, you can enter it here. (Optional)',
            'some-ref'
        );

        if (clickContinue) {
            await this.anyCcdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {
        await this.anyCcdFormPage.pageHeadingContains('Check your answers');

        if (clickContinue) {
            await this.anyCcdFormPage.click('Save and continue');
        }
    }

    async lodgeAppeal(clickContinue = false) {
        await this.completeScreeningQuestions(true);
        await this.completeHomeOfficeReference(true);
        await this.completeBasicDetails(true);
        await this.completeClientAddress(true);
        await this.completeWhyIsClientAppealing(true);
        await this.completeNewMatters(true);
        await this.completeOtherAppeals(true);
        await this.completeReferenceNumber(true);
        await this.completeCheckYourAnswers(true);

        if (clickContinue) {
            await this.anyCcdFormPage.click('Close and Return to case details');
        }
    }
}
