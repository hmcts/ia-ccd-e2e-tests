Feature: Edit case listing

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    Then I should see `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card
    And I switch to be a `Case Officer`
    And I check the case has been paid for
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
    And I list the case

  @regression @edit-case-listing @RIA-362 @RIA-1380 @RIA-1654
  Scenario Outline: Edit the case listing

    When I switch to be a <username>
    And I select the `Edit case listing` Next step

    Then I am on the `Edit case listing` page
    And I should see the option `Manchester Crown Court (Crown Square)` for the `Listing location` field
    And I should see the option `Newport Tribunal Centre - Columbus House` for the `Listing location` field
    And I should see the option `Birmingham Civil And Family Justice Centre` for the `Listing location` field
    And I should see the option `Harmondsworth Tribunal Hearing Centre` for the `Listing location` field
    And I should see the option `Manchester Crown Court (Minshull st)` for the `Listing location` field
    And I should see the option `Atlantic Quay - Glasgow` for the `Listing location` field
    And I should see the option `Newcastle Civil And Family Courts And Tribunals Centre` for the `Listing location` field
    And I should see the option `Hatton Cross Tribunal Hearing Centre` for the `Listing location` field
    And I should see the option `North Tyneside Magistrates' Court` for the `Listing location` field
    And I should see the option `Manchester Tribunal Hearing Centre - Piccadilly Exchange` for the `Listing location` field
    And I should see the option `Leeds Magistrates' Court and Family Court` for the `Listing location` field
    And I should see the option `Bradford and Keighley Magistrates' Court and Family Court` for the `Listing location` field
    And I should see the option `Nottingham Magistrates' Court` for the `Listing location` field
    And I should see the option `Yarls Wood Immigration And Asylum Hearing Centre` for the `Listing location` field
    And I should see the option `Bradford Tribunal Hearing Centre` for the `Listing location` field
    And I should see the option `Hendon Magistrates' Court` for the `Listing location` field
    And I should see the option `Taylor House Tribunal Hearing Centre` for the `Listing location` field
    And I should see the option `Manchester Magistrates' Court` for the `Listing location` field
    And I should see the option `Coventry Magistrates' Court` for the `Listing location` field
    And I should see the option `Alloa Sheriff Court` for the `Listing location` field
    And I should see the option `Belfast Laganside Court` for the `Listing location` field
    
    And I select `Manchester Tribunal Hearing Centre - Piccadilly Exchange` for the `Listing location` field
    Then I select `Yes` for the `Will the hearing be held remotely?` field
    And I type `2` for the field with ID `listingLength_hours`
    And I type `0` for the field with ID `listingLength_minutes`

    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester Tribunal Hearing Centre - Piccadilly Exchange` for the `Hearing centre` field
    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new hearing notice has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Edit case listing`

    When I click the `Overview` tab
    And I should see the `Hearing details` field
    And I should see `Manchester Tribunal Hearing Centre - Piccadilly Exchange` for the `Hearing centre` field
    And I should see the text `11:30:00 AM`

    When I click the `Documents` tab

    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Hearing documents` collection's second item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    Examples:
    | username      |
    | Case Officer  |
    | Admin Officer |


