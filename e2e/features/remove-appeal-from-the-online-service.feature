Feature: Move appeal offline

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

  @regression @move-appeal @RIA-1147 @RIA-1500
  Scenario: Remove appeal from the online service

    When I remove the appeal from online service
    Then I should see an alert confirming the case `has been updated with event: Move appeal offline`

    When I click the `Overview` tab
    And I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `Do this next`
    And I should see the text `Check that you've:`
    And I should see the text `1. Contacted the appellant and the respondent to inform them that the case will proceed offline.`
    And I should see the text `2. Save All files associated with the appeal to the shared drive.`
    And I should see the text `3. Email the link to the saved files with the appeal reference number to: BAUArnhemHouse@justice.gov.uk`
    And I should see the text `The case will then proceed offline`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I click the `Case notes` tab
    Then I should not see the `Add case note` link

    When I click the `Applications` tab
    Then I should not see the `Record an application` link

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `The case will proceed offline.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Legal Rep`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `This case will now proceed offline. The Tribunal will contact you to explain the next steps.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `This case will now proceed offline. The Tribunal will contact you to explain the next steps.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `This case will now proceed offline. The Tribunal will contact you to explain the next steps.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `This case will now proceed offline. The Tribunal will contact you to explain the next steps.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `This case will now proceed offline. The Tribunal will contact you to explain the next steps.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Judge`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealRemoved` case progress image
    And I should see the text `What happens next`
    And I should see the text `The case will proceed offline.`
    And I should see the appeal removed from the online service details
    And I should see the case details
    And I should see the legal representative details