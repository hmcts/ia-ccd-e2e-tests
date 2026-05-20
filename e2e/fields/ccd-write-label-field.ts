import { Field } from './field';
import { by, ElementFinder } from 'protractor';

export class CcdWriteLabelField implements Field {
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
    return this.getValueElement().getText();
  }

  public async setValue(value) {
    throw new Error('Unsupported -- field is read only');
  }

  public async isDisplayed() {
    return this.getValueElement().isDisplayed();
  }

  public async isEnabled() {
    return this.getValueElement().isEnabled();
  }

  public isReadOnly() {
    return true;
  }

  private getValueElement() {
    return this.container.element(by.xpath('.//dd'));
  }
}
