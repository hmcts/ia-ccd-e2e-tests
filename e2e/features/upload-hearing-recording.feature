Feature: Upload hearing recording

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
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons
    And I generate decision and reasons
    And I switch to be a `Admin Officer`

  @record-hearing-recording @RIA-2620
  Scenario: Upload hearing recording

    When I select the `Upload hearing recording` Next step
    Then I am on the `Upload hearing recording` page

    When I add an item to the `Hearing recordings` collection

    And within the `Hearing recordings` collection's first item, I upload `{@HearingRecording.mp3}` for the `Audio file` field
    And within the `Hearing recordings` collection's first item, I type `some description` for the `Describe the file` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `some description` for the `Describe the file` field
    And I should see `HearingRecording.mp3` for the `Audio file` field

    When I click the `Upload` button

    Then I should see the text `You’ve uploaded the hearing recording`
    And I should see the text `What happens next`
    And I should see the text `This file is now available in the Documents tab and the Hearing tab.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: Upload hearing recording`

    When I click the `Documents` tab


    And within the `Hearing recordings` collection's first item, I should see `HearingRecording.mp3` in the `Audio file` field
    And within the `Hearing recordings` collection's first item, I should see `some description` for the `Describe the file` field

    And I switch to be a `Case Officer`

    When I click the `Documents` tab


    And within the `Hearing recordings` collection's first item, I should see `HearingRecording.mp3` in the `Audio file` field
    And within the `Hearing recordings` collection's first item, I should see `some description` for the `Describe the file` field
