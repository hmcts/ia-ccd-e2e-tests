Feature: Notice of Change (common component) - Previous Representation

  Background:

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @notice-of-change @no-noc-and-previous-representation @RIA-4234
  Scenario: Update legal representative details without a NoC - Do not appeand to previous representations collection

    And I click the `Appellant` tab
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

    When I click the `Update representative's details` link
    And I type `Bilbo Baggins` for the `Name` field
    And I type `ia-law-firm-c-sc@fake2.hmcts.net` for the `Email` field
    And I type `new-reference-bbaggins` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Own reference` field

    When I click the `Update` button
    And I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    And I click the `Appellant` tab
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

  @notice-of-change @noc-previous-representation @RIA-4234
  Scenario: NoC request as a user from a different organisation - Update legal representative details and append to previous representations

    And I get the most recent case id for removing representation

    Given I am signed in as a `Legal Org User Rep C`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter your client's details` page
    And I enter the correct answers to the challenge questions
    And I click the `Continue` button
    And I select all the submit checkboxes
    And I click the `Submit` button
    And I should see the text `Notice of change successful`
    And I should see the text `You're now representing a client on case`
    And I should see the `View this case` link
    And I should see the `View case list` link
    And I click the `View this case` link

    And I click the `Appellant` tab
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

    When I click the `Update representative's details` link
    And I type `Bilbo Baggins` for the `Name` field
    And I type `ia-law-firm-c-sc@fake2.hmcts.net` for the `Email` field
    And I type `new-reference-bbaggins` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Own reference` field

    When I click the `Update` button
    And I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    And I click the `Appellant` tab
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `Fake Org2 Ltd` in the `Company` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Legal representative reference` field
    And I should see the text `Previous representation`
    And within the `Previous representation` collection's first item, I should see `IA Legal Services` for the `Company Name` field
    And within the `Previous representation` collection's first item, I should see `ia-legal-fenn` for the `Legal representation reference` field

  @notice-of-change @remove-representation-legal-rep-noc @RIA-4234
  Scenario: Remove representation by legal representative - New NoC (update legal representative details and append to previous representations)

    And I get the most recent case id for removing representation

    When I select the `Stop representing a client` Next step
    Then I should see the `Stop representing a client` page
    And I set the case role id field
    And I should see the text `Client`
    And I should see the text `José González`
    And I should see the text `Once you've submitted this request`
    And I should see the text `You will no longer have access to this case`
    And I should see the text `If the case has been shared with any colleagues, they will also lose access`
    And I should see the text `Linked appeals are not affected. If you want to stop representing a client on a linked appeal, you need to access the case and repeat this action.`
    And I click the `Continue` button

    And I click the `Submit` button
    And I should see the text `You have stopped representing this client`
    And I should see the text `What happens next`
    And I should see the text `We've sent you an email confirming you're no longer representing this client. You have been removed from this case and no longer have access to it.`
    And I should see the `View case list` link
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Given I am signed in as a `Legal Org User Rep C`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter your client's details` page
    And I enter the correct answers to the challenge questions
    And I click the `Continue` button
    And I select all the submit checkboxes
    And I click the `Submit` button
    And I should see the text `Notice of change successful`
    And I should see the text `You're now representing a client on case`
    And I should see the `View this case` link
    And I should see the `View case list` link
    When I click the `View this case` link

    And I click the `Appellant` tab
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

    When I click the `Update representative's details` link
    And I type `Bilbo Baggins` for the `Name` field
    And I type `ia-law-firm-c-sc@fake2.hmcts.net` for the `Email` field
    And I type `new-reference-bbaggins` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Own reference` field

    When I click the `Update` button
    And I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    And I click the `Appellant` tab
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `Fake Org2 Ltd` in the `Company` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Legal representative reference` field
    And I should see the text `Previous representation`
    And within the `Previous representation` collection's first item, I should see `IA Legal Services` for the `Company Name` field
    And within the `Previous representation` collection's first item, I should see `ia-legal-fenn` for the `Legal representation reference` field

  @notice-of-change @remove-representation-tcw-noc @RIA-4234
  Scenario: Remove representation by TCW - New NoC (update legal representative details and append to previous representations)

    And I get the most recent case id for removing representation

    And I switch to be a `Case Officer`

    When I select the `Remove legal representative` Next step
    And I set the case role id field
    And I should see the text `Client`
    And I should see the text `José González`
    And I should see the text `Once you've submitted this request`
    And I should see the text `The legal representative will no longer have access to this case`
    And I should see the text `If the case has been shared with other legal representatives, they will also lose access`
    And I should see the text `If there are any cases linked to this appeal, they will not be affected`
    And I click the `Continue` button

    And I click the `Submit` button
    And I should see the text `You have removed the legal representative from this appeal`
    And I should see the text `What happens next`
    And I should see the text `All parties will be notified.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Given I am signed in as a `Case Officer`

    Given I am signed in as a `Legal Org User Rep C`
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    And I enter the latest case id for the online case reference number
    And I click the `Continue` button
    And I should see the `Enter your client's details` page
    And I enter the correct answers to the challenge questions
    And I click the `Continue` button
    And I select all the submit checkboxes
    And I click the `Submit` button
    And I should see the text `Notice of change successful`
    And I should see the text `You're now representing a client on case`
    And I should see the `View this case` link
    And I should see the `View case list` link
    When I click the `View this case` link

    And I click the `Appellant` tab
    And I should see `Stephen Fenn` in the `Name` field
    And I should see `IA Legal Services` in the `Company` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` in the `Email` field
    And I should see `ia-legal-fenn` in the `Legal representative reference` field
    And I should not see the text `Previous representation`

    When I click the `Update representative's details` link
    And I type `Bilbo Baggins` for the `Name` field
    And I type `ia-law-firm-c-sc@fake2.hmcts.net` for the `Email` field
    And I type `new-reference-bbaggins` for the `Own reference` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Own reference` field

    When I click the `Update` button
    And I should see the text `You've updated the legal representative's details`
    And I should see the text `The service will be updated. The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Update representative details`

    And I click the `Appellant` tab
    And I should see `Bilbo Baggins` in the `Name` field
    And I should see `Fake Org2 Ltd` in the `Company` field
    And I should see `ia-law-firm-c-sc@fake2.hmcts.net` in the `Email` field
    And I should see `new-reference-bbaggins` in the `Legal representative reference` field
    And I should see the text `Previous representation`
    And within the `Previous representation` collection's first item, I should see `IA Legal Services` for the `Company Name` field
    And within the `Previous representation` collection's first item, I should see `ia-legal-fenn` for the `Legal representation reference` field
