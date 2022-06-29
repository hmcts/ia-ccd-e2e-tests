Feature: Submit bail application as Legal Rep
 Background:
   Given I am signed in as a `Legal Org User Rep A`
   And I wait for 10 seconds
   And I create a new bail application
   And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
   And I submit my bail application as a `Legal Rep`
   And I get the bails online case reference

  @bails-NOC @RIA-5911 @bails-remove-legal-rep @bails @bails-regression
  Scenario: Remove Legal Rep
    When I switch to be a `Admin Officer`
    And I select the `Remove legal representative` Next step
    Then I should see the `Remove legal representative` page
    When I select `Legal Representative` for the `Case Role Id` field
    And I click the `Continue` button
    And I click the `Submit` button
    Then I should see the text `You have removed the legal representative from this case`
    When I click the `Close and Return to case details` button
    And I wait for 5 seconds
    Then I should see an alert confirming the case `has been updated with event: Remove legal representative`
    When I am signed in as a `Legal Org User Rep A`
    And I Apply case list filter for Bails
    And I wait for 3 seconds
    And I filter by the bails online case reference
    And I click the `Apply` button
    And I wait for 5 seconds
    Then I should see the text `No cases found. Try using different filters.`

  @bails-NOC @RIA-5911 @bails-notice-of-change @bails @bails-notice-of-change-incorrect
  Scenario: Notice of Change - incorrect details
    When I am signed in as a `Legal Org User Rep A`
    And I wait for 10 seconds
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    When I enter the bails online case reference for the online case reference number
    And I click the `Continue` button
    Then I should see the `Enter details` page
    When I enter the incorrect first name answer to the challenge questions for bails
    And I click the `Continue` button
    Then I should see the text `Enter the client details exactly as they're written on the case, including any mistakes`
    When I click the `Back` link
    And I enter the bails online case reference for the online case reference number
    And I click the `Continue` button
    Then I should see the `Enter details` page
    When I enter the incorrect last name answer to the challenge questions for bails
    And I click the `Continue` button
    Then I should see the text `Enter the client details exactly as they're written on the case, including any mistakes`
    When I click the `Back` link
    And I enter the bails online case reference for the online case reference number
    And I click the `Continue` button
    Then I should see the `Enter details` page
    When I enter the incorrect DoB answer to the challenge questions for bails
    And I click the `Continue` button
    Then I should see the text `Enter the client details exactly as they're written on the case, including any mistakes`

  @bails-NOC @RIA-5911 @bails-notice-of-change @bails @bails-regression @bails-notice-of-change-same-organisation
  Scenario: Notice of Change - same organisation
    When I am signed in as a `Legal Org User Rep A`
    And I wait for 10 seconds
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    When I enter the bails online case reference for the online case reference number
    And I click the `Continue` button
    Then I should see the `Enter details` page
    When I enter the correct answers to the challenge questions for bails
    And I click the `Continue` button
    Then I should see the text `Your organisation already has access to this case`
    And I should see the text `You or a colleague are already representing this client on this case.`

  @bails-NOC @RIA-5911 @bails-notice-of-change @bails @bails-regression @bails-notice-of-change-happy-path
  Scenario: Notice of Change
    When I am signed in as a `Legal Org User Rep B`
    And I wait for 10 seconds
    And I click the `Notice of change` link
    Then I should see the `Notice of change` page
    When I enter the bails online case reference for the online case reference number
    And I click the `Continue` button
    Then I should see the `Enter details` page
    When I enter the correct answers to the challenge questions for bails
    And I click the `Continue` button
    Then I should see the `Check and submit` page
    And I should see the text `Harri`
    And I should see the text `Pugh`
    And I should see the text `1989-02-10`
    When I click the `Submit` button
    Then I should see the text `There is a problem`
    When I select all the submit checkboxes
    And I click the `Submit` button
    And I wait for 20 seconds
    Then I should see the text `Notice of change successful`
    When I click the `View this case` link
    Then I should see the text `Current progress of the case`
    When I sign back in as a `Legal Org User Rep A`
    And I Apply case list filter for Bails
    And I wait for 3 seconds
    And I filter by the bails online case reference
    And I click the `Apply` button
    And I wait for 5 seconds
    Then I should see the text `No cases found. Try using different filters.`