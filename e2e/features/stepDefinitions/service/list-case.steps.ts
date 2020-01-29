import { ListCaseFlow } from '../../../flows/list-case.flow';
import { Then } from 'cucumber';

const listCaseFlow = new ListCaseFlow();

Then(/^I list the case$/, async function () {
    await listCaseFlow.listTheCase(true);
});

Then(/^I list the case with hearing requirements$/, async function () {
    await listCaseFlow.listTheCase(true);
});
