Feature: Flag a FTPA case

  Background:

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Admin Officer`

    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page
    And I should see the text `This flag will only be visible to the Tribunal.`
    And the `Continue` button is disabled

    When I select `Set aside - Reheard` from the `Type of flag` field
    Then I click the `Continue` button
    And I should see the text `Additional information (Optional)`
    Then the `Continue` button is enabled

    When I type `Some information` for the `Additional information (Optional)` field
    Then I click the `Continue` button
    And I am on the `Check your answers` page
    And I should see `Set aside - Reheard` in the `Type of flag` field
    And I should see `Some information` in the `Additional information` field

    When I click the `Flag case` button
    Then I should see the text `You've flagged this case`
    And I should see the text `What happens next`
    And I should see the text `This flag will only be visible to the Tribunal. The case will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: Flag the case`

    When I click the `Overview` tab
    Then I should see the text `Flags`
    And I should see the text `These flags are only visible to the Tribunal.`
    And I should see the `caseFlagSetAsideReheard.svg` image
    And I should see `Some information` for the `Additional information` field


  @ftpa-reheard-feature @edit-ftpa-flag-ao @RIA-3651
  Scenario: Edit Set aside - Reheard flag on a case (admin officer)

    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page

    When I select `Set aside - Reheard` from the `Type of flag` field
    Then I click the `Continue` button
    And I should see `Some information` for the `Additional information (Optional)` field

    When I type `Some information updated` for the `Additional information (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Set aside - Reheard` in the `Type of flag` field
    And I should see `Some information updated` in the `Additional information` field

    When I click the `Flag case` button
    Then I should see the text `You've flagged this case`
    And I should see the text `What happens next`
    And I should see the text `This flag will only be visible to the Tribunal. The case will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: Flag the case`

    When I click the `Overview` tab
    Then I should see the text `Flags`
    And I should see the text `These flags are only visible to the Tribunal.`
    And I should see the `caseFlagSetAsideReheard.svg` image
    And I should see `Some information updated` for the `Additional information` field


  @ftpa-reheard-feature @remove-ftpa-flag-ao @RIA-3651
  Scenario: Remove Set aside - Reheard flag from a case (admin officer)

    When I select the `Remove a flag` Next step
    Then I am on the `Remove a flag` page
    And I should see the text `Select a flag to remove from the case`

    When I select `Set aside - Reheard` from the `Type of flag` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Set aside - Reheard` in the `Type of flag` field

    When I click the `Remove flag` button
    Then I should see the text `You've removed the flag from this case`
    And I should see the text `What happens next`
    And I should see the text `This flag has been removed from the case. The case will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: Remove a flag`

    When I click the `Overview` tab
    Then I should not see the text `Flags`
    And I should not see the text `These flags are only visible to the Tribunal.`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should not see the text `Some information`
