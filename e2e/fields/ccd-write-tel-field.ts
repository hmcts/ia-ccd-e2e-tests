import { Field } from './field';
import { FormFiller } from '../helpers/form-filler';
import { by, ElementFinder } from 'protractor';

export class CcdWriteTelField implements Field {
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
    return this.getValueElement().getAttribute('value');
  }

  public async setValue(value) {
    await this.formFiller.replaceText(this.getValueElement(), value);
  }

  public async isDisplayed() {
    return this.getValueElement().isDisplayed();
  }

  public async isEnabled() {
    return this.getValueElement().isEnabled();
  }

  public isReadOnly() {
    return false;
  }

  private getValueElement() {
    return this.container.element(by.xpath('.//input[@type="tel"]'));
  }
}
