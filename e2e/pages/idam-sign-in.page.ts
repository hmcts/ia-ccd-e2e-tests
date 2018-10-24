import { browser, $ } from 'protractor';
import { AnyPage } from './any.page';
import { FormFiller } from '../helpers/form-filler';
import { Wait } from '../enums/wait';

export class IdamSignInPage extends AnyPage {

    private formFiller = new FormFiller();

    private username = $('form[name="loginForm"] input#username');
    private password = $('form[name="loginForm"] input#password');
    private signInButton = $('form[name="loginForm"] input[type=submit]');

    async signIn(
        emailAddress: string,
        password: string
    ) {
        await this.formFiller.replaceText(this.username, emailAddress);
        await this.formFiller.replaceText(this.password, password);
        await this.signInButton.click();
    }

    async isLoaded() {

        await browser.waitForAngularEnabled(false);

        const currentUrl = await browser.driver.getCurrentUrl();
        return currentUrl.includes('idam')
            && currentUrl.includes('login')
            && await this.signInButton.isPresent();
    }

    async waitUntilLoaded() {

        await browser.waitForAngularEnabled(false);
        await browser.driver.wait(
            async () => await this.isLoaded(),
            Wait.normal,
            'IDAM Sign In page did not load in time'
        );
    }
}
