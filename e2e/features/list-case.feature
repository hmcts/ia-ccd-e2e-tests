Feature: List case

  @regression @list-case @RIA-412 @RIA-1571 @postcode @RIA-1380 @RIA-1976 
  Scenario: Listing the case produces a hearing notice (default for <hearingCentre> hearing centre)

    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    When I click the `pay for and submit your appeal` link
    Then I should see the `Select PBA number` page
    And I select `PBA0087412` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I switch to be a `Case Officer`
    And I request home office data
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
    And I switch to be a `Admin Officer`

    When I select the `List the case` Next step
    Then I am on the `List the case` page
    And I should see the option `Manchester` for the `Location` field
    And I should see the option `Taylor House` for the `Location` field
    And I should see the option `Newport` for the `Location` field
    And I should see the option `Bradford` for the `Location` field
    And I should see the option `Newcastle Civil & Family Courts and Tribunals Centre` for the `Location` field
    And I should see the option `Birmingham` for the `Location` field
    And I should see the option `Coventry Magistrates Court` for the `Location` field
    And I should see the option `Remote hearing` for the `Location` field
    And I should see the option `Decision Without Hearing` for the `Location` field
    And I should see the option `Hatton Cross` for the `Location` field
    And I should see the option `Glasgow` for the `Location` field
    And I should see the option `Belfast` for the `Location` field
    And I should see the option `Nottingham Justice Centre` for the `Location` field
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
    And I select `6 hours` for the `Length` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Taylor House` for the `Location` field
    And I should see `6 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: List the case`

    When I click the `Documents` tab

    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Examples:
    #   | hearingCentre | address                                                  | postcode |
    #   | Taylor House  | 88 Greville Road, Cambridge                              | CB1 3QL  |
    #   | Manchester    | Quality Save, The Exchange, Piccadilly Plaza, Manchester | M1 4AH   |
    #   | Bradford      | 19 Mascotte Gardens, Hornsea                             | HU18 1RS |
    #   | Newport       | 8 Lambourne Crescent, Melksham                           | SN12 7ND |
    #   | North Shields | Flat 8, Anglia House, Friargate, Penrith                 | CA11 7XY |
    #   | Birmingham    | 11 Glebe Road, Didcot                                    | OX11 8PL |
    #   | Hatton Cross  | 15 Brook Gardens, Emsworth                               | PO10 7JY |
    #   | Glasgow       | 4 Glenesk Avenue, Montrose                               | DD10 9AQ |

  @regression @list-case @RIA-412 @RIA-1571 @RIA-1380
  Scenario: Listing the case produces a hearing notice

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
    And I switch to be a `Admin Officer`

    When I select the `List the case` Next step
    Then I am on the `List the case` page
    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow` for the `Hearing centre` field
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
    And I select `6 hours` for the `Length` field
    And I select `{$TODAY+14|DD-MM-YYYY} 10:30:00` for the `Appointment date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Taylor House` for the `Hearing centre` field
    And I should see `6 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 10:30:00 AM` for the `Appointment date and time` field

    When I click the `List case` button
    Then I should see the text `You have listed the case`
    And I should see the text `What happens next`
    And I should see the text `The hearing notice will be sent to all parties.`
    And I should see the text `You don't need to do any more on this case.`

    When I click the `Close and Return to case details` button if present
    Then I should see an alert confirming the case `has been updated with event: List the case`

    When I click the `Documents` tab

    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
