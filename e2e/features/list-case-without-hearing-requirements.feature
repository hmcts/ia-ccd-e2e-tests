Feature: Case Officer: List case without hearing requirements

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

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    When I select the `Submit hearing requirements` Next step
    Then I should see the text `Submit hearing requirements`
    And I should see the text `If the appellant needs interpreter services, step-free access or a hearing loop, these will be provided.`
    And I should see the text `You'll also be able to request additional adjustments based on the appellant's personal circumstances. The tribunal will review these and decide whether a request can be granted.`


  @RIA-2041 @list-case-without-hearing-req
  Scenario: List case without hearing requirements

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should see the `Overview` page
    And I should only see the `caseOfficer_submitHearingRequirements` case progress image
    And I should see the text `What happens next`
    And I should see the text `The appellant has been directed to submit their hearing requirements.`
    And I should see the text `If the appellant does not comply by the date indicated in the direction, you can proceed to a hearing without requirements.`

    When I select the `List without requirements` Next step
    Then I should see the text `List without requirements`
    And I should see the option `30 minutes` for the `Length of appointment` field
    And I should see the option `1 hour` for the `Length of appointment` field
    And I should see the option `1 hour 30 minutes` for the `Length of appointment` field
    And I should see the option `2 hours` for the `Length of appointment` field
    And I should see the option `2 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `3 hours` for the `Length of appointment` field
    And I should see the option `3 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `4 hours` for the `Length of appointment` field
    And I should see the option `4 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `5 hours` for the `Length of appointment` field
    And I should see the option `5 hours 30 minutes` for the `Length of appointment` field
    And I should see the option `6 hours` for the `Length of appointment` field
    And I select `6 hours` for the `Length of appointment` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length of appointment` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I click the `Close and Return to case details` button
    Then I should see the `Overview` page
    And I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`
    And I should not see the option `List without requirements` for the `Next step` field

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `6 hours` for the `Length of appointment` field
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the hearing requirements yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    # Legal rep
    When I switch to be a `Legal Rep`
    And I click the `Overview` tab

    Then I should only see the `progress_legalRep_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have not submitted any hearing requirements on behalf of the appellant.`
    And I should see the text `The case is now being listed without hearing requirements and the Notice of Hearing will be sent to both parties.`

    And I should not see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `6 hours` for the `Length of appointment` field
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the hearing requirements yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`


    # Admin Officer
    When I switch to be a `Admin Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_listing` case progress image
    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`

    And I click the `list the case here` link
    Then I am on the `List the case` page
    And I should see `6 hours` in the `Length of appointment` field
    When I type `LP/12345/2019` for the `Listing reference` field
    And I select `5 hours` for the `Length of appointment` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Appointment date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `5 hours` for the `Length of appointment` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I click the `Cancel` link

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `6 hours` for the `Length of appointment` field
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the hearing requirements yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`
