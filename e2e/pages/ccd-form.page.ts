import { CcdPage } from './ccd.page';
import { $, browser, ExpectedConditions } from 'protractor';

export class CcdFormPage extends CcdPage {

    async fieldErrorContains(match: string) {

        await browser.wait(ExpectedConditions.visibilityOf($('.error-message')));
        return (await $('.error-message').getText()).includes(match);
    }

    async addCollectionItem(complexFieldLabel) {
        await this.fields.addCollectionItem(complexFieldLabel);
    }

    async removeCollectionItem(complexFieldLabel, collectionItemNumber) {
        await this.fields.removeCollectionItem(complexFieldLabel, collectionItemNumber);
    }

    async getFieldOptions(
        fieldLabel: string,
        fieldValue: string,
        complexFieldLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            fieldLabel,
            complexFieldLabel,
            collectionItemNumber
        );

        if (!!field && await field.isDisplayed()) {

            return await field.getOptions();

        } else {
            throw 'Cannot find field with label: ' + fieldLabel;
        }
    }

    async setFieldValue(
        fieldLabel: string,
        fieldValue: string,
        complexFieldLabel?: string,
        collectionItemNumber?: string | number
    ) {
        const field = await this.fields.find(
            fieldLabel,
            complexFieldLabel,
            collectionItemNumber
        );

        if (!!field && await field.isDisplayed()) {

            const expandedFieldValue = await this.valueExpander.expand(fieldValue);
            await field.setValue(expandedFieldValue);

        } else {
            throw 'Cannot find field with label: ' + fieldLabel;
        }
    }
}
