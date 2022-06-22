Feature: End appeal

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I click the `Close and Return to case details` button
    And I select the `Pay and submit` Next step
    Then I should see the `Select PBA number` page
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    And I wait for 30 seconds
    Then I should see the text `Your appeal has been paid for and submitted`
    

  @regression @end-appeal @RIA-823 @RIA-1677 @RIA-1678 @RIA-1766 @RIA-1486 @RIA-2239 @nightly-test
  Scenario: End appeal after submit appeal case officer

    And I switch to be a `Case Officer`
    Then I end the appeal

    And I click the `Documents` tab

    And I should not see the `Upload additional evidence` link
    And I should not see the `Add additional evidence as an addendum` link
    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    And I should not see the `Send a new direction` link
    And I should not see the `Change a direction due date` link
    When I click the `Overview` tab

    Then I should only see the `caseOfficer_appealEnded` case progress image

    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`

    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    # When I switch to be a `Judge`
    # Then I should only see the `caseOfficer_appealEnded` case progress image
    # And I should see the text `What happens next`
    # And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    # And I should see the ended appeal details
    # And I should not see the hearing details
    # And I should see the case details

    # When I switch to be a `Legal Org User Rep A`
    # And I click the `Overview` tab
    # Then I should only see the `caseOfficer_appealEnded` case progress image
    # And I should see the text `Do this next`
    # And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    # And I should see the `Tell us what you think about the appeals service` link
    # And I should see the ended appeal details
    # And I should not see the hearing details
    # And I should see the case details

    # When I switch to be a `<IAUser>`
    # And I click the `Overview` tab
    # Then I should only see the `caseOfficer_appealEnded` case progress image
    # And I should see the text `Do this next`
    # And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    # And I should see the ended appeal details
    # And I should not see the hearing details
    # And I should see the case details

    # Examples:
    #   | IAUser                |
    #   | Home Office APC       |
    #   | Home Office LART      |
    #   | Home Office POU       |
    #   | Home Office Generic   |


  @regression @end-appeal @RIA-823 @RIA-1677 @RIA-1678 @RIA-1766 @RIA-1486 @RIA-2239
  Scenario Outline: End appeal after submit appeal judge

    And I switch to be a `Judge`
    Then I end the appeal

    When I click the `Documents` tab

    And I should not see the `Upload additional evidence` link
    And I should not see the `Add additional evidence as an addendum` link
    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    And I should not see the `Send a new direction` link
    And I should not see the `Change a direction due date` link
    When I click the `Overview` tab

    Then I should only see the `caseOfficer_appealEnded` case progress image

    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`

    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `Do this next`
    And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    And I should see the `Tell us what you think about the appeals service` link
    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    When I switch to be a <IAUser>
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `Do this next`
    And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should not see the hearing details
    And I should see the case details

    Examples:
      | IAUser                |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |

  @regression @end-appeal-after-listing @RIA-1677 @RIA-1678 @RIA-1486 @RIA-2239
  Scenario Outline: End appeal after listing case officer

    And I switch to be a `Case Officer`
    When I request respondent evidence
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
    And I switch to be a `Case Officer`
    And I end the appeal

    And I click the `Documents` tab

    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Overview` tab

    Then I should only see the `caseOfficer_appealEnded` case progress image

    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`

    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `Do this next`
    And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    And I should see the `Tell us what you think about the appeals service` link
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a <IAUser>
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `Do this next`
    And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    Examples:
      | IAUser                |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |

  @regression @end-appeal-after-listing @RIA-1677 @RIA-1678 @RIA-1486 @RIA-2239
  Scenario Outline: End appeal after listing judge

    And I switch to be a `Case Officer`
    When I request respondent evidence
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
    And I switch to be a `Judge`
    And I end the appeal

    And I click the `Documents` tab

    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Overview` tab

    Then I should only see the `caseOfficer_appealEnded` case progress image

    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`

    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a `Admin Officer`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a `Judge`
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `Do this next`
    And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    And I should see the `Tell us what you think about the appeals service` link
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    When I switch to be a <IAUser>
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `Do this next`
    And I should see the text `If a case worker has approved this decision, you can ask for it to be reviewed by a judge.`
    And I should see the ended appeal details
    And I should see the hearing details
    And I should see the case details

    Examples:
      | IAUser                |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |

