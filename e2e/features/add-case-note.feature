Feature: Add a case note

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 20 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I click the `Close and Return to case details` button
    And I select the `Pay and submit` Next step
    Then I should see the `Select PBA number` page
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    And I wait for 30 seconds
    Then I should see the text `Your appeal has been paid for and submitted`

  @regression @add-case-note @RIA-575 @nightly-test
  Scenario: Add a case note with document

    And I switch to be a `Case Officer`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    When I type `some case note subject` for the `Subject` field
    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I upload `{@test.doc}` for the `Upload a document (Optional)` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field
    And I should see `test.doc` in the `Upload a document` field

    When I click the `Save note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `test.doc` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Case Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    # When I click the `Add case note` link
    When I select the `Add case note` Next step
    And I wait for 3 seconds
    Then I am on the `Add case note` page


  @regression @add-case-note @RIA-575 @nightly-test
  Scenario: Add a case note without document

    And I switch to be a `Case Officer`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`

    When I type `some case note subject` for the `Subject` field

    When I type `some case note description` for the `Case note` field
    And I wait for 1 seconds
    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field

    When I click the `Save note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Case Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I select the `Add case note` Next step
    And I wait for 3 seconds
    Then I am on the `Add case note` page

  @regression @add-subsequent-case-note @RIA-575
  Scenario: Add a case note without document

    And I switch to be a `Case Officer`
    Given I select the `Add case note` Next step
    And I type `old case note subject` for the `Subject` field
    And I type `old case note description` for the `Case note` field
    And I click the `Continue` button
    And I click the `Save note` button
    And I click the `Close and Return to case details` button

    And I select the `Add case note` Next step
    And I type `latest case note subject` for the `Subject` field
    And I type `latest case note description` for the `Case note` field
    And I click the `Continue` button
    And I click the `Save note` button
    And I click the `Close and Return to case details` button

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `latest case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `latest case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Case Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    And within the `Case notes` collection's second item, I should see `old case note subject` for the `Subject` field
    And within the `Case notes` collection's second item, I should see `old case note description` for the `Case note` field
    And within the `Case notes` collection's second item, I should see `Case Officer` for the `User` field
    And within the `Case notes` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field


  @regression @add-case-note @RIA-575 @RIA-2208
  Scenario: Add a case note with document judge

    And I switch to be a `Judge`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    And the `Continue` button is disabled

    When I type `some case note subject` for the `Subject` field
    Then the `Continue` button is disabled

    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I upload `{@test.doc}` for the `Upload a document (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field
    And I should see `test.doc` in the `Upload a document` field

    When I click the `Save note` button
    And I should see the text `You have added a case note`
    And I should see the text `What happens next`
    And I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `test.doc` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Judge X` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I click the `Add case note` link
    Then I am on the `Add case note` page


  @regression @add-case-note @RIA-575 @RIA-2208
  Scenario: Add a case note without document judge

    And I switch to be a `Judge`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    And the `Continue` button is disabled

    When I type `some case note subject` for the `Subject` field
    Then the `Continue` button is disabled

    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field

    When I click the `Save note` button
    And I should see the text `You have added a case note`
    And I should see the text `What happens next`
    And I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Judge X` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I click the `Add case note` link
    Then I am on the `Add case note` page

  @regression @add-subsequent-case-note @RIA-575 @RIA-2208
  Scenario: Add a case note without document judge

    And I switch to be a `Judge`
    Given I select the `Add case note` Next step
    And I type `old case note subject` for the `Subject` field
    And I type `old case note description` for the `Case note` field
    And I click the `Continue` button
    And I click the `Save note` button
    And I click the `Close and Return to case details` button

    And I select the `Add case note` Next step
    And I type `latest case note subject` for the `Subject` field
    And I type `latest case note description` for the `Case note` field
    And I click the `Continue` button
    And I click the `Save note` button
    And I click the `Close and Return to case details` button

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `latest case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `latest case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Judge X` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    And within the `Case notes` collection's second item, I should see `old case note subject` for the `Subject` field
    And within the `Case notes` collection's second item, I should see `old case note description` for the `Case note` field
    And within the `Case notes` collection's second item, I should see `Judge X` for the `User` field
    And within the `Case notes` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field


  @regression @add-case-note @RIA-575 @RIA-2208
  Scenario: Add a case note with document admin officer

    And I switch to be a `Admin Officer`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    And the `Continue` button is disabled

    When I type `some case note subject` for the `Subject` field
    Then the `Continue` button is disabled

    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I upload `{@test.doc}` for the `Upload a document (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field
    And I should see `test.doc` in the `Upload a document` field

    When I click the `Save note` button
    And I should see the text `You have added a case note`
    And I should see the text `What happens next`
    And I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `test.doc` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I click the `Add case note` link
    Then I am on the `Add case note` page


  @regression @add-case-note @RIA-575 @RIA-2208
  Scenario: Add a case note without document  admin officer

    And I switch to be a `Admin Officer`
    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    And the `Continue` button is disabled

    When I type `some case note subject` for the `Subject` field
    Then the `Continue` button is disabled

    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field

    When I click the `Save note` button
    And I should see the text `You have added a case note`
    And I should see the text `What happens next`
    And I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I click the `Add case note` link
    Then I am on the `Add case note` page

  @regression @add-subsequent-case-note @RIA-575 @RIA-2208
  Scenario: Add a case note without document  admin officer

    And I switch to be a `Admin Officer`
    Given I select the `Add case note` Next step
    And I type `old case note subject` for the `Subject` field
    And I type `old case note description` for the `Case note` field
    And I click the `Continue` button
    And I click the `Save note` button
    And I click the `Close and Return to case details` button

    And I select the `Add case note` Next step
    And I type `latest case note subject` for the `Subject` field
    And I type `latest case note description` for the `Case note` field
    And I click the `Continue` button
    And I click the `Save note` button
    And I click the `Close and Return to case details` button

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `latest case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `latest case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    And within the `Case notes` collection's second item, I should see `old case note subject` for the `Subject` field
    And within the `Case notes` collection's second item, I should see `old case note description` for the `Case note` field
    And within the `Case notes` collection's second item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field
