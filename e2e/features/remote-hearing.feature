Feature: Remote hearing during Submit hearing requirements

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
    And I request hearing requirements

  @RIA-3718 @remote-hearing-yes
  Scenario: Submit hearing requirements with 'Yes' option selected for Remote hearing

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should not see the `Hearing documents` field

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Hearing and appointment` tab
    Then I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements yes path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

    When I switch to be a `Case Officer`
    Then I click the `Hearing and appointment` tab
    And I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements yes path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

    When I switch to be a `Admin Officer`
    Then I click the `Hearing and appointment` tab
    And I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements yes path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

  @RIA-3718 @remote-hearing-no
  Scenario: Submit hearing requirements with 'No' option selected for Remote hearing

    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all no

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should not see the `Hearing documents` field

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the requests for additional adjustments no path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements no path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

    When I switch to be a `Case Officer`
    And I click the `Hearing and appointment` tab
    And I should see the requests for additional adjustments no path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements no path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

    When I switch to be a `Admin Officer`
    And I click the `Hearing and appointment` tab
    And I should see the requests for additional adjustments no path
    And I should not see the agreed additional adjustments yes path
    And I should see the hearing requirements no path
    And I should see the text `Hearing requirements`
    And I should see the text `Requests for additional adjustments`
    And I should see the text `Record of requirements and requests`

