Feature: Create case summary

  @regression @case-summary @RIA-364
  Scenario: Case Officer creates case summary

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`

    When I select the `Create case summary` Next step
    Then I am on the `Create case summary` page

    When I upload `{@CaseSummary.pdf}` for the `Case summary document` document field
    And I type `This is the case summary` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `CaseSummary.pdf` in the `Case summary document` field
    And I should see `This is the case summary` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded the case summary`
    Then I should see the text `What happens next`
    Then I should see the text `Generate the hearing ready bundle if you are ready to do so.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    #And I see the open case
    And I click the `Documents` tab

    And within the `Hearing documents` collection's first item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `This is the case summary` in the `Description` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
