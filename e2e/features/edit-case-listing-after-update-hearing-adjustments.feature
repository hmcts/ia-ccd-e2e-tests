Feature: Admin Officer - Edit case listing after review update hearing requirements

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

  @RIA-2398 @edit-case-listing-after-update-hearing-adjustments
  Scenario: Admin Officer edit case listing after update hearing requirements with 'Yes' options selected

    ### prepare for hearing
    ## update hearing adjustments
    When I switch to be a `Case Officer`
    And I update hearing requirements with all yes
    And I record updated hearing requirements yes path

    ### Admin Officer - Relist the case after recording updated hearing requirements
    And I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `adminOfficer_listing_postRecordUpdatedRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing requirements and dates to avoid have been updated. They are now available to view in the Hearing tab.`
    And I should see the text `You must update the hearing requirements in Aria and relist if necessary. You should then relist the case or confirm the original listing here.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    And I click the `Hearing tab` link
    And I am on the `Hearing` page
    And I click the `Overview` tab

    When I click the `relist the case or confirm the original listing here` link
    Then I am on the `Edit case listing` page
    And I click the `Cancel` link
    And I relist the case with length of hearing as `5` hours
    And I should see the `Overview` page
    And I should only see the `caseOfficer_prepareForHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Notice of Hearing will be sent to all parties.`


    ### final bundling
    When I switch to be a `Case Officer`
    And I create case summary
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_finalBundling` case progress image

    ## update hearing adjustments
    When I switch to be a `Case Officer`
    And I update hearing requirements with all yes
    And I record updated hearing requirements yes path

    ### Admin Officer - Relist the case after recording updated hearing requirements
    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `adminOfficer_listing_postRecordUpdatedRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing requirements and dates to avoid have been updated. They are now available to view in the Hearing tab.`
    And I should see the text `You must update the hearing requirements in Aria and relist if necessary. You should then relist the case or confirm the original listing here.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `relist the case or confirm the original listing here` link
    Then I am on the `Edit case listing` page
    And I click the `Cancel` link
    And I relist the case with length of hearing as `3` hours

    And I should see the `Overview` page
    And I should only see the `caseOfficer_finalBundling` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will generate a hearing bundle for all parties to use at the hearing.`


    ### Pre Hearing
    When I switch to be a `Case Officer`
    And I generate the hearing bundle
    And I click the `Overview` tab

    And I should see the `Overview` page
    And I should only see the `caseOfficer_preHearing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You can start to create the decision and reasons document.`
    And I should see the text `Start decision and reasons`

    ## update hearing adjustments
    And I update hearing requirements with all yes
    And I record updated hearing requirements yes path

    ### Admin Officer - Relist the case after recording updated hearing requirements
    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `adminOfficer_listing_postRecordUpdatedRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing requirements and dates to avoid have been updated. They are now available to view in the Hearing tab.`
    And I should see the text `You must update the hearing requirements in Aria and relist if necessary. You should then relist the case or confirm the original listing here.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `relist the case or confirm the original listing here` link
    Then I am on the `Edit case listing` page
    And I click the `Cancel` link
    And I relist the case with length of hearing as `3` hours

    And I should see the `Overview` page
    And I should only see the `caseOfficer_preHearing` case progress image
    And I should see the text `What happens next`
    And I should see the text `The Tribunal Caseworker will generate the Decision and Reasons document.`


    ### Decision
    When I switch to be a `Case Officer`
    And I start decision and reasons
    And I click the `Overview` tab

    And I should see the `Overview` page
    And I should only see the `caseOfficer_decision` case progress image

    ## update hearing adjustments
    And I update hearing requirements with all yes
    And I record updated hearing requirements yes path

    ### Admin Officer - Relist the case after recording updated hearing requirements
    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should only see the `adminOfficer_listing_postRecordUpdatedRequirements` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing requirements and dates to avoid have been updated. They are now available to view in the Hearing tab.`
    And I should see the text `You must update the hearing requirements in Aria and relist if necessary. You should then relist the case or confirm the original listing here.`

    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    When I click the `relist the case or confirm the original listing here` link
    Then I am on the `Edit case listing` page
    And I click the `Cancel` link
    And I relist the case with length of hearing as `3` hours

    And I should see the `Overview` page
    And I should only see the `caseOfficer_decision` case progress image
    And I should see the text `Do this next`
    And I should see the text `Record the attendees and duration of the hearing.`
    And I should see the text `Record attendees and duration`
