Feature: Home Office appeal response amendment


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

  @regression @home-office-response-amend @RIA-1794
  Scenario: Case officer directs the Home Office to amend the appeal response


    Then I should only see the `caseOfficer_respondentReview_submittedResponse` case progress image

    And I should see the text `Do this next`
    And I should see the text `Check the response uploaded by the respondent`
    And I should see the text `If it complies with the Procedure Rules and Practice Directions, direct the appellant to review the Home Office response`
    And I should see the text `If it does not comply, direct the respondent to make the appropriate changes`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Add appeal response` for the `Next step` field
    And I should see the option `Review Home Office response` for the `Next step` field
    And I should see the option `Amend appeal response` for the `Next step` field
    And I should see the option `Request hearing requirements` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `End the appeal` for the `Next step` field

    When I click the `direct the respondent to make the appropriate changes` link
    Then I am on the `Amend appeal response` page
    When I type `Do the thing` for the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I type `15-10-2019` for the `By what date must they comply?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Do the thing` for the `Explain the direction you are issuing` answer
    And I should see `Respondent` for the `Who are you giving the direction to?` answer
    And I should see `15 Oct 2019` for the `By what date must they comply?` answer

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    Then I should see the text `You can see the status of the direction in the directions tab`

    When I click the `Close and Return to case details` button
    Then I should only see the `caseOfficer_respondentReview_amendResponse` case progress image
    And I should see the text `Do this next`
    And I should see the text `The respondent has been directed to make changes with their response`
    And I should see the text `You'll be notified when the revised response has been uploaded`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    Then I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `Do the thing` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `15 Oct 2019` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
