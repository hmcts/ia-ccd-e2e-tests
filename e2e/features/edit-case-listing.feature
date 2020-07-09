Feature: Edit case listing

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

  @regression @edit-case-listing @RIA-362 @RIA-1380 @RIA-1654
  Scenario Outline: Edit the case listing

    When I switch to be a <username>
    And I select the `Edit case listing` Next step

    Then I am on the `Edit case listing` page
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
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

    When I select `3 hours` for the `Length of appointment` field
    And I select `Manchester` for the `Hearing centre` field
    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Appointment date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length of appointment` field
    And I should see `{$TODAY+14|D MMM YYYY}, 11:30:00 AM` for the `Appointment date and time` field

    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new hearing notice has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit case listing`

    When I click the `Overview` tab
    Then I should see the `Overview` page
    And I should see the `Hearing details` field
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length of appointment` field
    And I should see the text `11:30:00 AM`

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Hearing documents` collection's second item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    Examples:
    | username      |
    | Case Officer  |
    | Admin Officer |


