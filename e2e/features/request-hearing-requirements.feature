Feature: Request hearing requirements

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

  @regression @create-direction @RIA-385 @RIA-1784 @RIA-2694
  Scenario: Request hearing requirements

    When I select the `Request hearing requirements` Next step
    Then I am on the `Request hearing requirements` page
    When I click the `Send direction` button
    Then I should see an alert confirming the case `has been updated with event: Request hearing requirements`

    When I click the `Overview` tab
    And I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to submit their hearing requirements.`

    When I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The appeal is going to a hearing and you should tell the Tribunal if the appellant has any hearing requirements.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Visit the online service and use the HMCTS reference to find the case. You'll be able to submit the hearing requirements using the Overview tab.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `The Tribunal will review the hearing requirements and any requests for additional adjustments. You'll then be sent a hearing date.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not submit the hearing requirements within 5 working days, the Tribunal may not be able to accommodate the appellant's needs for the hearing.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant will submit their hearing requirements.`
