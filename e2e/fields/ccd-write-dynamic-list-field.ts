import { Field } from './field';
import { by, ElementFinder } from 'protractor';

export class CcdWriteDynamicListField implements Field {
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
    return await this.container.all(by.xpath('.//option')).map(async (option) => (await option.getText()).trim());
  }

  public async getValue() {
    return await this.getSelectedOptionElement().getText();
  }

  public async setValue(value) {
    if (value === '') {
      value = '--Select a value--';
    }

    await this.container.element(by.xpath('.//option[normalize-space()="' + value + '"]')).click();
  }

  public async isDisplayed() {
    return await this.getSelectElement().isDisplayed();
  }

  public async isEnabled() {
    return await this.getSelectElement().isEnabled();
  }

  public isReadOnly() {
    return false;
  }

  private getSelectElement() {
    return this.container.element(by.xpath('.//select'));
  }

  private getSelectedOptionElement() {
    return this.container.element(by.css('option:checked'));
  }
}
