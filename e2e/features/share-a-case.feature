Feature: Share a case
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @regression @share-a-case @happy-path
  Scenario: Share a case with another user
    When I click the `Overview` tab
    And I select the `Share case with colleague` Next step
    And I wait for Share case page to load
    And I choose `Legal Org User Rep B`
    And I complete the `Share a case check your answers` page
    When I switch to be a `Legal Org User Rep B`
    When I click the `Overview` tab
    And I should see the text `Do this next`
    And I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I click the `Appellant` tab
    And I should not see any case progress images
    And I should see the appellant's details
    And I should not see the decision fields
    And I click the `Documents` tab

    And I should see the `Appellant documents` field
    And within the `Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I click the `Directions` tab
    And I should see the `Directions` field
