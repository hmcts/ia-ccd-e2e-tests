Feature: Link and Unlink appeal

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `Do this next`
    And I pay for and submit my appeal by PBA
    And I wait for 15 seconds
    And I switch to be a `Case Officer`

  @RIA-3291 
  Scenario: Link and unlink an appeal

    When I select the `Link the appeal` Next step

    Then I am on the `Link the appeal` page
    And I should see the text `Reason for link`

    When I select `Familial` from the `Reason for link` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Familial` in the `Reason for link` field

    When I click the `Link appeal` button
    Then I should see the text `You have linked this appeal`
    And I should see the text `What happens next`
    And I should see the text `The appeal will now be considered as part of a set of linked appeals. You must update the linked appeal spreadsheet to reflect this change.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Overview` tab
    # Then I should see `Familial` for the `Linked appeal` field

    When I select the `Unlink the appeal` Next step
    Then I am on the `Unlink the appeal` page
    And the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Unlink the appeal` page
    And the `Unlink appeal` button is enabled

    When I click the `Unlink appeal` button
    Then I should see the text `You have unlinked this appeal`
    And I should see the text `What happens next`
    And I should see the text `This appeal is now unlinked and will proceed as usual. You must update the linked appeal spreadsheet to reflect this change.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Overview` tab
    # Then I should not see the `Linked appeal` field

  @RIA-3291 
  Scenario: Unlink an appeal that is not already linked

    When I select the `Unlink the appeal` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    # And I should see the text `This appeal is not linked and so cannot be unlinked`


