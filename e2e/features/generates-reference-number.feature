Feature: Generates an appeal reference number when appeal is lodged

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @create-case @lodge-appeal @RIA-581
  Scenario: Generates appeal reference and display on case details tab (happy path)
    Given I click the Case details tab
    Then The Appeal reference number field should contain a value of length 13
