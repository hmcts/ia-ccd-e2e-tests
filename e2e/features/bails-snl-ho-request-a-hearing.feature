Feature: Bails SNL Hearing request as Home Office User
  Background:
    Given I am signed in as a `Home Office Bails`
    And I create a new bail application
    And I save my initial application as a `Home Office Bails` for a Immigration removal centre detention with one financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Home Office Bails`

  @submit-bail-application-home-office @bails-full @bails-regression @bail-nightly-test
  Scenario: Bails Hearing request as as Home Office
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
    When I select the `Create Flag` Next step
    And I have created a `Urgent case` Flag in `Case level`
    When I select the `Create Flag` Next step
    And I have created a `Language Interpreter` Flag in `Harri Pugh` and language name is `Korean`
    When I select the `Create Flag` Next step
    And I have created a `Reasonable adjustment` Flag in `Harri Pugh` and signlanguage name is `British Sign Language (BSL)`
    When I select the `Create Flag` Next step
    And I have created a `Language Interpreter` Flag in `John Smith` and language name is `Telugu`
    When I select the `Create Flag` Next step
    And I have created a `Reasonable adjustment` Flag in `John Smith` and signlanguage name is `British Sign Language (BSL)`

    ##Hearing Request
    When I goto the `Hearings` tab
    And I click the `Request a hearing` button
    And I should see the text `Hearing requirements`
    And I should see the text `Any reasonable adjustments on this page will be included in the hearing request.`
    When I click the `Continue` button
    And I should see the text `Do you require any additional facilities?`
    When I click the `Continue` button
    And I click the `Bail` button
    And I click the `Continue` button
    And I should see the text `Participant attendance`
    And I select how each of the 3 participants will attend the hearing
    And I click the `Continue` button
    And I add the `Hatton Cross` bail hearing location
    And I click the `Continue` button
    And I should see the text `Do you want a specific judge?`
    And I click the `Continue` button
    And I should see the text `Length, date and priority level of hearing`
    And I click the `Continue` button
    And I should see the text `Enter any additional instructions for the hearing`
    And I click the `Continue` button
    And I should see the text `Check your answers before sending your request`
    And I click the `Submit request` button
    And I should see the text `Hearing request submitted`