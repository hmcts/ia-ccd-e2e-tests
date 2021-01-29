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
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons
    And I prepare decision and reasons

  @regression @home-office-users-view-tabs @RIA-1356 @RIA-2694
  Scenario Outline: Home office users should see the tabs

    When I switch to be a <homeOfficeUser>
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And within the first `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the first `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `Refusal of protection claim` in the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `Refusal of protection claim` in the `Type of appeal` field

    When I click the `Appellant` tab
    Then I should see the appellant's details
    And I should see the legal representative's details

    When I click the `Overview` tab
    And I should see the hearing details
    Then I should see the case details
    And I should see the legal representative details

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
    And within the `Directions` collection's first item, I should see `The appeal is going to a hearing and you should tell the Tribunal if the appellant has any hearing requirements.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Visit the online service and use the HMCTS reference to find the case. You'll be able to submit the hearing requirements using the Overview tab.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `The Tribunal will review the hearing requirements and any requests for additional adjustments. You'll then be sent a hearing date.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If you do not submit the hearing requirements within 5 working days, the Tribunal may not be able to accommodate the appellant's needs for the hearing.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    And within the `Directions` collection's fourth item, I should see `You have until the date indicated below to review the appellant's argument and evidence. You must explain whether the appellant makes a valid case for overturning the original decision.` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `You must respond to the Tribunal and tell them:` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `- whether you oppose all or parts of the appellant's case` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `- what your grounds are for opposing the case` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `- which of the issues are agreed or not agreed` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `- whether there are any further issues you wish to raise` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `- whether you are prepared to withdraw to grant` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `- whether the appeal can be resolved without a hearing` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `If you do not respond in time the Tribunal will decide how the case should proceed.` in the `Explanation` field
    And within the `Directions` collection's fourth item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's fourth item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

    And within the `Directions` collection's fifth item, I should see `You must now build your case to enable the respondent to conduct a thorough review of their decision.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `You have until the date indicated below to upload your Appeal Skeleton Argument and evidence.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `Your Appeal Skeleton Argument must be set out in three distinct parts to include:` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `- a concise summary of the appellant’s case` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `- a schedule of issues` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `- why those issues should be resolved in the appellant’s favour, by reference to the evidence you have (or plan to have) and any legal authorities you rely upon` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `Once you've uploaded your Appeal Skeleton Argument and evidence, you should submit your case. The Tribunal Caseworker will review everything you've added.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `If your case looks ready, the Tribunal will send it to the respondent to review.` in the `Explanation` field
    And within the `Directions` collection's fifth item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's fifth item, I should see `{$TODAY+42|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field


    Examples:
      | homeOfficeUser        |
      | Home Office APC       |
      | Home Office LART      |
      | Home Office POU       |
      | Home Office Generic   |
