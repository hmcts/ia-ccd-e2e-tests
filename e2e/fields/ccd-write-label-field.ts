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
    return await this.getValueElement().getText();
  }

  public async setValue(value) {
    throw 'Unsupported -- field is read only';
  }

  public async isDisplayed() {
    return await this.getValueElement().isDisplayed();
  }

  public async isEnabled() {
    return await this.getValueElement().isEnabled();
  }

  public isReadOnly() {
    return true;
  }

  private getValueElement() {
    return this.container.element(by.xpath('.//dd'));
  }
}
