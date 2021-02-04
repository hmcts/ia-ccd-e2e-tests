import { Field } from './field';
import { by, ElementFinder } from 'protractor';

export class CcdWriteFixedRadioListField implements Field {

    private readonly container: ElementFinder;
    private readonly fieldLabel: string;

    public constructor(container: ElementFinder,
                       fieldLabel: string) {
        this.container = container;
        this.fieldLabel = fieldLabel;
    }

    public getLabel() {
        return this.fieldLabel;
    }

    public async getOptions() {
        return await this.container
            .all(by.xpath('.//input/following-sibling::label'))
            .map(async (option) => (await option.getText()).trim());
    }

    public async getValue() {
        const selectedRadioElement = this.getSelectedRadioElement();
        if (await selectedRadioElement.isPresent()) {
            return await selectedRadioElement
                .element(by.xpath('./following-sibling::label'))
                .getText();
        }

        return ''
    }

    public async setValue(value) {
        console.log('radio button value is : ' + value);
        await this.container
            .element(by.xpath('.//label[normalize-space()="' + value + '"]/preceding-sibling::input[1]'))
            .click();
    }

    public async isDisplayed() {
        return await (this.getInputElementParents()).first().isDisplayed();
    }

    public async isEnabled() {
        return await (this.getInputElements()).first().isEnabled();
    }

    public isReadOnly() {
        return false;
    }

    private getInputElements() {
        return this.container.$$('input[type=radio]');
    }

    private getInputElementParents() {
        return this.container.$$('div.multiple-choice');
    }

    private getSelectedRadioElement() {
        return this.container.$('input[type=radio]:checked');
    }
}
