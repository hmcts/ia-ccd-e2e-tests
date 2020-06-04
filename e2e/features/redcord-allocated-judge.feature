Feature: Record allocated Judge

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
    And I send decision and reasons
    And I switch to be a `Legal Rep`
    And I submit FTPA Appellant appeal
    And I switch to be a `Admin Officer`

  @record-allocated-judge @RIA-2520
  Scenario: Record allocated Judge

    When I click the `Overview` tab
    Then I should see the `Overview` page
    And I should see the image `ftpaInProgress.png`
    And I should see the text `Do this next`
    And I should see the text `Assign the application to a judge then record the judge's name.`
    And I should see the `record the judge's name` link

    When I click the `record the judge's name` link
    Then I should see the text `Record allocated Judge`
    And I should see the text `Only record this after the Judge has been notified.`

    When I type `Judge nr 1` for the `Judge assigned to the application` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Judge nr 1` in the `Judge assigned to the application` field

    When I click the `Submit` button
    Then I should see the text `You've recorded which judge is dealing with the application`
    And I should see the text `What happens next`
    And I should see the text `The judge will consider the application.`

    When I click the `Close and Return to case details` button
    And I click the `FTPA` tab

    Then I should see the text `Tribunal notes`
    And I should see the text `These notes are only visible to the Tribunal.`
    And I should see `Judge nr 1` for the `Judge assigned to the application` field

    When I select the `Record allocated Judge` Next step
    Then I should see the text `Record allocated Judge`
    And I should see the text `Only record this after the Judge has been notified.`
    And I should see `Judge nr 1` for the `Judge assigned to the application` field

    When I type `Judge nr 2` for the `Judge assigned to the application` field
    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Judge nr 2` in the `Judge assigned to the application` field

    When I click the `Submit` button
    And I click the `Close and Return to case details` button
    And I click the `FTPA` tab

    Then I should see `Judge nr 2` for the `Judge assigned to the application` field
    And I should see the text `Judge nr 1`
