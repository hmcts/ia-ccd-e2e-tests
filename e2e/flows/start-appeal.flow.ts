import { CcdFormPage } from '../pages/ccd-form.page';

export class StartAppealFlow {

    private ccdFormPage = new CcdFormPage();

    async completeScreeningQuestions(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Tell us about your client')

        await this.ccdFormPage.click('My client is at least 18 years old');
        await this.ccdFormPage.click('My client is not currently in detention');
        await this.ccdFormPage.click('My client isn\'t appealing with other people as part of a linked appeal');
        await this.ccdFormPage.click(
            'My client is located in one of these postcodes: ' +
            'BN, CB, CM, HP, IP, ME, N, NR, RH, SE, TN, W, L, LA, M, OL, PR, SK, WA, WN'
        );
        await this.ccdFormPage.click('My client is presently in the UK');
        await this.ccdFormPage.click('My client is not stateless');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeHomeOfficeReference(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Home Office reference');

        await this.ccdFormPage.setFieldValue('Home Office reference number', 'A123456/001');
        await this.ccdFormPage.setFieldValue('Date on the decision letter', '31-10-2018');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeBasicDetails(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Basic details');

        await this.ccdFormPage.setFieldValue('Title', 'Mr');
        await this.ccdFormPage.setFieldValue('Given names', 'José');
        await this.ccdFormPage.setFieldValue('Last name', 'González');
        await this.ccdFormPage.setFieldValue('Date of birth', '31-12-1999');
        await this.ccdFormPage.addCollectionItem('Nationality');
        await this.ccdFormPage.setFieldValue('Nationality', 'Finland', 'Nationality', 'first');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeClientAddress(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Your client\'s address');

        await this.ccdFormPage.setFieldValue('Does the appellant have a fixed address?', 'No');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeWhyIsClientAppealing(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Why is your client appealing?');

        await this.ccdFormPage.setFieldValue('Appeal reason', 'My client\'s protection claim was refused');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeNewMatters(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('New matters');

        await this.ccdFormPage.setFieldValue(
            'Are there any new reasons your client wishes to remain in the UK ' +
            'or any new grounds on which they should be permitted to stay?',
            'Yes'
        );
        await this.ccdFormPage.setFieldValue(
            'Explain what the new matters are and why they are relevant to this appeal.',
            'Birth of a child'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeOtherAppeals(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Has your client appealed against any other UK immigration decisions?');

        await this.ccdFormPage.setFieldValue('Other appeals', 'No');

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeReferenceNumber(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Your own reference number');

        await this.ccdFormPage.setFieldValue(
            'If you prefer to use your own reference number for this case, you can enter it here. (Optional)',
            'some-ref'
        );

        if (clickContinue) {
            await this.ccdFormPage.click('Continue');
        }
    }

    async completeCheckYourAnswers(clickContinue = false) {
        await this.ccdFormPage.pageHeadingContains('Check your answers');

        if (clickContinue) {
            await this.ccdFormPage.click('Save and continue');
        }
    }

    async saveAppeal(clickContinue = false) {
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
            await this.ccdFormPage.click('Close and Return to case details');
        }
    }
}
