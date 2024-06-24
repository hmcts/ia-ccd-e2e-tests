Feature: Home Office CID Reference number is padded - edit appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @regression @edit-appeal-ho-ref-padding  @RIA-3783
  Scenario: Valid home office UAN reference

    And I save my initial appeal with Home Office Reference/Case ID `123456`
    When I select the `Edit appeal` Next step
    Then I am on the `Edit appeal` page


    Given I am on the `Home Office details` page
    When I type `1234` for the `Home Office Reference/Case ID` field
    And I type `{$TODAY-3|DD-MM-YYYY}` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    And I complete the `Basic details` page
    And I click the `Continue` button
    And I click the `Continue` button
    And I complete the `The appellant's contact preference` page

    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `1234` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see `000001234` for the `Home Office Reference/Case ID` field

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

    And I switch to be a `Case Officer`
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `Review the appeal application form data and cross reference it with Home Office data. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    And I should see the text `Request respondent evidence`
    And I should see the text `The first column of information is sourced from the appeal application form, the second column of information is from Home Office records`
    And I should see the text `000001234`
