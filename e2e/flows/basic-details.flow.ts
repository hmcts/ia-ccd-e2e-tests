import { AnyCcdFormPage } from '../pages/any-ccd-form.page';

export class BasicDetailsFlow {

    private anyCcdFormPage = new AnyCcdFormPage();

    async completeForm() {
        await this.anyCcdFormPage.setFieldValue('Title', 'Mr');
        await this.anyCcdFormPage.setFieldValue('Given names', 'José');
        await this.anyCcdFormPage.setFieldValue('Last name', 'González');
        await this.anyCcdFormPage.setFieldValue('Date of birth', '31-12-1999');
        await this.anyCcdFormPage.addNewCollectionItem('Nationality');
        await this.anyCcdFormPage.setCollectionItemFieldValue('Nationality', 'first', 'Nationality', 'Finland');
        await this.anyCcdFormPage.setFieldValue('My client\'s nationality is not agreed', 'No');
    }
}
