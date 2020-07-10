Feature: Validation for list case without agreed hearing requirements


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
    And I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

  @RIA-2243 @list-case-validation-after-submit-hearing-req
  Scenario: Validation for list case without agreed requirements

    When I switch to be a `Admin Officer`
    And I click the `Hearing and appointment` tab
    And I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    When I click the `Overview` tab
    Then I should only see the `adminOfficer_listing_submittedRequirements` case progress image

    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will agree what adjustments the Tribunal will make.`

    When I select the `List the case` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You've made an invalid request. You cannot list the case until the hearing requirements have been reviewed.`

    When I click the `Overview` tab
    Then I should only see the `adminOfficer_listing_submittedRequirements` case progress image

