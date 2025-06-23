Feature: Bails Update interpreter details application as Legal Rep
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    When I create a new bail application
    Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with two financial condition supporters and with a Legal Representative with no files uploaded
    And I submit my bail application as a `Legal Rep`

  @bail-nightly-test
  Scenario: Add Update interpreter details application
    And I switch to be a `Admin Officer Bails`
    When I select the `Update interpreter details` Next step
    Then I should see the text `Update interpreter details`
    When I click the `Add new` button
    And I type `12345` for the `Booking reference` field
    And I type `Krishna` for the `Given names` field
    And I type `test` for the `Family name` field
    And I type `09988776655` for the `Phone number` field
    And I type `test@gmail.com` for the `Email` field
    And I wait for 3 seconds
    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see the text `12345`
    And I should see the text `Krishna`
    And I click the `Update` button
    And I click the `Close and Return to case details` button