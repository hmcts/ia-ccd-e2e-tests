Feature: Generate decision and reasons


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
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
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons



  @regression @generate-decision-and-reasons @RIA-1152 @RIA-1153 @RIA-1540 @RIA-1544 @RIA-2037
  Scenario: Start decision and reasons
    And I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the image `caseOfficer_decision.png`
    And I should see the text `Do this next`
    Then I should see the `Generate decision and reasons` link
    When I select the `Generate decision and reasons` Next step
    Then I should see the text `Generate decision and reasons`
    And I should see the text `Are you giving an anonymity direction?`

    When I select `Yes` for the `Anonymity direction` field
    And I click the `Continue` button
    Then I see the text `Give the names of the legal representatives in this case`

    When I type `Perry Mason` for the `Legal representative for the appellant` field
    And I type `Atticus Finch` for the `Legal representative for the respondent` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Yes` in the `Anonymity direction` field
    And I should see `Perry Mason` in the `Legal representative for the appellant` field
    And I should see `Atticus Finch` in the `Legal representative for the respondent` field

    When I click the `Generate` button
    Then I should see the text `You have generated the decision and reasons document`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Generate decision and reasons`

    When I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Decision and reason documents` collection's first item, I should see `-Gonzlez-decision-and-reasons-draft.docx` in the `Document` field
    And within the `Decision and reason documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And I click the `Overview` tab
    And I should see the `Overview` page
    And I should see the image `caseOfficer_decision.png`
    And I should see the text `Do this next`
    Then I should see the `Send decision and reasons` link

    # HO - APC

    Then I switch to be a `Home Office APC`
    And I click the `Appellant` tab
    And I should not see any case progress images
    And I should see the appellant's details
    And I should see the legal representative's details
    And I should not see the decision fields

    And I click the `Overview` tab
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # HO - LART

    Then I switch to be a `Home Office LART`
    And I click the `Appellant` tab
    And I should not see any case progress images
    And I should see the appellant's details
    And I should see the legal representative's details
    And I should not see the decision fields

    And I click the `Overview` tab
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # HO - POU

    Then I switch to be a `Home Office POU`
    And I click the `Appellant` tab
    And I should not see any case progress images
    And I should see the appellant's details
    And I should see the legal representative's details
    And I should not see the decision fields

    And I click the `Overview` tab
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details

    # HO - GENERIC

    Then I switch to be a `Home Office Generic`
    And I click the `Appellant` tab
    And I should not see any case progress images
    And I should see the appellant's details
    And I should see the legal representative's details
    And I should not see the decision fields

    And I click the `Overview` tab
    And I should see the hearing details
    And I should see the case details
    And I should see the legal representative details
