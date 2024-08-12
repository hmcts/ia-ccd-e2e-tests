import { $, browser, ExpectedConditions } from 'protractor';
import { AnyPage } from './any.page';
import { FormFiller } from '../helpers/form-filler';
import { Wait } from '../enums/wait';

export class IdamSignInPage extends AnyPage {
  private formFiller = new FormFiller();

  private username = 'form[name="loginForm"] input#username';
  private password = 'form[name="loginForm"] input#password';

  // first selector is for Idam, second selector is for Idam simulator
  private signInButton = 'form[name="loginForm"] input[type=submit], form[name="loginForm"] button[type=submit]';

  async signIn(emailAddress: string, password: string) {
    await this.waitUntilLoaded();
    await this.runAccessbility();
    await this.formFiller.replaceText($(this.username), emailAddress);
    await this.formFiller.replaceText($(this.password), password);
    await $(this.signInButton).click();
  }

  async isLoaded() {
    return (await browser.driver.getCurrentUrl()).includes('login') && (await ExpectedConditions.visibilityOf($(this.signInButton))());
  }

  async waitUntilLoaded() {
    await browser.driver.wait(ExpectedConditions.visibilityOf($(this.signInButton)), Wait.normal, 'IDAM Sign In page did not load in time');
  }
}
