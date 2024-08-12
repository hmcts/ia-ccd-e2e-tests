Feature: Submit appeal application for Home Office Validation flow

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @ho-validation @RIA-3271 @RIA-3408 @home-office-validation-tab-display-for-ho-reference
  Scenario: Home office validation tab for appeal submitted

    And I save my initial appeal with Home Office Reference/case ID `1212-0099-0062-8083`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `Review the appeal application form data and cross reference it with Home Office data. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    And I should see the text `Request respondent evidence`
    And I should see the text `The first column of information is sourced from the appeal application form, the second column of information is from Home Office records`

  @ho-validation @RIA-3545 @home-office-validation-tab-error-1010-display
  Scenario: Home office validation tab for appeal submitted but could not get appellant data from Home Office

    And I save my initial appeal with Home Office Reference/case ID `X00001010`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal because the Home Office Reference/case ID number does not have any matching appellant data in the system. You can contact the Home Office if you need more information to validate the appeal.`

  @ho-validation @RIA-3545 @home-office-validation-tab-error-1020-display
  Scenario: Home office validation tab for appeal submitted but no data found for HO reference in Home Office

    And I save my initial appeal with Home Office Reference/case ID `4545-0000-0100-1006`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The appellant’s Home Office Reference/case ID number could not be found. You can contact the Home Office to check the reference if you need this information to validate the appeal`

  @ho-validation @RIA-3545 @home-office-validation-tab-error-1030-display
  Scenario: Home office validation tab for appeal submitted but could not get appellant data from Home Office

    And I save my initial appeal with Home Office Reference/case ID `123123123`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal because the Home Office Reference/case ID number does not have any matching appellant data in the system. You can contact the Home Office if you need more information to validate the appeal.`

  @ho-validation @RIA-3545 @home-office-validation-tab-error-1060-display
  Scenario: Home office validation tab for appeal submitted but HO reference is entered incorrectly

    And I save my initial appeal with Home Office Reference/case ID `X00001060`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The appellant entered the Home Office Reference/case ID number incorrectly. You can contact the appellant to check the reference number if you need this information to validate the appeal`

  @ho-validation @RIA-3545 @home-office-validation-tab-error-more-than-30-display
  Scenario: Home office validation tab for appeal submitted but HO reference is more than 30 characters

    And I save my initial appeal with Home Office Reference/case ID `012345678901234567890123456789A`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The appellant entered the Home Office Reference/case ID number incorrectly. You can contact the appellant to check the reference number if you need this information to validate the appeal`

  @ho-validation @RIA-3545 @home-office-validation-tab-error-no-main-applicant-display
  Scenario: Home office validation tab for appeal submitted but Home Office response does not have a main applicant

    And I save my initial appeal with Home Office Reference/case ID `X00002222`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `Note: The service was unable to retrieve any appellant details from the Home Office because the Home Office data does not include a main applicant. You can contact the Home Office if you need this information to validate the appeal.`


  @ho-validation @RIA-3390 @home-office-validation-tab-error-1040-display
  Scenario: Home office validation tab for appeal submitted but could not get data from Home Office

    And I save my initial appeal with Home Office Reference/case ID `X00001040`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal.`
    And I should see the text `Request the Home Office information to try again. This may take a few minutes.`

  @ho-validation @RIA-3390 @home-office-validation-tab-error-1070-display
  Scenario: Home office validation tab for appeal submitted but could not get data from Home Office

    And I save my initial appeal with Home Office Reference/case ID `X00001070`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal.`
    And I should see the text `Request the Home Office information to try again. This may take a few minutes.`

  @ho-validation @RIA-3390 @home-office-validation-tab-error-2000-display-request-home-office-data
  Scenario: Home office validation tab for appeal submitted but could not get data from Home Office

    And I save my initial appeal with Home Office Reference/case ID `X00002000`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal.`
    And I should see the text `Request the Home Office information to try again. This may take a few minutes.`

    When I select the `Request Home Office data` Next step
    Then I am on the `Request Home Office data` page
    When I click the `Request Home Office data` button
    Then I am on the `Overview` page
    And I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal.`
    And I should see the text `Request the Home Office information to try again. This may take a few minutes.`

  @ho-validation @RIA-3390 @home-office-validation-tab-error-2010-display
  Scenario: Home office validation tab for appeal submitted but could not get data from Home Office

    And I save my initial appeal with Home Office Reference/case ID `X00002010`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `There is a problem`
    And I should see the text `The service has been unable to retrieve the Home Office information about this appeal.`
    And I should see the text `Request the Home Office information to try again. This may take a few minutes.`

  @ho-validation @RIA-3390 @home-office-validation-data-display-request-home-office-data-error
  Scenario: Home office validation tab is displayed with data. Error on request home office data event.

    And I save my initial appeal with Home Office Reference/case ID `1212-0099-0062-8083`
    And I submit my appeal
    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    When I click the `Validation` tab
    Then I should see the text `Appeal validation`
    And I should see the text `Review the appeal application form data and cross reference it with Home Office data. If the appeal looks valid, you must tell the respondent to supply their evidence.`
    And I should see the text `Request respondent evidence`
    And I should see the text `The first column of information is sourced from the appeal application form, the second column of information is from Home Office records`

    When I click the `Overview` tab
    And I select the `Request Home Office data` Next step
    Then I should see an error in summary saying `The Home Office data has already been retrieved successfully and is available in the validation tab.`


