Feature: Link and Unlink appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @RIA-3291
  Scenario: Link and unlink an appeal

    When I select the `Link this appeal` Next step

    Then I am on the `Link this appeal` page
    And I should see the text `Reason for link`
    And the `Continue` button is disabled

    When I select `Familial` from the `Reason for link` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Familial` in the `Reason for link` field

    When I click the `Link appeal` button
    Then I should see the text `You have linked this appeal`
    And I should see the text `What happens next`
    And I should see the text `This appeal will now be considered as part of a set of linked appeals. You must update the linked appeal spreadsheet to reflect this change.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Link this appeal`

    When I click the `Overview` tab
    Then I should see `Familial` for the `Linked appeal` field

    When I select the `Unlink this appeal` Next step
    Then I am on the `Unlink this appeal` page
    And the `Unlink appeal` button is enabled

    When I click the `Unlink appeal` button
    Then I should see the text `This is no longer a linked appeal`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Unlink this appeal`

    When I click the `Overview` tab
    Then I should not see the `Linked appeal` field

  @RIA-3291
  Scenario: Unlink an appeal that is not already linked

    When I select the `Unlink this appeal` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `This appeal is not linked and so cannot be unlinked`


