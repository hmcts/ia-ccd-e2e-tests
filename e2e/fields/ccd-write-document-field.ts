import { Field } from './field';
import { by, ElementFinder } from 'protractor';

export class CcdWriteDocumentField implements Field {
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

  public async setValue(filename) {
    this.getValueElement().sendKeys(filename);
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
    return this.container.element(by.xpath('.//input[@type="file"]'));
  }
}
