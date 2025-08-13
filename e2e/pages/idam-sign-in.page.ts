import { $, browser, ExpectedConditions } from 'protractor';
import { AnyPage } from './any.page';
import { FormFiller } from '../helpers/form-filler';

export class IdamSignInPage extends AnyPage {
  private formFiller = new FormFiller();

  private username = 'form[name="loginForm"] input#username';
  private password = 'form[name="loginForm"] input#password';

  // first selector is for Idam, second selector is for Idam simulator
  private signInButton = 'form[name="loginForm"] input[type=submit], form[name="loginForm"] button[type=submit]';

  async signIn(emailAddress: string, password: string) {
    console.log("START: waitUntilLoaded");
    await this.waitUntilLoaded();
    console.log("END: waitUntilLoaded");
    console.log("START: runAccessbility");
    await this.runAccessbility();
    console.log("END: runAccessbility");
    console.log("START: replaceTextEmailAddress");
    await this.formFiller.replaceText($(this.username), emailAddress);
    console.log("END: replaceTextEmailAddress");
    console.log("START: replaceTextPassword");
    await this.formFiller.replaceText($(this.password), password);
    console.log("END: replaceTextPassword");
    console.log("START: clickSignInButton");
    await $(this.signInButton).click();
    console.log("END: clickSignInButton");
  }

  async isLoaded() {
    return (await browser.driver.getCurrentUrl()).includes('login') && (await ExpectedConditions.visibilityOf($(this.signInButton))());
  }

  async waitUntilLoaded() {
    await browser.driver.wait(ExpectedConditions.visibilityOf($(this.signInButton)), 30000, 'IDAM Sign In page did not load in time');
  }
}
