Feature: All home office users overview appeal case-details documents directions tabs view

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I switch to be a `Case Officer`
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons
    And I generate decision and reasons

  @Home-office-users-view-tabs @RIA-1356
  Scenario Outline: Home office users should see the tabs
    When I switch to be a <homeOfficeUser>
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `AppealResponse.pdf` in the `Response document` field
    And I should see `This is the appeal response` in the first `Description` field
    And within the first `Evidence` collection's first item, I should see `AppealResponseEvidence.pdf` in the `Document` field
    And within the first `Evidence` collection's first item, I should see `This is the appeal response evidence` in the `Describe the document` field
    And I should see `This is the case argument` in the second `Description` field
    And within the second `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the second `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I click the `Case details` tab
    Then the `Reference number` field should be 13 characters long
    And I should see `A123456` in the `Home Office reference number` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Date on the decision letter` field
    And I should see `José` in the `Given names` field
    And I should see `González` in the `Family name` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field
    And I should see `some-ref` in the `If you prefer to use your own reference number for this case, you can enter it here.` field
    And I should see `Taylor House` in the `Hearing centre` field

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And I should see the `Hearing documents` field
    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Hearing documents` collection's second item, I should see `CaseSummary.pdf` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `This is the case summary` in the `Description` field
    And within the `Hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Hearing documents` collection's third item, I should see `-Gonzlez-hearing-notice.PDF` in the `Document` field
    And within the `Hearing documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I should see the `Legal representative documents` field
    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's second item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Legal representative documents` collection's second item, I should see `This is the case argument` in the `Description` field
    And within the `Legal representative documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's third item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the `Legal representative documents` collection's third item, I should see `The is the case argument evidence` in the `Description` field
    And within the `Legal representative documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Legal representative documents` collection's fourth item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field
    And within the `Legal representative documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `AppealResponseEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the appeal response evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's third item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's third item, I should see `This is the respondent evidence` in the `Description` field
    And within the `Respondent documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `Your appeal is going to a hearing. Login to submit your hearing requirements on the overview tab.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not supply your hearing requirements within 5 days, we may not be able to accommodate your needs for the hearing.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    And within the `Directions` collection's fifth item, I should see `A notice of appeal has been lodged against this asylum decision.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `You must now send all documents to the case officer.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `You have 14 days to supply` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's fifth item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field


    Examples:
      | homeOfficeUser        |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |
    