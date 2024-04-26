import { Field } from './field';
import { by, ElementFinder } from 'protractor';

export class CcdWriteYesNoField implements Field {
  private readonly container: ElementFinder;
  private readonly fieldLabel: string;

  public constructor(container: ElementFinder, fieldLabel: string) {
    this.container = container;
    this.fieldLabel = fieldLabel;
  }

  public getLabel() {
    return this.fieldLabel;
  }

  public async getOptions() {
    return ['Yes', 'No'];
  }

  public async getValue() {
    const selectedRadioElement = this.getSelectedRadioElement();
    if (selectedRadioElement.isPresent()) {
      if ((await selectedRadioElement.getId()).endsWith('Yes')) {
        return 'Yes';
      } else {
        return 'No';
      }
    }
  }

  public async setValue(value) {
    await this.container.element(by.xpath('.//label[normalize-space()="' + value + '"]')).click();
  }

  public async isDisplayed() {
    return await this.getInputElementParents().first().isDisplayed();
  }

  public async isEnabled() {
    return await this.getInputElements().first().isEnabled();
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
