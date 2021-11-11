Feature: Request respondent evidence

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Case Officer`
    And I request home office data

  @regression @create-direction @RIA-892 @RIA-2694 @nightly-test
  Scenario: Request respondent evidence

    And I click the `Overview` tab
    And I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`

    When I select the `Request Home Office data` Next step
    And I am on the `Match appellant details` page
    And I should see the option `No Match` for the `Make a selection` field
    And I select `No Match` for the `Make a selection` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `No Match` for the `Make a selection` field
    And I click the `Request Home Office data` button

    Then I should see the text `You have matched the appellant details`
    And I should see the text `Do this next`
    And I should see the text `You must review the appeal data and cross reference it with Home Office data in the validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`

    When I click the `Close and Return to case details` button

    Then I click the `Validation` tab
    And I should see the text `There are no matching details for this appellant. You can contact the Home Office if you need more information to validate the appeal.`

    When I select the `Request respondent evidence` Next step
    Then I am on the `Request respondent evidence` page
    And I should see `A notice of appeal has been lodged against this decision.` in the `Explain the direction you are issuing` field
    And I should see `You must now upload all documents to the Tribunal.` in the `Explain the direction you are issuing` field
    And I should see `You have until the date indicated below to supply` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `A notice of appeal has been lodged against this decision.` in the `Explain the direction you are issuing` field
    And I should see `You must now upload all documents to the Tribunal.` in the `Explain the direction you are issuing` field
    And I should see `You have until the date indicated below to supply` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `Wait for the respondent to complete the direction`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `A notice of appeal has been lodged against this decision.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You must now upload all documents to the Tribunal.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You have until the date indicated below to supply` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @regression @create-direction @RIA-892 @nightly-test
  Scenario: Request respondent evidence with changes to default values

    When I select the `Request respondent evidence` Next step
    Then I am on the `Request respondent evidence` page
    When I type `Something else` for the `Explain the direction you are issuing` field
    When I type `31-12-2020` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Something else` for the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `31 Dec 2020` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `Something else` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `31 Dec 2020` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
