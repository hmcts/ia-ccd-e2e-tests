Feature: Bails Send direction
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`

  @bails-full @bail-nightly-test @fix-test
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
    When I click the `Hearings` tab
    Then I should see the text `Request a hearing`
    When I click the `Request a hearing` button
    Then I should see the text `Request a hearing for Harri Pugh`
    And The page is accessible
    When I click the `Continue` button
    Then I should see the text `Do you require any additional facilities?`
    And The page is accessible
    When I click the `Continue` button
    Then I should see the text `What stage is this hearing at?`
    And The page is accessible
    When I click the `Continue` button
    Then I should see the text `Participant attendance`
    And The page is accessible
    When I fill out the Participant attendance page
    And I click the `Continue` button
    Then I should see the text `What are the hearing venue details?`
    And The page is accessible
    When I fill out the hearing venue details page
    And I click the `Continue` button
    Then I should see the text `Do you want a specific judge?`
    And The page is accessible
    When I click the `Continue` button
    Then I should see the text `Length, date and priority level of hearing`
    And The page is accessible
    When I click the `Continue` button
    Then I should see the text `Enter any additional instructions for the hearing`
    And The page is accessible
    When I click the `Continue` button
    Then I should see the text `Check your answers before sending your request`
    And The page is accessible
    When I click the `Submit request` button
    Then I should see the text `Hearing request submitted`
    And I should see the text `Your hearing request will now be processed`
    When I click the `view the status of this hearing in the hearings tab` link
    Then I should see the hearings tab
    And I should see the text `Current and upcoming`

