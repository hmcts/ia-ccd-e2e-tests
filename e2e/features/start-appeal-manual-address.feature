Feature: Address details are entered manually without using postcode lookup

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page

  @start-appeal @alternate @alternate @RIA-691
  Scenario: Start initial appeal application with a manually entered address

    Given I am on the `Your client's address` page
    When I select `Yes` for the `Does the appellant have a fixed address?` field
    And I click the `I can't enter a UK postcode` link
    And I type `11 Downing Street` for the `Building and Street` field
    And I type `London` for the `Town or City` field
    And I type `SW1A 2AB` for the `Postcode/Zipcode` field
    And I type `United Kingdom` for the `Country` field
    And I click the `Continue` button

    Given I complete the `What type of decision is your client appealing against?` page
    And I complete the `On which grounds will you build your appeal?` page
    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Your own reference number` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    And I am on the `DRAFT` page

    When I click the `Case details` tab
    Then I should see `Yes` for the `Does the appellant have a fixed address?` field
    And within the `Address` fieldset, I should see `11 Downing Street` for the `Building and Street` field
    And within the `Address` fieldset, I should see `London` for the `Town or City` field
    And within the `Address` fieldset, I should see `SW1A 2AB` for the `Postcode/Zipcode` field
    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` field
