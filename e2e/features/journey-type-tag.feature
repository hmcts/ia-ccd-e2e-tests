Feature: Journey type tag

  @aip-case-progression
  Scenario: A Case officer sees Appellant in person tag on overview page
    Given An appellant has submitted an appeal
    And I am signed in as a `Case Officer`
    When I am viewing the appellant's case
    Then I see the 'Appellant in person' tag

  @RIA-2736
  Scenario: A Case officer sees Legally Represented tag on overview page
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    When I switch to be a `Case Officer`
    And I should see `Legally Represented` tag
