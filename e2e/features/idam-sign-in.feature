Feature: User authentication

  Scenario: Should show Sign In form instead of Case List when user has *not* signed in
    Given I am not signed in
    When I attempt to go to the `Case List`
    Then I should be redirected to the `Sign In` page instead

  @authentication
  Scenario Outline: Should show Case List after a user has signed in
    Given I am signed in as a <persona>
    When I go to the `Case List`
    Then I should see `/list/case` in the url
    And I should see `jurisdiction=IA` in the url
    And I should see `case-type=Asylum` in the url
    And I should see the username <username>

    Examples:
      | persona       | username      |
      | Case Officer  | Case Officer  |
      | Admin Officer | Admin Officer |
      | Legal Rep     | A Legal Rep   |

  Scenario: Should only show cases related to that Legal Representative

    Given I am signed in as `Legal Rep A`
    And I create a new case
    And I save my initial appeal

    Given I am signed in as another `Legal Rep` without any cases
    When I go to the `Case List`
    Then I should see a notification saying `No cases found`
    When I click the `Search` link
    And I click the `Apply` button
    Then I should see a notification saying `No cases found`
