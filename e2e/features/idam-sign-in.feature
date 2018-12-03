Feature: User authentication

  Scenario: Should show Sign In form instead of Case List when user has *not* signed in
    Given I am not signed in
    When I attempt to go to the `Case List`
    Then I should be redirected to the `Sign In` page instead

  Scenario Outline: Should show Case List after a user has signed in as a Case Officer
    Given I am signed in as a <persona>
    When I go to the `Case List`
    Then I should see the `Case List` page
    And I should see the username <username>

    Examples:
      | persona      | username     |
      | Case Officer | Case Officer |
      | Legal Rep    | Lawfirm A    |

  Scenario: Should only show cases related to that Legal Representative

    Given I am signed in as `Legal Rep A`
    And I create a new case
    And I save my initial appeal

    Given I am signed in as `Legal Rep B` without any cases
    When I go to the `Case List`
    Then I should see a notification saying `No cases found`
    When I click the `Search` link
    And I click the `Apply` button
    Then I should see a notification saying `No cases found`
