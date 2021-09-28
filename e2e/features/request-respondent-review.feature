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
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`

  @regression @create-direction @RIA-435 @RIA-2694
  Scenario: Request respondent review

    When I select the `Request respondent review` Next step
    Then I am on the `Request respondent review` page
    And I should see `You have until the date indicated below to review the appellant's argument and evidence.` in the `Explain the direction you are issuing` field
    And I should see `You must explain whether the appellant makes a valid case for overturning the original decision.` in the `Explain the direction you are issuing` field
    And I should see `You must respond to the Tribunal and tell them:` in the `Explain the direction you are issuing` field
    And I should see `- whether you oppose all or parts of the appellant's case` in the `Explain the direction you are issuing` field
    And I should see `- what your grounds are for opposing the case` in the `Explain the direction you are issuing` field
    And I should see `- which of the issues are agreed or not agreed` in the `Explain the direction you are issuing` field
    And I should see `- whether there are any further issues you wish to raise` in the `Explain the direction you are issuing` field
    And I should see `- whether you are prepared to withdraw to grant` in the `Explain the direction you are issuing` field
    And I should see `- whether the appeal can be resolved without a hearing` in the `Explain the direction you are issuing` field
    And I should see `If you do not respond in time the Tribunal will decide how the case should proceed` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `You have until the date indicated below to review the appellant's argument and evidence.` in the `Explain the direction you are issuing` field
    And I should see `You must explain whether the appellant makes a valid case for overturning the original decision` in the `Explain the direction you are issuing` field
    And I should see `You must respond to the Tribunal and tell them:` in the `Explain the direction you are issuing` field
    And I should see `- whether you oppose all or parts of the appellant's case` in the `Explain the direction you are issuing` field
    And I should see `- what your grounds are for opposing the case` in the `Explain the direction you are issuing` field
    And I should see `- which of the issues are agreed or not agreed` in the `Explain the direction you are issuing` field
    And I should see `- whether there are any further issues you wish to raise` in the `Explain the direction you are issuing` field
    And I should see `- whether you are prepared to withdraw to grant` in the `Explain the direction you are issuing` field
    And I should see `- whether the appeal can be resolved without a hearing` in the `Explain the direction you are issuing` field
    And I should see `If you do not respond in time the Tribunal will decide how the case should proceed` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14|D MMM YYYY}` for the `By what date must they comply?` field
    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `Wait for the respondent to complete the direction`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `You have until the date indicated below to review the appellant's argument and evidence` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You must explain whether the appellant makes a valid case for overturning the original decision` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You must respond to the Tribunal and tell them:` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- whether you oppose all or parts of the appellant's case` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- what your grounds are for opposing the case` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- which of the issues are agreed or not agreed` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- whether there are any further issues you wish to raise` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- whether you are prepared to withdraw to grant` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- whether the appeal can be resolved without a hearing` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not respond in time the Tribunal will decide how the case should proceed` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @regression @create-direction @RIA-435
  Scenario: Request respondent review with changes to default values

    When I select the `Request respondent review` Next step
    Then I am on the `Request respondent review` page
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
