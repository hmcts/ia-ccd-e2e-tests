Feature: Bails Send direction
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`

  @bails-full @nightly-test
  Scenario: List case via ILA
    When I switch to be a `Admin Officer Bails`
    Then I should see the text `Please Confirm location where Applicant is detained is correct, and they are held on immigration matters, before listing the case for hearing in List Assist.`
    When I select the `Confirm detention location` Next step
    Then I am on the `Confirm detention location` page
    And The page is accessible
    When I select `Yes` for the `Have you verified if the Applicant's place of detention is correct?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Yes` for the `Have you verified if the Applicant's place of detention is correct?` field
    When I click the `Submit` button
    Then I should see an alert confirming the case `has been updated with event: Confirm detention location`
    And I should see the text `You must now add any case flags for interpreter or hearing requirement.`
    # TODO this needs finishing off
    # When I click the `Hearings` tab
