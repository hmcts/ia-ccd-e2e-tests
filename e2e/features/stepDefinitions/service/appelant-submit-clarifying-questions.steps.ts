import { When } from '@cucumber/cucumber';
import { CcdService, Events } from '../../../aip/ccd-service';

When(/^the appellant submits clarifying answers$/, async function () {
  const ccdService = new CcdService();

  const ccdCaseDetails = await ccdService.loadCasesForUser(this.userId, this.securityHeaders);
  const usersCase = ccdCaseDetails[0];

  usersCase.case_data.clarifyingQuestionsAnswers = [
    {
      id: '1',
      value: {
        question: 'Question 1',
        answer: 'Answer 1',
      },
    },
  ];

  await ccdService.updateAppeal(Events.SUBMIT_CLARIFYING_QUESTION_ANSWERS, this.userId, usersCase, this.securityHeaders);
});
