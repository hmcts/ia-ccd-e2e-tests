Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    Then I wait for 10 seconds
    And I refresh the page
    And I wait for 30 seconds
    Then I should see the text `Filters`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    And I click the `Close and Return to case details` button

  @xbrowser @nightly-test
  Scenario: Submit an appeal application

    And I select the `Submit your appeal` Next step
    And I wait for 5 seconds
    Then I should see the `Declaration` page
    And I agree to the declaration
    # And I click the `Continue` button
    When I click the `Submit` button
    And I wait for 30 seconds
    Then I should see the text `Your appeal has been submitted`
    When I click the `Close and Return to case details` button
    Then I should see the text `Case record`
    And I restart the browser

