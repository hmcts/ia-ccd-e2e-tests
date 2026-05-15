import { CcdPage } from '../../pages/ccd.page';
import { Then } from '@cucumber/cucumber';

const iaConfig = require('../../ia.conf');

const ccdPage = new CcdPage();

Then(/^The page is accessible$/, async() => {
  if (iaConfig.TestForAccessibility) {
    await ccdPage.runAccessbility();
  }
});
