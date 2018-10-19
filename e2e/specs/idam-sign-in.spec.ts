import {AnyCcdPage} from '../pages/any-ccd.page';
import {AuthenticationFlow} from '../flows/authentication.flow';
import {IdamSignInPage} from '../pages/idam-sign-in.page';

const anyCcdPage = new AnyCcdPage();
const authenticationFlow = new AuthenticationFlow();
const idamSignInPage = new IdamSignInPage();

describe('User authentication', () => {

    beforeEach(async () => {
        await authenticationFlow.signOut();
    });

    it('should show case list after a user has authenticated', async () => {

        await anyCcdPage.getWithoutWaitingForAngular('/list/case');
        await idamSignInPage.waitUntilLoaded();

        await authenticationFlow.signInAsCaseOfficer();

        await anyCcdPage.waitUntilLoaded();

        expect(await anyCcdPage.isLoaded()).toBe(true);
        expect(await idamSignInPage.isLoaded()).toBe(false);
    });

    it('should show sign in form instead of case list when user has *not* authenticated', async () => {

        await anyCcdPage.getWithoutWaitingForAngular('/list/case');
        await idamSignInPage.waitUntilLoaded();

        expect(await anyCcdPage.isLoaded()).toBe(false);
        expect(await idamSignInPage.isLoaded()).toBe(true);
    });
});
