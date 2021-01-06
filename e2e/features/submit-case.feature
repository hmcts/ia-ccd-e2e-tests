Feature: Submit case

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case

@regression @submit-case @RIA-517 @OnlyIfSaveAndContinueIsEnabled
  Scenario: Upload Case argument and evidence

    When I select the `Submit your case` Next step
    And I am on the `Submit your case` page
    And I click the `Submit` button
    Then I should see the text `You have submitted your case`
    Then I should see the text `We have sent you a confirmation email`
    Then I should see the text `What happens next`
    Then I should see the text `The case officer will now review your appeal.`
