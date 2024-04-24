Feature: Home Office Reference/Case ID number is validated

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

  @regression @start-appeal @alternate @RIA-597 @migrate-to-unit-tests @RIA-3680
  Scenario: Valid home office UAN reference

    Given I am on the `Home Office details` page
    When I type `1234-5678-8765-0000` for the `Home Office Reference/Case ID` field
    And I type `{$TODAY-3|DD-MM-YYYY}` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button
    Then I am on the `Upload the Notice of Decision` page

    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `Tell us about your client's nationality` page
    And I complete the `Your client's address` page
    And I complete the `The appellant's contact preference` page


    Given I am on the `Type of appeal` page
    When I select `Refusal of protection claim` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Continue` button

    Given I am on the `Deportation order` page
    When I select `Yes` for the `Has a deportation order been made against the appellant?` field
    And I click the `Continue` button

    Given I am on the `New matters` page
    When I select `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I type `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    When I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    When I type `IA Legal Services` for the `Company` field
    And I type `Stephen Fenn` for the `Name` field
    And I type `ia-legal-fenn` for the `Own reference` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `1234-5678-8765-0000` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit your appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see `1234-5678-8765-0000` for the `Home Office Reference/Case ID` field

    When I click the `Appellant` tab
    Then I should see `DRAFT` for the `Appeal reference` field

    When I select the `Submit your appeal` Next step
    Then I am on the `Submit your appeal` page
    And I click the `Continue` button
    Then I am on the `Submit your appeal` page
    And the `Continue` button is disabled

    When I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`
    And I should see the text `What happens next`
    And I should see the text `You will receive an email confirming that this appeal has been submitted successfully.`
