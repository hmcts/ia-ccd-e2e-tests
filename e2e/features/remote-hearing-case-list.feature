Feature: Remote hearing during Submit hearing requirements

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

  @RIA-3720 @remote-hearing @record-agreed-hearing-remote-hearing-yes
  Scenario: Record agreed hearing requirements with 'Yes' option selected for Remote hearing

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`

    When I select the `List the case` Next step
    Then I am on the `List the case` page
    And I should see the option `Manchester` for the `Location` field
    And I should see the option `Taylor House` for the `Location` field
    And I should see the option `Newport` for the `Location` field
    And I should see the option `Bradford` for the `Location` field
    And I should see the option `North Shields` for the `Location` field
    And I should see the option `Birmingham` for the `Location` field
    And I should see the option `Hatton Cross` for the `Location` field
    And I should see the option `Remote hearing` for the `Location` field
    And I should see the option `30 minutes` for the `Length` field
    And I should see the option `1 hour` for the `Length` field
    And I should see the option `1 hour 30 minutes` for the `Length` field
    And I should see the option `2 hours` for the `Length` field
    And I should see the option `2 hours 30 minutes` for the `Length` field
    And I should see the option `3 hours` for the `Length` field
    And I should see the option `3 hours 30 minutes` for the `Length` field
    And I should see the option `4 hours` for the `Length` field
    And I should see the option `4 hours 30 minutes` for the `Length` field
    And I should see the option `5 hours` for the `Length` field
    And I should see the option `5 hours 30 minutes` for the `Length` field
    And I should see the option `6 hours` for the `Length` field

    When I type `LP/12345/2019` for the `Listing reference` field
    And I select `3 hours` for the `Length` field
    And I select `Remote hearing` for the `Location` field
    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Remote hearing` for the `Location` field
    And I should see `3 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 11:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: List the case`

    When I click the `Overview` tab
    Then I should see the `Overview` page
    And I should see the `Hearing details` field
    And I should see `Remote hearing` for the `Location` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `11:30:00 AM`

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Hearing details` field
    And I should see `Remote hearing` for the `Location` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `11:30:00 AM`

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
