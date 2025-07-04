Feature: Address details are entered manually without using postcode lookup

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `What is the appellant's nationality?` page

  @regression @start-appeal @alternate @alternate @RIA-691
  Scenario: Start initial appeal application with a manually entered address

    Given I am on the `Appellant's address` page
    When I select `Yes` for the `Does the appellant have a postal address?` field
    And I click the `I can't enter a UK postcode` link
    And I type `11 Downing Street` for the `Building and Street` field
    And I type `London` for the `Town or City` field
    And I type `SW1A 2AB` for the `Postcode/Zipcode` field
    And I type `United Kingdom` for the `Country` field
    And I click the `Continue` button

    Given I complete the `The appellant's contact preference` page
    And I complete the `Type of appeal` page
    And I complete the `The grounds of your appeal` page
    And I complete the `New matters` page
    And I complete the `Other appeals` page
    And I complete the `Legal representative details` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I am on the `DRAFT` page

    When I click the `Appellant` tab
    Then I should see `Yes` for the `Does the appellant have a postal address?` field
    And within the `Address` fieldset, I should see `11 Downing Street` for the `Building and Street` field
    And within the `Address` fieldset, I should see `London` for the `Town or City` field
    And within the `Address` fieldset, I should see `SW1A 2AB` for the `Postcode/Zipcode` field
    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` field
