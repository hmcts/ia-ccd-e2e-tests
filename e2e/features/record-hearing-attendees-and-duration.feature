Feature: Record hearing attendees and duration

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons
    And I prepare decision and reasons
    And I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the `Overview` page

  @regression @record-hearing-attendees @RIA-572 @RIA-1903
  Scenario: Record hearing attendees and duration

    When I click the `Record attendees and duration` link
    Then I am on the `Record attendees and duration` page

    When I type `Judge Judy` for the `The judge` field
    And I type `Frank` for the `The appellant (Optional)` field
    And I type `Geoff` for the `The appellant's legal representative (Optional)` field
    And I type `Sebastian` for the `The Home Office representative (Optional)` field
    And I type `2` for the `Hours` field
    And I type `30` for the `Minutes` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Judge Judy` for the `The judge` field
    And I should see `Frank` for the `The appellant` field
    And I should see `Geoff` for the `The appellant's legal representative` field
    And I should see `Sebastian` for the `The Home Office representative` field
    And I should see `2` for the `Hours` field
    And I should see `30` for the `Minutes` field

    When I click the `Save details` button
    Then I should see the text `You have recorded the attendees and duration of the hearing`
    And I should see the text `What happens next`
    And I should see the text `The judge will record the decision and reasons.`
    And I should see the text `You don't need to do anything more with this case.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Record attendees and duration`
    And I click the `Hearing and appointment` tab
    And I should see the `Hearing` page
    And I should see the `Hearing attendance` field
    And I should see `Judge Judy` for the `The judge` field
    And I should see `Frank` for the `The appellant` field
    And I should see `Geoff` for the `The appellant's legal representative` field
    And I should see `Sebastian` for the `The Home Office representative` field
    And I should see `2` for the `Hours` field
    And I should see `30` for the `Minutes` field
