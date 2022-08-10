Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    Then I wait for 10 seconds
    And I refresh the page
    And I wait for 30 seconds
    Then I should see the text `Filters`
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    And I click the `Close and Return to case details` button

  @xbrowsertest
  Scenario: Submit an appeal application

    And I select the `Submit your appeal` Next step
    And I wait for 5 seconds
    Then I should see the `Declaration` page
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Submit` button
    And I wait for 30 seconds
    Then I should see the text `Your appeal has been submitted`
    When I click the `Close and Return to case details` button
    Then I should see the text `You still need to pay for your appeal. You will soon receive a notification with instructions on how to pay by card online. You need to pay within 14 days of receiving the notification or the Tribunal will end the appeal.`


    Scenario: test
      And I pay for and submit my appeal by PBA


    Scenario: test 2
      And I pay for and submit my appeal by Card
