Feature: Customise hearing bundle


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
    And I upload additional evidence
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements no path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary

  @regression @customise-hearing-bundle @RIA-2923
  Scenario: customise hearing bundle no change
    When I click the `Documents` tab


    When I select the `Customise hearing bundle` Next step
    Then I should see the `Customise hearing bundle` page
    And I should see the `Continue` button

    When I click the `Continue` button
    Then I should see the text `Customise hearing bundle`
    And I should see the `Generate` button

    When I click the `Generate` button
    Then I should see the text `The hearing bundle is being generated`
    Then I should see the text `What happens next`
    Then I should see the text `You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and will need to generate the bundle again.`

    When I click the `Close and Return to case details` button
    Then I should see the text `The hearing bundle is being generated. You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and need to generate the bundle again.`

    And I wait for 10 seconds
    And I switch to be a `Legal Org User Rep A`

    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.pdf` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should only see the `caseOfficer_preHearing` case progress image
    And I should see the text `Do this next`
    And I should see the text `You can start to create the decision and reasons document.`


  @regression @customise-hearing-bundle-add-document @RIA-2923
  Scenario: Generate hearing bundle add document
    When I click the `Documents` tab


    When I select the `Customise hearing bundle` Next step
    Then I should see the `Customise hearing bundle` page

    And I add an item to the `Additional evidence from appellant (Optional)` collection
    And within the `Additional evidence from appellant (Optional)` collection's second item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And I wait for 10 seconds

    When I click the `Continue` button
    And I wait for 5 seconds
    Then I should see the text `Customise hearing bundle`
    And I should see the `Generate` button

    When I click the `Generate` button
    Then I should see the text `The hearing bundle is being generated`
    Then I should see the text `What happens next`
    Then I should see the text `You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and will need to generate the bundle again.`

    When I click the `Close and Return to case details` button
    Then I should see the text `The hearing bundle is being generated. You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and need to generate the bundle again.`

    And I wait for 10 seconds
    And I switch to be a `Legal Org User Rep A`

    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.pdf` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Documents` tab
    And I should see the `Evidence1.pdf` link


  @regression @customise-hearing-bundle-remove-document @RIA-2923
  Scenario: Generate hearing bundle remove document
    When I click the `Documents` tab


    When I select the `Customise hearing bundle` Next step
    Then I should see the `Customise hearing bundle` page
    And I should see the `AdditionalEvidence1.pdf` link

    When I remove the first item from the `Additional evidence from appellant (Optional)` collection
    Then I should not see the `AdditionalEvidence1.pdf` link

    When I click the `Continue` button
    Then I should see the text `Customise hearing bundle`
    And I should see the `Generate` button

    When I click the `Generate` button
    Then I should see the text `The hearing bundle is being generated`
    Then I should see the text `What happens next`
    Then I should see the text `You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and will need to generate the bundle again.`

    When I click the `Close and Return to case details` button
    Then I should see the text `The hearing bundle is being generated. You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and need to generate the bundle again.`

    And I wait for 10 seconds
    And I switch to be a `Legal Org User Rep A`

    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.pdf` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

