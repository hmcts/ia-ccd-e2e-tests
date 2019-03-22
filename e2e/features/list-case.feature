Feature: List case

  @list-case @RIA-412
  Scenario: Listing the case produces a hearing notice (default manchester hearing centre)

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal in the Manchester area
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

    When I select the `List the case` Next step
    Then I am on the `List the case` page
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
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

    When I select `6 hours` for the `Length of hearing` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Hearing date and time` field
    And I click the `Continue` button

    When I type `Personal vulnerabilities...` for the `If the appellant says they have any personal vulnerabilities, state what these are and whether the tribunal will make any accommodations for them. (Optional)` field
    And I type `Multimedia equipment...` for the `If the appellant asked for any multimedia equipment, state what was requested and whether the tribunal can provide this equipment. (Optional)` field
    And I type `Single sex court...` for the `If the appellant asked for a single sex court, state which gender was requested and whether the tribunal can accommodate this. (Optional)` field
    And I type `In camera court...` for the `If the appellant asked for an in camera court, state whether the tribunal can accommodate this. (Optional)` field
    And I type `Other requests...` for the `If the appellant made any other requests, state what they asked for and whether the tribunal can accommodate their request. (Optional)` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `6 hours` for the `Length of hearing` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Hearing date and time` field

    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: List the case`
    And I see the open case

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @list-case @RIA-412
  Scenario: Listing the case produces a hearing notice (default taylor house hearing centre)

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

    When I select the `List the case` Next step
    Then I am on the `List the case` page

    When I select `6 hours` for the `Length of hearing` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Hearing date and time` field
    And I click the `Continue` button
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Taylor House` for the `Hearing centre` field
