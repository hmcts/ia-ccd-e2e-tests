Feature: Build case

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`

    When I select the `Submit your case` Next step
    Then I should see the text `You cannot submit this case because you have not uploaded any case building documents.`

    When I select the `Build your case` Next step
    Then I am on the `Build your case` page
    And the `Continue` button is disabled
    And I should see the text `You must upload your appeal skeleton argument to submit your case`

    When I upload `{@CaseArgument.pdf}` for the `Appeal skeleton argument` field
    Then the `Continue` button is enabled
    When I type `This is the case argument` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And within the `Evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Evidence (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `CaseArgument.pdf` in the `Appeal skeleton argument` field
    And I should see `This is the case argument` in the `Describe the document` field
    And within the `Evidence` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Evidence` collection's first item, I should see `This is the evidence` in the `Describe the document` field

  @OnlyIfSaveAndContinueIsEnabled @regression @create-direction @RIA-480 @RIA-600 @RIA-927
  Scenario: Save and continue is enabled
    When I click the `Upload` button
    Then I should see the text `Upload saved`
    Then I should see the text `You still need to submit your case`
    Then I should see the text `What happens next`
    Then I should see the text `If you're ready for your case to be reviewed, submit your case.`
    Then I should see the text `If you're not yet ready for your case to be reviewed, continue to build your case.`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Documents` tab


    And within the `Legal representative documents` collection's first item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `This is the case argument` in the `Description` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Legal representative documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Legal representative documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field


  @RIA-2918 @RIA-3534
  Scenario: Save and continue is disabled
    When I click the `Submit Case` button
    Then I should see the text `You have submitted your case`
    Then I should see the text `We have sent you a confirmation email`
    Then I should see the text `What happens next`
    Then I should see the text `The case officer will now review your appeal.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Legal representative documents` collection's first item, I should see `2020-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's second item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Legal representative documents` collection's second item, I should see `This is the case argument` in the `Description` field
    And within the `Legal representative documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's third item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Legal representative documents` collection's third item, I should see `This is the evidence` in the `Description` field
    And within the `Legal representative documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
