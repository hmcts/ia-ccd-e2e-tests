import { Field } from './field';
import { FormFiller } from '../helpers/form-filler';
import { by, ElementFinder } from 'protractor';

export class CcdWriteTextAreaField implements Field {
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
    await this.formFiller.replaceText(this.getValueElement(), value);
  }

  public async isDisplayed() {
    return await this.getValueElement().isDisplayed();
  }

  public async isEnabled() {
    return await this.getValueElement().isEnabled();
  }

  public isReadOnly() {
    return false;
  }

  private getValueElement() {
    return this.container.element(by.xpath('.//textarea'));
  }
}
