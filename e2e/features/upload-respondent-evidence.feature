Feature: Upload respondent evidence

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @regression @create-direction @RIA-700 @RIA-592 @RIA-2034 @RIA-2694
  Scenario: Uploading respondent evidence adds documents and a new direction

    When I select the `Upload respondent evidence` Next step
    Then I am on the `Upload respondent evidence` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- None`

    When I add an item to the `Upload case documents` collection
    And within the `Upload case documents` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Document` field
    And within the `Upload case documents` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Document` field
    And I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded the respondent evidence`
    Then I should see the text `What happens next`
    Then I should see the text `The legal representative will now get an email`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Directions` tab
    Then I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `You must now build your case to enable the respondent to conduct a thorough review of their decision` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `You have 28 days after the respondent’s bundle is provided, or 42 days after the Notice of Appeal, whichever is the later, to upload your Appeal Skeleton Argument and evidence` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Your Appeal Skeleton Argument must be set out in three distinct parts to include:` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a concise summary of the appellant’s case` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a schedule of issues` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- why those issues should be resolved in the appellant’s favour, by reference to the evidence you have (or plan to have) and any legal authorities you rely upon` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Once you've uploaded your Appeal Skeleton Argument and evidence, you should submit your case. The Tribunal Caseworker will review everything you've added` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `If your case looks ready, the Tribunal will send it to the respondent to review` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+42|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @RIA-1287
  Scenario: Uploading respondent evidence can be retried if first attempt wasn't correct

    When I select the `Upload respondent evidence` Next step
    Then I am on the `Upload respondent evidence` page
    When I add an item to the `Upload case documents` collection
    And within the `Upload case documents` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Document` field
    And within the `Upload case documents` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    When I click the `Upload` button
    When I click the `Close and Return to case details` button
    #And I see the open case

    When I select the `Add additional evidence` Next step
    Then I am on the `Add additional evidence` page
    When I click the `Continue` button
    #And I see the open case

    When I select the `Upload respondent evidence` Next step
    Then I am on the `Upload respondent evidence` page
    When I add an item to the `Upload case documents` collection
    And within the `Upload case documents` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
    And within the `Upload case documents` collection's first item, I type `This is the evidence added later` for the `Describe the document` field

    When I click the `Continue` button
    When I click the `Upload` button
    When I click the `Close and Return to case details` button
    #And I see the open case

    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the evidence added later` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
