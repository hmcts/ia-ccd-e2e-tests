Feature: List case and edit case listing after agreed hearing requirements stage


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

  @RIA-2011 @list-case-after-agreed-hearing-req
  Scenario: Submit hearing requirements with 'Yes' options selected

    When I switch to be a `Admin Officer`
    And I click the `Hearing` tab
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`


    When I click the `Overview` tab
    Then I should only see the `caseOfficer_listing` case progress image

    And I should see the text `Do this next`
    And I should see the text `The agreed hearing requirements and dates to avoid are available to view in the Hearing tab.`
    And I should see the text `When the case has been listed in Aria, you should list the case here.`
    And I click the `list the case here` link

    Then I am on the `List the case` page
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
    And I should see the option `30 minutes` for the `Length of hearing` field
    And I should see the option `1 hour` for the `Length of hearing` field
    And I should see the option `1 hour 30 minutes` for the `Length of hearing` field
    And I should see the option `2 hours` for the `Length of hearing` field
    And I should see the option `2 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `3 hours` for the `Length of hearing` field
    And I should see the option `3 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `4 hours` for the `Length of hearing` field
    And I should see the option `4 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `5 hours` for the `Length of hearing` field
    And I should see the option `5 hours 30 minutes` for the `Length of hearing` field
    And I should see the option `6 hours` for the `Length of hearing` field

    When I type `LP/12345/2019` for the `Listing reference` field
    And I select `6 hours` for the `Length of hearing` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Hearing date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `6 hours` for the `Length of hearing` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Hearing date and time` field
    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`
    And I click the `Close and Return to case details` button

    # edit case listing
    When I select the `Edit case listing` Next step
    Then I am on the `Edit case listing` page
    And I select `Manchester` for the `Hearing centre` field
    And I select `3 hours` for the `Length of hearing` field
    And I select `{$TODAY+14|DD-MM-YYYY} 12:30:00` for the `Hearing date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length of hearing` field
    And I should see `{$TODAY+14|D MMM YYYY}, 12:30:00 PM` for the `Hearing date and time` field
    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new hearing notice has been generated. All parties will be notified by email.`
    And I click the `Close and Return to case details` button




