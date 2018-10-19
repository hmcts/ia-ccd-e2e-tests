import {ElementFinder, Key} from 'protractor';

export class FormFiller {

    async clearText(
        inputElement: ElementFinder,
        length?: number
    ) {
        const inputText = await inputElement.getAttribute('value');
        length = length || inputText.length || 255;
        await inputElement.sendKeys(Key.BACK_SPACE.repeat(length));
    }

    async replaceText(
        inputElement: ElementFinder,
        value: any
    ) {
        await this.clearText(inputElement);
        inputElement.sendKeys(value);
    }
}
