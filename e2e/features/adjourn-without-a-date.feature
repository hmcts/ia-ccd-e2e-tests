Feature: Adjourn hearing without a date

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


  @RIA-2957 @RIA-2970
  Scenario: Case Officer adjourns hearing without a date
    When I select the `Adjourn hearing without a date` Next step
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Reasons for adjournment`
    And I should see the text `This will be visible to both parties`
    And the `Continue` button is disabled

    When I type `some reasons for adjournment` for the `Reasons for adjournment` field
    And I click the `Continue` button
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Check your answers`
    And I should see the text `Reasons for adjournment`
    And I should see the text `some reasons for adjournment`

    When I click the `Adjourn` button
    Then I should see the text `The hearing has been adjourned`
    And I should see the text `A new Notice of Hearing has been generated.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Adjourn hearing without a date`
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I click the `hearing tab` link
    Then I should see the `Hearing` page
    And I should see `Adjourned` for the `Appointment date and time` field
    And I should see `some reasons for adjournment` for the `Reasons for adjournment` field

    When I click the `Documents` tab
    Then within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I switch to be a `Legal Org User Rep A`
    Then I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I switch to be a `Home Office APC`
    Then I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I switch to be a `Home Office LART`
    Then I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I switch to be a `Home Office POU`
    Then I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see `Adjourned` for the `Appointment date and time` field
