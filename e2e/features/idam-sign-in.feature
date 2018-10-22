Feature: User authentication

  Scenario: Should show Sign In form instead of Case List when user has *not* signed in
    Given I am not signed in
    When I go to the Case List
    Then I should be redirected to the sign in page instead

  Scenario: Should show Case List after a user has signed in as a Case Officer
    Given I am signed in as a Case Officer
    When I go to the Case List
    Then I should see the Case List page
