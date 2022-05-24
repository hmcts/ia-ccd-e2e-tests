Feature: Add a case note to bails application
 Background:
   Given I am signed in as a `Home Office Generic`
   When I create a new bail application
   And I save my initial application as a `Home Office Generic` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
   And I submit my bail application as a `Home Office Generic`

  @bails-add-case-note @bails-add-case-note-admin-officer @bails-add-case-note-document @bails-add-case-note-document-admin-officer @RIA-5753 @bails-nightly
  Scenario: Add case note with document as Admin Officer
    When I switch to be a `Admin Officer`
    When I select the `Add case note` Next step
    Then I am on the `Case note details` page
    And I should see the text `Enter the details of the case note`
    When I type `some case note subject` for the `Subject` field
    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I upload `{@BailsCaseNote.pdf}` for the `Upload a document (Optional)` field
    And I wait for 10 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field
    And I should see `BailsCaseNote.pdf` in the `Upload a document` field

    When I click the `Add case note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `BailsCaseNote.pdf` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I switch to be a `Judge`
    And I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `BailsCaseNote.pdf` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

  @bails-add-case-note @bails-add-case-note-judge @bails-add-case-note-document @bails-add-case-note-document-judge @RIA-5753 @bails-nightly
  Scenario: Add case note with document as Judge
    When I switch to be a `Judge`
    When I select the `Add case note` Next step
    Then I am on the `Case note details` page
    And I should see the text `Enter the details of the case note`
    When I type `some case note subject` for the `Subject` field
    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I upload `{@BailsCaseNote.pdf}` for the `Upload a document (Optional)` field
    And I wait for 10 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field
    And I should see `BailsCaseNote.pdf` in the `Upload a document` field

    When I click the `Add case note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `BailsCaseNote.pdf` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Judge` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I switch to be a `Admin Officer`
    And I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `BailsCaseNote.pdf` for the `Document` field
    And within the `Case notes` collection's first item, I should see `Judge` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

  @bails-add-case-note @bails-add-case-note-admin-officer @RIA-5753 @bails-nightly
  Scenario: Add case note without document as Admin Officer
    When I switch to be a `Admin Officer`
    When I select the `Add case note` Next step
    Then I am on the `Case note details` page
    And I should see the text `Enter the details of the case note`
    When I type `some case note subject` for the `Subject` field
    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field

    When I click the `Add case note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I switch to be a `Judge`
    And I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Admin Officer` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

  @bails-add-case-note @bails-add-case-note-judge @RIA-5753 @bails-nightly
  Scenario: Add case note without document as Judge
    When I switch to be a `Judge`
    When I select the `Add case note` Next step
    Then I am on the `Case note details` page
    And I should see the text `Enter the details of the case note`
    When I type `some case note subject` for the `Subject` field
    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field

    When I click the `Add case note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Judge` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field

    When I switch to be a `Admin Officer`
    And I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `Judge` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field
