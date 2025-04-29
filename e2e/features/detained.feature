Feature: Detained appeal flow - LR Journey

@detained-appeal-test
Scenario:
 Given I am signed in as a `Legal Org User Rep A`
 And I create a new case
 And I wait for 5 seconds
 And I save my initial detained HU appeal type without remission and with hearing fee and pay now
 And I wait for 10 seconds
 And I click the `Close and Return to case details` button if present
 And I wait for 2 seconds
 And I pay for and submit my appeal by Card
    
    