Feature: Build case multiple load

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`

    When I select the `Submit your case` Next step
    Then I should see the text `You cannot submit this case because you have not uploaded any case building documents.`

    When I select the `Build your case` Next step
    Then I am on the `Build your case` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- None`
    And the `Continue` button is disabled
    And I should see the text `You must upload your appeal skeleton argument to submit your case`

    When I upload `{@CaseArgument.pdf}` for the `Appeal skeleton argument` field
    Then the `Continue` button is enabled
    When I type `This is the case argument` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And within the `Evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Evidence (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `CaseArgument.pdf` in the `Appeal skeleton argument` field
    And I should see `This is the case argument` in the `Describe the document` field
    And within the `Evidence` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Evidence` collection's first item, I should see `This is the evidence` in the `Describe the document` field

  @build-case-multiple-load @regression @create-direction @RIA-480 @RIA-600 @RIA-927
  Scenario: Build case multiple load
    When I click the `Submit Case` button
    Then I should see the text `You have submitted your case`
    Then I should see the text `We have sent you a confirmation email`
    Then I should see the text `What happens next`
    Then I should see the text `The case officer will now review your appeal.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's second item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Legal representative documents` collection's second item, I should see `This is the case argument` in the `Description` field
    And within the `Legal representative documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's third item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Legal representative documents` collection's third item, I should see `This is the evidence` in the `Description` field
    And within the `Legal representative documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I switch to be a `Case Officer`
    And I click the `Request case edit` link
    Then I am on the `Request case edit` page

    And I type `Your case argument needs to be changed. Please make changes and resubmit.` for the `Explain the direction you are issuing` field
    And I type `{$TODAY+14}` for the `By what date must they comply?` field
    And I click the `Continue` button

    And I am on the `Check your answers` page
    And I click the `Send direction` button
    And I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `The appellant now needs to edit the case in the way you have directed.`
    And I should see the text `The appellant should then submit their case again for you to review.`
    And I click the `Close and Return to case details` button

    And I switch to be a `Legal Org User Rep A`
    When I select the `Build your case` Next step
    Then I am on the `Build your case` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- CaseArgument.pdf`
    And I should see the text `- Evidence1.pdf`

    When I upload `{@CaseArgument2.pdf}` for the `Appeal skeleton argument` field
    Then the `Continue` button is enabled
    When I type `This is the new case argument` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And within the `Evidence (Optional)` collection's first item, I upload `{@Evidence2.pdf}` for the `Document (Optional)` field
    And within the `Evidence (Optional)` collection's first item, I type `This is the new evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `CaseArgument2.pdf` in the `Appeal skeleton argument` field
    And I should see `This is the new case argument` in the `Describe the document` field
    And within the `Evidence` collection's first item, I should see `Evidence2.pdf` for the `Document` field
    And within the `Evidence` collection's first item, I should see `This is the new evidence` in the `Describe the document` field

    When I click the `Submit Case` button
    Then I should see the text `You have submitted your case`
    Then I should see the text `We have sent you a confirmation email`
    Then I should see the text `What happens next`
    Then I should see the text `The case officer will now review your appeal.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's second item, I should see `CaseArgument2.pdf` in the `Document` field
    And within the `Legal representative documents` collection's second item, I should see `This is the new case argument` in the `Description` field
    And within the `Legal representative documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's third item, I should see `Evidence2.pdf` in the `Document` field
    And within the `Legal representative documents` collection's third item, I should see `This is the new evidence` in the `Description` field
    And within the `Legal representative documents` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's fourth item, I should see `CaseArgument.pdf` in the `Document` field
    And within the `Legal representative documents` collection's fourth item, I should see `This is the case argument` in the `Description` field
    And within the `Legal representative documents` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Legal representative documents` collection's fifth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Legal representative documents` collection's fifth item, I should see `This is the evidence` in the `Description` field
    And within the `Legal representative documents` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
