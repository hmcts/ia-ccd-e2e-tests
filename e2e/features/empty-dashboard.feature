Feature: Empty dashboard

  @empty-dashboard
  Scenario: A legal rep without any cases sees an empty dashboard

    Given I am signed in as a Legal Rep without any cases
    When I go to the Case List
    Then I should see a notification saying No cases found

    Given I click the Search link
    Then I click the Apply button
    Then I should see a notification saying No cases found
