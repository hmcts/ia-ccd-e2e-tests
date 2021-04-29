Feature: Home Office all overview tabs from listing to decision state

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


  @regression @home-office-all-overview-tabs @RIA-1709 @RIA-2236
  Scenario: All Home Office users see listing overview tab

    # listing
    # APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `check that the Home Office response complies with the Procedural Rules and Practice Directions`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`

    And I should see the case details
    And I should not see the hearing details
    And I should see the legal representative details


    # listed (AO)
    And I switch to be a `Admin Officer`
    And I list the case

    # APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details


    # preHearing (CO)

    When I switch to be a `Case Officer`
    And I create case summary

    # APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should only see the `homeOffice_listed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The case has now been listed and the hearing details are ready to view in the Hearing tab.`
    And I should see the text `The Tribunal will generate the hearing bundle, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details


    # Generate hearing bundle (CO)
    When I switch to be a `Case Officer`
    And I generate the hearing bundle

    # APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should only see the `homeOffice_preHearing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The hearing bundle is ready to view in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details


    # decision (CO)
    When I switch to be a `Case Officer`
    And I start decision and reasons

    # APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should only see the `homeOffice_decision` case progress image

    And I should see the text `Do this next`
    And I should see the text `The Judge is writing up the Decision and Reasons document, you'll be notified when this is ready to view.`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # Decided (CO)
    When I switch to be a `Case Officer`
    And I prepare decision and reasons
    And I send decision and reasons

    # APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should only see the `appeal_allowed` case progress image

    And I should see the text `Do this next`
    And I should see the text `The appeal has been allowed. The Decision and Reasons document is available in the documents tab`

    And I should see the case details
    And I should see the hearing details
    And I should see the legal representative details


