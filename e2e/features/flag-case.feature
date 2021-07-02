Feature: Flag a case

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page
    And The page is accessible
    And I should see the text `This flag will only be visible to the Tribunal.`
    And I wait for 10 seconds
    When I select `Complex case` from the `Type of flag` field
    Then The page is accessible
    And I click the `Continue` button
    And I should see the text `Additional information (Optional)`
    And The page is accessible
    Then the `Continue` button is enabled

    When I type `Oh no! This case turned out to be rather complex!` for the `Additional information (Optional)` field
    Then I click the `Continue` button
    And I am on the `Check your answers` page
    And The page is accessible
    And I should see `Complex case` in the `Type of flag` field
    And I should see `Oh no! This case turned out to be rather complex!` in the `Additional information` field

    When I click the `Flag case` button
    Then I should see the text `You've flagged this case`
    And The page is accessible
    And I should see the text `What happens next`
    And I should see the text `This flag will only be visible to the Tribunal. The case will proceed as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Flag the case`
    And The page is accessible

    # When I click the `Overview` tab
    Then I should see the text `Flags`
    And The page is accessible
    And I should see the text `These flags are only visible to the Tribunal.`
    And I should see the `caseFlagComplexCase.png` image
    And I should see `Oh no! This case turned out to be rather complex!` for the `Additional information` field


  @RIA-3298
  Scenario: Additional information dialog is populated empty for non-existing flags
    
    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page
    And The page is accessible

    When I select `Complex case` from the `Type of flag` field
    Then I click the `Continue` button
    And The page is accessible
    And I should see `Oh no! This case turned out to be rather complex!` for the `Additional information (Optional)` field

    When I click the `Previous` button
    Then I select `Potentially violent person` from the `Type of flag` field
    And The page is accessible
    And I click the `Continue` button
    And the `Additional information (Optional)` field should be empty
    And The page is accessible

  
  @regression @flag-case @RIA-1742 @nightly-test
  Scenario: Flag a case with multiple flags and additional information

    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page
    And The page is accessible
    And I should see the text `This flag will only be visible to the Tribunal.`
    And I wait for 10 seconds
    When I select `Potentially violent person` from the `Type of flag` field
    Then I click the `Continue` button
    And The page is accessible
    And I should see the text `Additional information (Optional)`
    Then the `Continue` button is enabled

    When I type `The person has once slammed their fists against the desk.` for the `Additional information (Optional)` field
    Then I click the `Continue` button
    And The page is accessible
    And I am on the `Check your answers` page
    And I should see `Potentially violent person` in the `Type of flag` field
    And The page is accessible
    And I should see `The person has once slammed their fists against the desk.` in the `Additional information` field

    When I click the `Flag case` button
    Then I should see the text `You've flagged this case`
    And The page is accessible
    And I should see the text `What happens next`
    And I should see the text `This flag will only be visible to the Tribunal. The case will proceed as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Flag the case`
    And The page is accessible

    # When I click the `Overview` tab
    Then I should see the text `Flags`
    And The page is accessible
    And I should see the text `These flags are only visible to the Tribunal.`
    And I should see the `caseFlagComplexCase.png` image
    And I should see the `caseFlagPotentiallyViolentPerson.png` image
    And I should see `Oh no! This case turned out to be rather complex!` for the `Additional information` field
    And I should see the text `The person has once slammed their fists against the desk.`

  @regression @flag-case @RIA-1742 @nightly-test
  Scenario: Flag a case with multiple flags and only single additional information

    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page
    And The page is accessible
    And I should see the text `This flag will only be visible to the Tribunal.`
    And I wait for 10 seconds
    When I select `Potentially violent person` from the `Type of flag` field
    Then I click the `Continue` button
    And The page is accessible
    And I should see the text `Additional information (Optional)`
    Then the `Continue` button is enabled

    When I click the `Continue` button
    And I am on the `Check your answers` page
    And The page is accessible
    And I should see `Potentially violent person` in the `Type of flag` field

    When I click the `Flag case` button
    Then I should see the text `You've flagged this case`
    And The page is accessible
    And I should see the text `What happens next`
    And I should see the text `This flag will only be visible to the Tribunal. The case will proceed as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Flag the case`
    And The page is accessible

    # When I click the `Overview` tab
    Then I should see the text `Flags`
    And The page is accessible
    And I should see the text `These flags are only visible to the Tribunal.`
    And I should see the `caseFlagComplexCase.png` image
    And I should see the `caseFlagPotentiallyViolentPerson.png` image
    And I should see `Oh no! This case turned out to be rather complex!` for the `Additional information` field
    And I should not see the text `The person has once slammed their fists against the desk.`

  @regression @flag-case @RIA-3865
  Scenario: Flag a case with 94B flag and additional information

    When I select the `Flag the case` Next step
    Then I am on the `Flag the case` page
    And I should see the text `This flag will only be visible to the Tribunal.`

    When I select `S94B Out of Country` from the `Type of flag` field
    And I click the `Continue` button
    And I should see the text `Additional information (Optional)`
    Then the `Continue` button is enabled

    When I type `Oh no! This case turned out to be rather complex!` for the `Additional information (Optional)` field
    Then I click the `Continue` button
    And I am on the `Check your answers` page
    And I should see `S94B Out of Country` in the `Type of flag` field
    And I should see `Oh no! This case turned out to be rather complex!` in the `Additional information` field

    When I click the `Flag case` button
    Then I should see the text `You've flagged this case`
    And I should see the text `What happens next`
    And I should see the text `This flag will only be visible to the Tribunal. The case will proceed as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Flag the case`
    When I switch to be a `Legal Rep`
    Then I should not see the text `Flags`
    And I should not see the text `These flags are only visible to the Tribunal.`
    And I should not see the text `Oh no! This case turned out to be rather complex!`
    When I switch to be a `Home Office APC`
    Then I should not see the text `Flags`
    And I should not see the text `These flags are only visible to the Tribunal.`
    And I should not see the text `Oh no! This case turned out to be rather complex!`

    # Remove s94B flag
    When I switch to be a `Case Officer`
    When I select the `Remove a flag` Next step
    Then I am on the `Remove a flag` page
    And I should see the text `Select a flag to remove from the case`

    When I select `S94B Out of Country` from the `Type of flag` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `S94B Out of Country` in the `Type of flag` field

    When I click the `Remove flag` button
    Then I should see the text `You've removed the flag from this case`
    And I should see the text `What happens next`
    And I should see the text `This flag has been removed from the case. The case will proceed as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Remove a flag`

  @regression @flag-case @remove-flag @RIA-2513 @nightly-test
  Scenario: Remove flag from a case

    When I select the `Remove a flag` Next step

    Then I am on the `Remove a flag` page
    And The page is accessible
    And I should see the text `Select a flag to remove from the case`
    And I wait for 10 seconds
    When I select `Complex case` from the `Type of flag` field
    Then the `Continue` button is enabled
    And The page is accessible

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Complex case` in the `Type of flag` field

    When I click the `Remove flag` button
    Then I should see the text `You've removed the flag from this case`
    And The page is accessible
    And I should see the text `What happens next`
    And I should see the text `This flag has been removed from the case. The case will proceed as usual.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Remove a flag`
    And The page is accessible

    # When I click the `Overview` tab
    Then I should not see the text `Flags`
    And The page is accessible
    And I should not see the text `These flags are only visible to the Tribunal.`
    And I should not see the text `Oh no! This case turned out to be rather complex!`
