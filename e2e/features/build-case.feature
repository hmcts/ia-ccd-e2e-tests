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

  @create-direction @RIA-480 @RIA-600
  Scenario: Upload Case argument and evidence

    When I select the `Build your case` Next step
    Then I am on the `Build your case` page
    When I upload `{@CaseArgument.pdf}` for the `Appeal skeleton argument` field
    And I type `This is my case argument` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And Within the first `Evidence (Optional)` collection item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And Within the first `Evidence (Optional)` collection item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `CaseArgument.pdf` in the `Appeal skeleton argument` field
    And I should see `This is my case argument` in the `Describe the document` field
    And Within the first `Evidence` collection item, I should see `Evidence1.pdf` for the `Document` field
    And Within the first `Evidence` collection item, I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `Upload saved`
    Then I should see the text `You still need to submit your case`
    Then I should see the text `What happens next`
    Then I should see the text `If you're ready for your case to be reviewed, submit your case.`
    Then I should see the text `If you're not yet ready for your case to be reviewed, continue to build your case.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Legal representative documents` field
    And Within the first `Legal representative documents` collection item, I should see `CaseArgument.pdf` in the `Document` field
    And Within the first `Legal representative documents` collection item, I should see `This is my case argument` in the `Description` field
    And Within the first `Legal representative documents` collection item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And Within the second `Legal representative documents` collection item, I should see `Evidence1.pdf` in the `Document` field
    And Within the second `Legal representative documents` collection item, I should see `This is the evidence` in the `Description` field
    And Within the second `Legal representative documents` collection item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
