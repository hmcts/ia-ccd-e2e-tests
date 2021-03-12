Feature: Upload sensitive documents

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @RIA-3392
  Scenario: Upload sensitive document

    When I select the `Upload sensitive documents` Next step
    Then I am on the `Upload sensitive documents` page
    And I should see the text `Uploaded sensitive documents appear in the documents tab and are only visible to HMCTS and judicial users.No users are notified when these are added. These documents are not addded to the hearing bundle.`
    And I should see the text `Advice on uploads`
    And the `Continue` button is disabled

    When I select `The respondent` for the `Document supplied by` field
    And I add an item to the `Sensitive document` collection
    And within the `Sensitive document` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
    And within the `Sensitive document` collection's first item, I type `This is a sensitive document` for the `Describe the document` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `The respondent` for the `Document supplied by` answer
    And within the `Sensitive document` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Sensitive document` collection's first item, I should see `This is a sensitive document` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded sensitive documentation`
    Then I should see the text `What happens next`
    Then I should see the text `You can see the documentation in the documents tab. Select Edit documents from the Next step dropdown if you need to remove a document.`

    When I click the `documents tab` link

    And within the `Sensitive documents` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Sensitive documents` collection's first item, I should see `The respondent` in the `Supplied by` field
    And within the `Sensitive documents` collection's first item, I should see `his is a sensitive document` in the `Description` field
    And within the `Sensitive documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I select the `Edit documents` Next step
    Then I am on the `Edit documents` page

    When I remove the first item from the `Sensitive documents` collection
    When I click the `Continue` button
    Then I should see the text `Reasons for editing or removing the documents`
    
    When I type `some reasons for editing documents` for the `Reasons for editing or removing the documents` field
    And I click the `Continue` button
    Then I should see the `Submit` button
    
    When I click the `Submit` button
    Then I should see the case details
    
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `Edit documents audit note` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `reason: some reasons for editing documents` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `documentIds: ` in the `Case note` field    
