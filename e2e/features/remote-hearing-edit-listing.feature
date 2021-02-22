Feature: Remote Hearing / Hearing Centre location transfers during edit listing

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

  @RIA-3722 @remote-hearing @hearing-centre-to-remote-hearing
  Scenario: List the case with a Hearing Centre (Taylor House) location and re-list as a Remote Hearing

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case
    And I relist the case as a remote hearing
    And I click the `Overview` tab
    And I should see the `Overview` page
    And I should see `Remote hearing` for the `Location` field
    And I click the `Hearing and appointment` tab
    And I should see the `Hearing and appointment` page
    And I should see `Remote hearing` for the `Location` field

  @RIA-3722 @remote-hearing @remote-hearing-to-hearing-centre
  Scenario: List the case as a Remote Hearing and re-list to a Hearing Centre (Taylor House) location

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I relist the case with length of hearing as `2` hours
    And I click the `Overview` tab
    And I should see the `Overview` page
    And I should see `Taylor House` for the `Location` field
    And I click the `Hearing and appointment` tab
    And I should see the `Hearing and appointment` page
    And I should see `Taylor House` for the `Location` field

  @RIA-3722 @remote-hearing @remote-hearing-to-remote-hearing
  Scenario: List the case as a Remote Hearing and re-list as a Remote Hearing

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I relist the case as a remote hearing
    And I click the `Overview` tab
    And I should see the `Overview` page
    And I should see `Remote hearing` for the `Location` field
    And I should see `{$TODAY+16|D MMM YYYY}, 11:45:00 AM` for the `Date and time` field
    And I should see `3 hours` for the `Length` field
    And I click the `Hearing and appointment` tab
    And I should see the `Hearing and appointment` page
    And I should see `Remote hearing` for the `Location` field

  @RIA-3722 @remote-hearing @remote-hearing-to-remote-hearing-no-changes
  Scenario: List the case as a Remote Hearing and re-list as a Remote Hearing with no changes

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case as a remote hearing
    And I relist the case as a remote hearing with no changes
    And I click the `Overview` tab
    And I should see the `Overview` page
    And I should see `Remote hearing` for the `Location` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Date and time` field
    And I should see `6 hours` for the `Length` field
    And I click the `Hearing and appointment` tab
    And I should see the `Hearing and appointment` page
    And I should see `Remote hearing` for the `Location` field



