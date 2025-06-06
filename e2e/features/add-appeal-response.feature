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

  @regression @create-direction @RIA-697 @RIA-237 @RIA-2694 @RIA-3275
  Scenario: Uploading respondent response adds documents and a new direction

    When I select the `Add appeal response` Next step
    Then I am on the `Add appeal response` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- None`

    When I upload `{@AppealResponse.pdf}` for the `Response document` document field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And within the `Evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` document field
    And within the `Evidence (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponse.pdf` in the `Response document` field
    And I should see `This is the appeal response` in the `Describe the document` field
    And within the `Evidence` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Evidence` collection's first item, I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded the appeal response`
    Then I should see the text `What happens next`
    Then I should see the text `The legal representative will now get an email directing them to review the response.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to review the Home Office response.`

    #And I see the open case
    When I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The Home Office has replied to your Appeal Skeleton Argument and evidence. You should review their response.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Review the Home Office response.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

