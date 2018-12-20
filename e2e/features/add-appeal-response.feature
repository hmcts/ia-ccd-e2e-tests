Feature: Add respondent response

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
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review

  @create-direction @RIA-697 @RIA-237
  Scenario: Uploading respondent response adds documents and a new direction

    When I select the `Add appeal response` Next step
    Then I am on the `Add appeal response` page
    When I upload `{@AppealResponse.pdf}` for the `Response document` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And Within the first `Evidence (Optional)` collection item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And Within the first `Evidence (Optional)` collection item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponse.pdf` in the `Response document` field
    And I should see `This is the appeal response` in the `Describe the document` field
    And Within the first `Evidence` collection item, I should see `Evidence1.pdf` for the `Document` field
    And Within the first `Evidence` collection item, I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded the appeal response`
    Then I should see the text `What happens next`
    Then I should see the text `The legal representative will now get an email directing them to review the response.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Respondent documents` field
    And Within the first `Respondent documents` collection item, I should see `AppealResponse.pdf` in the `Document` field
    And Within the first `Respondent documents` collection item, I should see `This is the appeal response` in the `Description` field
    And Within the first `Respondent documents` collection item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And Within the second `Respondent documents` collection item, I should see `Evidence1.pdf` in the `Document` field
    And Within the second `Respondent documents` collection item, I should see `This is the evidence` in the `Description` field
    And Within the second `Respondent documents` collection item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` field
    And Within the first `Directions` collection item, I should see `The respondent has replied to your appeal argument and evidence. You must now review their response.` in the `Explanation` field
    And Within the first `Directions` collection item, I should see `You have 5 days to review the response.` in the `Explanation` field
    And Within the first `Directions` collection item, I should see `Legal representative` for the `Parties` field
    And Within the first `Directions` collection item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And Within the first `Directions` collection item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
