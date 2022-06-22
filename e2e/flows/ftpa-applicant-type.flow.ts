import { CcdFormPage } from '../pages/ccd-form.page';

export class SelectFtpaApplicantType {

    private ccdFormPage = new CcdFormPage();

    async choseAppellant(clickContinue = false) {

        await this.ccdFormPage.headingContains('judge FTPA decision');
        await this.ccdFormPage.click('Appellant');
        // await this.ccdFormPage.click('Continue');
    }

    async choseHomeOffice(clickContinue = false) {

        await this.ccdFormPage.headingContains('judge FTPA decision');
        await this.ccdFormPage.click('Home Office');
        // await this.ccdFormPage.click('Continue');
    }
}
