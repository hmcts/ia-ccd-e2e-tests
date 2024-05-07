import { Field } from './field';
import { FormFiller } from '../helpers/form-filler';
import { by, ElementFinder } from 'protractor';

export class CcdWriteAddressField implements Field {
  private readonly formFiller = new FormFiller();

  private readonly container: ElementFinder;
  private readonly fieldLabel: string;

  public constructor(container: ElementFinder, fieldLabel: string) {
    this.container = container;
    this.fieldLabel = fieldLabel;
  }

  public getLabel() {
    return this.fieldLabel;
  }

  public getOptions() {
    return [];
  }

  public async getValue() {
    return await this.getValueElement().getAttribute('value');
  }

  public async setValue(value) {
    const optionElement = await this.container.element(by.xpath('.//option[normalize-space()="' + value + '"]'));

    if (await optionElement.isPresent()) {
      await optionElement.click();
    } else {
      await this.formFiller.replaceText(await this.container.all(by.xpath('.//input[@type="text"]')).first(), value);
    }
  }

  public async isDisplayed() {
    return await this.getValueElement().first().isDisplayed();
  }

  public async isEnabled() {
    return await this.getValueElement().first().isEnabled();
  }

  public isReadOnly() {
    return false;
  }

  private getValueElement() {
    return this.container.all(by.xpath('.//input[@type="text"]'));
  }
}
