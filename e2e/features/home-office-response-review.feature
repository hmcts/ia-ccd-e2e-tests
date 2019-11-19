Feature: Home Office appeal response under review


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

  @regression @home-office-response-review @RIA-1794
  Scenario: Case officer directs the appellant to review the Home office appeal response


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

    When I click the `direct the appellant to review the Home Office response` link
    Then I am on the `Review Home Office response` page

    And I should see `The respondent has replied to your appeal argument and evidence. You must now review their response` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+5}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `The respondent has replied to your appeal argument and evidence. You must now review their response` in the `Explain the direction you are issuing` field
    And I should see `Next steps` in the `Explain the direction you are issuing` field
    And I should see `If you would like to respond, you must email the Tribunal caseworker within 5 days` in the `Explain the direction you are issuing` field
    And I should see `If you do not respond within 5 days, the case will automatically go to hearing` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+5|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `Legal representative will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appellant has been directed to review the Home Office response`
    And I should see the text `If they do not respond within 5 working day of the direction, the case automatically proceeds to a hearing`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    Then I click the `Directions` tab
    And I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `The respondent has replied to your appeal argument and evidence. You must now review their response` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Next steps` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you would like to respond, you must email the Tribunal caseworker within 5 days` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not respond within 5 days, the case will automatically go to hearing` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` in the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY} in the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY} in the `Date sent` field

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_respondentReview_appealResponseAvailable` case progress image
    And I should see the text `Do this next`
    And I should see the text `The appellant will review the Home Office response`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    Then I click the `Directions` tab
    And I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `The respondent has replied to your appeal argument and evidence. You must now review their response` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Next steps` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you would like to respond, you must email the Tribunal caseworker within 5 days` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not respond within 5 days, the case will automatically go to hearing` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` in the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY} in the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY} in the `Date sent` field

