Feature: Complete the appeal application online

  @RIA-585
  Scenario: Lodge an appeal application

    Given I am signed in as a Legal Rep
    When I click the Create new case button
    Then I should see the Create Case page
    When I click the Start button
    Then I should see the Basic details page

    Given I am on the Basic details page
    When I add a new item to the Nationality collection
    Then Within the Nationality collection, I select Finland for the first Nationality field
    Then I add another new item to the Nationality collection
    Then Within the Nationality collection, I select Iceland for the second Nationality field
    Then I select No for the My client's nationality is not agreed field
    Then I click the Continue button

    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created
    When I click the Case details tab
#    Then Within the Nationality collection, I should see Finland for the first Nationality field
#    Then I should see the Nationality row showing Iceland
    Then I should see No for the My client's nationality is not agreed field
