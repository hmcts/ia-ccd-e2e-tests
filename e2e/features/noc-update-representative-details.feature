Feature: Update Representative's Details - NoC banner prompt and previous representation

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @notice-of-change @ria-4293-no-noc-and-previous-representation @RIA-4293
  Scenario: Update legal representative details without a NoC - Pre-populated fields and do not appeand to previous representations collection

    And I click the `Appellant` tab
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

    When I click the `Update representative's details` link
    Then I should see the `Update representative details` page

    # Disabling the check for Company name below as this check will only
    # work locally (as local mocked ref data is different to AAT)
    # And I should see `Fake Org Ltd` in the `Company` field
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Own reference` field

    And I type `IA Legal Services Joy Division` for the `Company` field
    And I type `Bilbo Baggins` for the `Name` field
    And I type `ia-law-firm-c-sc@fake2.hmcts.net` for the `Email` field
    And I type `new-reference-bbaggins` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `IA Legal Services Joy Division` in the `Company` field
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Own reference` field

    When I click the `Update` button
    And I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    And I should not see the image `legalRep_doThisNow_updateDetails.svg`

    And I click the `Appellant` tab
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `IA Legal Services Joy Division` in the `Company` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

  @notice-of-change @ria-4293-noc-previous-representation @RIA-4293
  Scenario: NoC request as a user from a different organisation - Pre-poulated company name, other fields cleared and append to previous representations

    And I get the most recent case id for removing representation

    Given I am signed in as a `Legal Org User Rep C`
    And I wait for 5 seconds
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter details` page
    And I enter the correct answers to the challenge questions
    And I click the `Continue` button
    And I select all the submit checkboxes
    And I click the `Submit` button
    And I should see the text `Notice of change successful`
    And I should see the text `You're now representing a client on case`
    And I should see the `View this case` link
    And I should see the `View case list` link
    When I click the `View this case` link

    Then I should see the image `legalRep_doThisNow_updateDetails.svg`

    And I click the `Appellant` tab
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

    When I click the `Update representative's details` link
    Then I should see the `Update representative details` page

    # Disabling the check for Company name below as this check will only
    # work locally (as local mocked ref data is different to AAT)
    # And I should see `Fake Org2 Ltd` in the `Company` field
    And the `Name` field should be empty
    And the `Email` field should be empty
    And the `Own reference` field should be empty

    And I type `Fake Org2 Ltd Best Branch` for the `Company` field
    And I type `Bilbo Baggins` for the `Name` field
    And I type `ia-law-firm-c-sc@fake2.hmcts.net` for the `Email` field
    And I type `new-reference-bbaggins` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Fake Org2 Ltd Best Branch` in the `Company` field
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Own reference` field

    When I click the `Update` button
    And I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    And I should not see the image `legalRep_doThisNow_updateDetails.svg`

    And I click the `Appellant` tab
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `Fake Org2 Ltd Best Branch` in the `Company` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Legal representative reference` field
    And I should see the text `Previous representation`
    And within the `Previous representation` collection's first item, I should see `IA Legal Services` for the `Company Name` field
    And within the `Previous representation` collection's first item, I should see `ia-legal-fenn` for the `Legal representation reference` field
