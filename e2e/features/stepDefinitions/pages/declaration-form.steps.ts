import { AnyCcdFormPage } from '../../../pages/any-ccd-form.page';
import { When } from 'cucumber';

const anyCcdFormPage = new AnyCcdFormPage();

When(/^I agree to the declaration$/, async function () {
    await anyCcdFormPage.click(
        'I the representative am giving notice of appeal in accordance with the appellant\'s instructions ' +
        'and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.'
    );
});
