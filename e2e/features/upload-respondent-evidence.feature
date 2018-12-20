Feature: Upload respondent evidence

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @create-direction @RIA-700 @RIA-592
  Scenario: Uploading respondent evidence adds documents and a new direction

    When I select the `Upload respondent evidence` Next step
    Then I am on the `Upload respondent evidence` page
    When I add an item to the `Upload case documents` collection
    And within the `Upload case documents` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Document` field
    And within the `Upload case documents` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Document` field
    And I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded the respondent evidence`
    Then I should see the text `What happens next`
    Then I should see the text `The legal representative will now get an email`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Respondent documents` field
    And within the `Respondent documents` collection's first item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` field
    And within the `Directions` collection's first item, I should see `You must now build your case` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You must write a full argument` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `The respondent then has 14 days to respond` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+28|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
