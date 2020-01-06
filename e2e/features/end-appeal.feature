Feature: End appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`

  @regression @end-appeal @RIA-823 @RIA-1677 @RIA-1678 @RIA-1766 @RIA-1486
  Scenario Outline: End appeal after submit appeal

    Then I end the appeal

    And I click the `Documents` tab
    Then I should see the `Documents` page
    And I should not see the `Upload additional evidence` link
    And I should not see the `Add additional evidence as an addendum` link
    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` page
    And I should not see the `Send a new direction` link
    And I should not see the `Change a direction due date` link
    When I click the `Overview` tab

    Then I should only see the `caseOfficer_appealEnded` case progress image

    And I should see the text `Do this next`
    And I should see the text `There is no further action to take, unless either party asks for the decision to be reviewed by a judge.`

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
      | Legal Rep             |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |


  @regression @end-appeal-after-listing @RIA-1677 @RIA-1678 @RIA-1486
  Scenario Outline: End appeal after listing

    When I request respondent evidence
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
    And I submit hearing requirements
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I end the appeal

    And I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Tribunal documents` field
    And within the `Tribunal documents` collection's first item, I should see `-Gonzlez-NoticeOfEndedAppeal.PDF` in the `Document` field
    And within the `Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Overview` tab

    Then I should only see the `caseOfficer_appealEnded` case progress image

    And I should see the text `Do this next`
    And I should see the text `There is no further action to take, unless either party asks for the decision to be reviewed by a judge.`

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
      | Legal Rep             |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |

