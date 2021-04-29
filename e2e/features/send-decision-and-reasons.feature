Feature: Send decision and reasons


  Background:
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
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons
    And I prepare decision and reasons

  @regression @send-decision-and-reasons-allowed @RIA-1154
  Scenario: Send decision and reasons with Allowed status
    When I click the `Overview` tab
    And I click the `Send decision and reasons` link
    Then I should see the text `Complete decision and reasons`
    And I should see the text `What is your decision?`
    And I should see the text `If the appeal is dismissed on all grounds, select 'Dismissed on all grounds'. If the appeal is allowed on any grounds, you must select 'Allowed'.`

    When I click the `Allowed` label
    And I click the `Continue` button
    Then I should see the text `Complete decision and reasons`
    And I should see the text `Upload your decision and reasons`

    When I upload `{@test.docx}` for the `Decision and reasons` field
    And I click the `I confirm this document is signed with today's date.` label
    And I click the `Ensure that the fee award is consistent with your decision.` label
    And I click the `Continue` button
    Then I should see the text `Complete decision and reasons`
    And I should see the text `Check your answers`
    And I should see the text `Check the information below carefully.`
    And I should see the text `Allowed`
    And I should see the `test.docx` link

    When I click the `Upload` button
    Then I should see the text `You have sent the decision and reasons`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Complete decision and reasons`

    When I click the `Documents` tab

    And within the `Decision and reason documents` collection's first item, I should see `-Gonzlez-Decision-and-reasons-FINAL.pdf` in the `Document` field
    And within the `Decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Decision and reason documents` collection's second item, I should see `-Gonzlez-Decision-and-reasons-Cover-letter.PDF` in the `Document` field
    And within the `Decision and reason documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @regression @send-decision-and-reasons-dismissed @RIA-1154
  Scenario: Send decision and reasons with Dismissed status
    When I click the `Overview` tab
    And I click the `Send decision and reasons` link
    Then I should see the text `Complete decision and reasons`
    And I should see the text `What is your decision?`
    And I should see the text `If the appeal is dismissed on all grounds, select 'Dismissed on all grounds'. If the appeal is allowed on any grounds, you must select 'Allowed'.`

    When I click the `Dismissed on all grounds` label
    And I click the `Continue` button
    Then I should see the text `Complete decision and reasons`
    And I should see the text `Upload your decision and reasons`

    When I upload `{@test.docx}` for the `Decision and reasons` field
    And I click the `I confirm this document is signed with today's date.` label
    And I click the `Ensure that the fee award is consistent with your decision.` label
    And I click the `Continue` button
    Then I should see the text `Complete decision and reasons`
    And I should see the text `Check your answers`
    And I should see the text `Check the information below carefully.`
    And I should see the text `Dismissed on all grounds`
    And I should see the `test.docx` link

    When I click the `Upload` button
    Then I should see the text `You have sent the decision and reasons`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Complete decision and reasons`

    When I click the `Documents` tab

    And within the `Decision and reason documents` collection's first item, I should see `-Gonzlez-Decision-and-reasons-FINAL.pdf` in the `Document` field
    And within the `Decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Decision and reason documents` collection's second item, I should see `-Gonzlez-Decision-and-reasons-Cover-letter.PDF` in the `Document` field
    And within the `Decision and reason documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
