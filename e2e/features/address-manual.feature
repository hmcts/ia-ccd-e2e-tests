Feature: Address details are entered manually without using postcode lookup

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page

  @create-case @save-application @alternate @RIA-691
  Scenario: Lodge an appeal application with a manually entered address

    Given I am on the Your client's address page
    When I select Yes for the Does the appellant have a fixed address? field
    And I click the I can't enter a UK postcode link
    And I type 11 Downing Street for the Building and Street field
    And I type London for the Town or City field
    And I type SW1A 2AB for the Postcode/Zipcode field
    And I type United Kingdom for the Country field
    And I click the Continue button

    Given I complete the Why is your client appealing? page
    And I complete the New matters page
    And I complete the Has your client appealed against any other UK immigration decisions? page
    And I complete the Your own reference number page
    And I complete the lodge appeal Check your answers page
    And I close and return to case details

    When I click the Case details tab
    Then I should see Yes for the Does the appellant have a fixed address? field
    And Within the Address fieldset, I should see 11 Downing Street for the Building and Street field
    And Within the Address fieldset, I should see London for the Town or City field
    And Within the Address fieldset, I should see SW1A 2AB for the Postcode/Zipcode field
    And Within the Address fieldset, I should see United Kingdom for the Country field
