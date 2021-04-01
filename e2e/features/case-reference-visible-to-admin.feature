Feature: Remote hearing during Submit hearing requirements

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes

  @RIA-3996 @case-reference-visible-to-admin
  Scenario: Submit hearing requirements with 'Yes' option selected for Remote hearing

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should not see the text `Online case reference number`

    When I click the `Overview` tab
    Then I should not see the text `Online case reference number`

    When I click the `Appeal` tab
    Then I should not see the text `Online case reference number`

    When I click the `Appellant` tab
    Then I should not see the text `Online case reference number`

    When I switch to be a `Case Officer`
    Then I should not see the text `Online case reference number`

    When I click the `Overview` tab
    Then I should not see the text `Online case reference number`

    When I click the `Appeal` tab
    Then I should not see the text `Online case reference number`

    When I click the `Appellant` tab
    Then I should not see the text `Online case reference number`

    When I switch to be a `Admin Officer`
    Then I click the `Hearing and appointment` tab
    And I should see the text `Online case reference number`

    When I click the `Overview` tab
    Then I should see the text `Online case reference number`

    When I click the `Appeal` tab
    Then I should see the text `Online case reference number`

    When I click the `Appellant` tab
    Then I should see the text `Online case reference number`


