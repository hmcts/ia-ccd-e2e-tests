Feature: Hearing tab details after Submit hearing requirements journey


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
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes

  @RIA-2052 @hearing-requirements-hearing-tab
  Scenario: Hearing tab with hearing details when Submit hearing requirements with 'Yes' options selected

    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    Then I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    When I switch to be a `Case Officer`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    Then I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    # HO APC
    When I switch to be a `Home Office APC`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    # HO LART
    When I switch to be a `Home Office LART`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    # HO POU
    When I switch to be a `Home Office POU`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    # HO Generic
    When I switch to be a `Home Office Generic`
    And I click the `Hearing and appointment` tab
    And I should not see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    # Admin Officer
    When I switch to be a `Admin Officer`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    Then I should see the requests for additional adjustments yes path
    And I should not see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    # record agreed requirements

    # Case Officer
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    Then I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    # AO
    When I switch to be a `Admin Officer`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    When I click the `Overview` tab
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

    When I type `LP/12345/2019` for the `Listing reference` field
    And I select `6 hours` for the `Length of appointment` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Appointment date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`
    And I click the `Close and Return to case details` button if present

    And I click the `Hearing and appointment` tab
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I should not see the `Hearing documents` field
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should see the text `Record of hearing details`
    And I should see the text `Hearing requirements and requests`

    And I click the `Documents` tab
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field

    # HO APC
    When I switch to be a `Home Office APC`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    And I should not see the `Hearing documents` field
    And I click the `Documents` tab
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field

    # HO LART
    When I switch to be a `Home Office LART`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    And I should not see the `Hearing documents` field
    And I click the `Documents` tab
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field

    # HO POU
    When I switch to be a `Home Office POU`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    And I should not see the `Hearing documents` field
    And I click the `Documents` tab
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field

    # HO Generic
    When I switch to be a `Home Office Generic`
    And I click the `Hearing and appointment` tab
    Then I should see the `Hearing` page
    And I should see `LP/12345/2019` for the `Listing reference` field
    And I should see `6 hours` for the `Length of appointment` field
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field
    And I should not see the requests for additional adjustments yes path
    And I should see the agreed additional adjustments yes path
    And I should not see the text `Record of hearing details`
    And I should not see the text `Hearing requirements and requests`

    And I should not see the `Hearing documents` field
    And I click the `Documents` tab
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field





