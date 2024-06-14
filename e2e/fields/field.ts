export interface Field {
  getLabel();

  getOptions();

  getValue();

  setValue(value);

  isDisplayed();

  isEnabled();

  isReadOnly();
}
