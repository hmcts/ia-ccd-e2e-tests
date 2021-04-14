Feature: Remote hearing - TCW and Judge update hearing requirements & update hearing adjustments

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

  @RIA-3721 @remote-hearing @remote-hearing-update-hearing-requirements-and-adjustments-with-yes @RIA-3721-tcw-all-yes
  Scenario: Remote hearing - TCW updates (all no) hearing requirements and hearing adjustments (with all yes)

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I switch to be a `Case Officer`
    And I update hearing requirements with all yes

    ## Update hearing adjustments:
    And I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page

    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `Yes` in the `Do you need interpreter services on the day?` field
    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    Then I select `5 hours` for the `Length` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`
    And I should see `Yes` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should see the text `Tribunal response`
    And I type `Remote hearing requirement will be reviewed - updated` for the `Remote hearing` field
    And I click the `Continue` button
    And I should see the text `Adjustment request`
    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    And I should see the text `Tribunal response`
    And I type `Physical or mental health conditions will be reviewed - updated` for the `Adjustments to accommodate vulnerabilities` field
    And I click the `Continue` button
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    And I should see the text `Tribunal response`
    And I type `Multimedia equipment requirement will be reviewed - updated` for the `Multimedia equipment` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I type `Single sex court requirement will be reviewed - updated` for the `Single-sex court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs an in camera court.` field
    And I type `Private hearing requirement will be reviewed - updated` for the `In camera court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I type `Additional adjustments requirement will be reviewed - updated` for the `Other adjustments` field
    And I click the `Continue` button

    When I click the `Update` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Update hearing adjustments`
    And I should see the `Overview` page
    And I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You must create a case summary for the judge to use at the hearing.`
    And I should see the text `Create case summary`

    When I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments yes path
    And I should see `Remote hearing requirement will be reviewed - updated` in the `Remote hearing` field
    And I should see `Multimedia equipment requirement will be reviewed - updated` in the `Multimedia equipment` field
    And I should see `Single sex court requirement will be reviewed - updated` in the `Single-sex court` field
    And I should see `Private hearing requirement will be reviewed - updated` in the `In camera court` field
    And I should see `Physical or mental health conditions will be reviewed - updated` in the `Adjustments to accommodate vulnerabilities` field
    And I should see `Additional adjustments requirement will be reviewed - updated` in the `Other adjustments` field
    And I should see the text `Dates to avoid`
    And I should see the text `Record of requirements and requests`
    And I should see the text `Requirements and requests`

  @RIA-3721 @remote-hearing @remote-hearing-update-hearing-requirements-and-adjustments-with-no @RIA-3721-tcw-all-no
  Scenario: Remote hearing - TCW updates (all yes) hearing requirements and hearing adjustments (with all no)

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I switch to be a `Case Officer`
    And I update hearing requirements with all no

    ## Update hearing adjustments:
    And I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page

    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    Then I select `5 hours` for the `Length` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`
    And I should see `No` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should see the text `Tribunal response`
    And I type `Nothing to add` for the `Remote hearing` field
    And I click the `Continue` button
    And I should see the text `Adjustment request`
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

    When I click the `Update` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Update hearing adjustments`
    And I should see the `Overview` page
    And I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You must create a case summary for the judge to use at the hearing.`
    And I should see the text `Create case summary`

    When I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments no path
    And I should see `Nothing to add` in the `Remote hearing` field
    And I should not see the `Multimedia equipment` field
    And I should not see the `Single-sex court` field
    And I should not see the `In camera court` field
    And I should not see the `Adjustments to accommodate vulnerabilities` field
    And I should not see the `Other adjustments` field
    And I should not see the text `Dates to avoid`
    And I should see the text `Record of requirements and requests`
    And I should see the text `Requirements and requests`

  @RIA-3721 @remote-hearing @remote-hearing-update-hearing-requirements-and-adjustments-with-yes @RIA-3721-judge-all-yes
  Scenario: Remote hearing - Judge updates (all no) hearing requirements and hearing adjustments (with all yes)

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I switch to be a `Judge`
    And I update hearing requirements with all yes

    ## Update hearing adjustments:
    And I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page

    And I should see `Yes` in the `Will the appellant attend the hearing?` field
    And I should see `Yes` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `Yes` in the `Will any witnesses attend the hearing?` field
    And I should see `Yes` in the `Do you need interpreter services on the day?` field
    And I should see `Yes` in the `Do you need a hearing room with step-free access?` field
    And I should see `Yes` in the `Do you need a hearing loop?` field
    Then I select `5 hours` for the `Length` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`
    And I should see `Yes` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should see the text `Tribunal response`
    And I type `Remote hearing requirement will be reviewed - updated` for the `Remote hearing` field
    And I click the `Continue` button
    And I should see the text `Adjustment request`
    And I should see `Yes` in the `Does the appellant have any physical or mental health issues that may impact them on the day?` field
    And I should see `The appellant is deaf in one ear` in the `Explain in detail how any physical or mental health issues may affect them on the day.` field
    And I should see the text `Tribunal response`
    And I type `Physical or mental health conditions will be reviewed - updated` for the `Adjustments to accommodate vulnerabilities` field
    And I click the `Continue` button
    And I should see `Yes` in the `Do you have multimedia evidence?` field
    And I should see `The appellant has a video recording on a memory stick which needs to be played on a computer` in the `You should provide the equipment to play this evidence. If this is not possible, explain why and what equipment you'll need to play it.` field
    And I should see the text `Tribunal response`
    And I type `Multimedia equipment requirement will be reviewed - updated` for the `Multimedia equipment` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need a single-sex court?` field
    And I should see `All female` in the `What type of court do they need?` field
    And I should see `The appellant is fearful of men` in the `Explain in detail why the appellant needs a single-sex court.` field
    And I type `Single sex court requirement will be reviewed - updated` for the `Single-sex court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Does the appellant need an in camera court?` field
    And I should see `The appellant is afraid of the general public` in the `Explain in detail why the appellant needs an in camera court.` field
    And I type `Private hearing requirement will be reviewed - updated` for the `In camera court` field
    And I click the `Continue` button
    And I should see `Yes` in the `Is there anything else you would like to request?` field
    And I should see `The appellant would like fresh orange juice and doughnuts` in the `Provide details of any additional requests and why they are necessary.` field
    And I type `Additional adjustments requirement will be reviewed - updated` for the `Other adjustments` field
    And I click the `Continue` button

    When I click the `Update` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Update hearing adjustments`
    And I should see the `Overview` page
    And I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`

    When I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments yes path
    And I should see `Remote hearing requirement will be reviewed - updated` in the `Remote hearing` field
    And I should see `Multimedia equipment requirement will be reviewed - updated` in the `Multimedia equipment` field
    And I should see `Single sex court requirement will be reviewed - updated` in the `Single-sex court` field
    And I should see `Private hearing requirement will be reviewed - updated` in the `In camera court` field
    And I should see `Physical or mental health conditions will be reviewed - updated` in the `Adjustments to accommodate vulnerabilities` field
    And I should see `Additional adjustments requirement will be reviewed - updated` in the `Other adjustments` field
    And I should see the text `Dates to avoid`
    And I should see the text `Record of requirements and requests`
    And I should see the text `Requirements and requests`

  @RIA-3721 @remote-hearing @remote-hearing-update-hearing-requirements-and-adjustments-with-no @RIA-3721-judge-all-no
  Scenario: Remote hearing - Judge updates (all yes) hearing requirements and hearing adjustments (with all no)

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I switch to be a `Judge`
    And I update hearing requirements with all no

      ## Update hearing adjustments:
    And I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page

    And I should see `No` in the `Will the appellant attend the hearing?` field
    And I should see `No` in the `Will the appellant give oral evidence at the hearing?` field
    And I should see `No` in the `Will any witnesses attend the hearing?` field
    And I should see `No` in the `Do you need interpreter services on the day?` field
    And I should see `No` in the `Do you need a hearing room with step-free access?` field
    And I should see `No` in the `Do you need a hearing loop?` field
    Then I select `5 hours` for the `Length` field
    And I click the `Continue` button
    And I should see the text `Additional adjustments`
    And I should see the text `Check if the appellant has requested any additional adjustments and record your response in the relevant field.
    And I should see the text `Do not enter the reason the appellant made the request.`
    And I should see the text `The respondent will be able to see this information and must not be informed of the appellant's personal circumstances.`
    And I should see the text `Adjustment request`
    And I should see `No` in the `Is there anything you'd like the Tribunal to consider when deciding if a video call is suitable?` field
    And I should see the text `Tribunal response`
    And I type `Nothing to add` for the `Remote hearing` field
    And I click the `Continue` button
    And I should see the text `Adjustment request`
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

    When I click the `Update` button
    Then I should see the text `You've recorded the agreed hearing adjustments`
    And I should see the text `What happens next`
    And I should see the text `The listing team will now list the case. All parties will be notified when the Hearing Notice is available to view.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Update hearing adjustments`
    And I should see the `Overview` page
    And I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`

    When I click the `Hearing and appointment` tab
    Then I should not see the requests for additional adjustments no path
    And I should see `Nothing to add` in the `Remote hearing` field
    And I should not see the `Multimedia equipment` field
    And I should not see the `Single-sex court` field
    And I should not see the `In camera court` field
    And I should not see the `Adjustments to accommodate vulnerabilities` field
    And I should not see the `Other adjustments` field
    And I should not see the text `Dates to avoid`
    And I should see the text `Record of requirements and requests`
    And I should see the text `Requirements and requests`
