import { CcdFormPage } from '../pages/ccd-form.page';

export class AllocateARoleFlow {

    private ccdFormPage = new CcdFormPage();

    async legalOps(clickContinue = false) {
        await this.ccdFormPage.headingContains('Legal Ops');
        await this.ccdFormPage.click('Allocate a role');
        await this.ccdFormPage.headingContains('Choose a role');
        await this.ccdFormPage.click( 'Case Manager');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.headingContains('Choose how to allocate the role');
        await this.ccdFormPage.click( 'Reserve to me');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Confirm allocation');
    }

    async Judiciary(clickContinue = false) {
    await this.ccdFormPage.headingContains('Judiciary');
    await this.ccdFormPage.click('Allocate a role');
    await this.ccdFormPage.headingContains('Choose a role');
    await this.ccdFormPage.click( ' Lead Judge');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.headingContains('Choose how to allocate the role');
    await this.ccdFormPage.doesDropdownHaveValues('Tom Cruz(330085EMP-@ejudiciary.net)');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Continue');
    await this.ccdFormPage.click('Confirm allocation');
}};
