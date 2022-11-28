Feature: Record agreed hearing requirements


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

  @record-agreed-hearing-requirements-no-path @RIA-2022 @RIA-2051 @RIA-2277 @RIA-3555
  Scenario: Record hearing requirements with all NO options

    And I submit hearing requirements with all no

    When I switch to be a `Case Officer`
    Then I click the `Overview` tab
    And I should only see the `caseOfficer_reviewHearingRequirements.png` case progress image
    And I should see the text `You can view the hearing requirements and any requests for additional adjustments in the Hearing tab.`
    And I should see the text `You should contact the appellant if you need more information.`
    And I should see the text `You should then review and submit the hearing requirements and any additional adjustments.`

    And I click the review and submit link
    Then I should see the `Hearing requirements` page
    And I should see the text `Review the appellant's hearing requirements and select length of hearing.`
    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
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
    And I should see the text `Continue to see requests for additional adjustments.`

    Then I select `6 hours` for the `Length of appointment` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`


    And I record `false` for Remote hearing requirement will be reviewed
    And I should see `No` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I click the `Continue` button
    And I should see `No` in the `Do you have multimedia evidence?` field
    And I click the `Continue` button
    And I should see `No` in the `Does the appellant need a single-sex court?` field
    And I click the `Continue` button
    And I should see `No` in the `Does the appellant need an in camera court?` field
    And I click the `Continue` button
    And I should see `No` in the `Is there anything else you would like to request?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length of appointment` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Hearing requirements`

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_listing.png` case progress image
    And I should see the text `What happens next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`


    When I select the `Hearing requirements` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You've made an invalid request. The hearing requirements have already been reviewed.`

    When I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments no path
    Then I should see the agreed additional adjustments no path

    When I switch to be a `Legal Rep`
    And I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments no path
    Then I should see the agreed additional adjustments no path

    When I switch to be a `Admin Officer`
    And I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments no path
    Then I should see the agreed additional adjustments no path

  @record-agreed-hearing-requirements-yes-path @RIA-2022 @RIA-2051 @RIA-2277 @RIA-3555
  Scenario: Record hearing requirements with all YES options

    And I submit hearing requirements with all yes

    When I switch to be a `Case Officer`
    Then I click the `Overview` tab
    And I should only see the `caseOfficer_reviewHearingRequirements.png` case progress image
    And I should see the text `You can view the hearing requirements and any requests for additional adjustments in the Hearing tab.`
    And I should see the text `You should contact the appellant if you need more information.`
    And I should see the text `You should then review and submit the hearing requirements and any additional adjustments.`

    And I click the review and submit link
    Then I should see the `Hearing requirements` page

    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `Yes` in the `Do you need interpreter services on the day?` field
    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    Then I select `6 hours` for the `Length of appointment` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`

    And I record `true` for Remote hearing requirement will be reviewed

    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    And I should see the text `Tribunal response`
    And I type `Physical or mental health conditions will be reviewed` for the `Adjustments to accommodate vulnerabilities` field
    And I click the `Continue` button
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it. (Optional)` field
    And I should see the text `Tribunal response`
    And I type `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I type `Single sex court requirement will be reviewed` for the `Single-sex court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs an in camera court.` field
    And I type `Private hearing requirement will be reviewed` for the `In camera court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I type `Additional adjustments requirement will be reviewed` for the `Other adjustments` field
    And I click the `Continue` button

    When I click the `Submit` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Hearing requirements`

    And I click the `Overview` tab
    Then I should only see the `caseOfficer_listing.png` case progress image
    And I should see the text `What happens next`
    And I should see the text `The agreed hearing requirements and adjustments have been recorded.`
    And I should see the text `The listing team will now list the case.`

    When I select the `Hearing requirements` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `You've made an invalid request. The hearing requirements have already been reviewed.`

    When I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path

    When I switch to be a `Legal Rep`
    And I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments yes path
    Then I should see the agreed additional adjustments yes path

    When I switch to be a `Admin Officer`
    And I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
