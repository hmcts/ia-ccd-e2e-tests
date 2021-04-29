Feature: Send case to pre hearing state when unable to generate hearing bundle


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
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary

  @regression @RIA-2723
  Scenario: Start decision and reasons after failed hearing bundle
    When I select the `Send to pre hearing` Next step
    And I click the `Submit` button
    Then I should see an alert confirming the case `has been updated with event: Send to pre hearing`
    And I should only see the `caseOfficer_preHearing` case progress image

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should only see the `progress_legalRep_preHearing` case progress image
  
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_preHearing` case progress image

    # LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_preHearing` case progress image

    # POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_preHearing` case progress image

    # Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_preHearing` case progress image

    When I switch to be a `Case Officer`
    And I select the `Start decision and reasons` Next step
    Then I should see the text `Start decision and reasons`
    And I should see the text `Write a brief introduction to the case`

    When I type `some introduction` for the `Introduction (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Add the appellant's case summary`

    When I type `some case summary` for the `Appellant's case summary (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Do both parties agree the immigration history?`

    When I select `Yes` for the `Do both parties agree the immigration history?` field
    Then I see the text `Agreed immigration history`
    And I should not see the text `Give the respondent's account of the immigration history (Optional)`
    And I should not see the text `Give the areas of disagreement in relation to immigration history (Optional)`

    When I type `some agreed immigration history` for the `Agreed immigration history (Optional)` field
    And I click the `Continue` button
    Then I see the text `Do both parties agree the schedule of issues?`

    When I select `Yes` for the `Do both parties agree the schedule of issues?` field
    Then I see the text `Go to the documents tab and find the appeal skeleton argument for this case. This should contain the schedule of issues written by the appellant's legal representative. You can copy and paste the schedule of issues into the box below.`
    And I see the text `The appellant's schedule of issues (Optional)`
    And I should not see the text `Areas of disagreement between the parties concerning the appellant's schedule of issues (Optional)`

    When I type `some schedule of issues` for the `The appellant's schedule of issues (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some introduction` in the `Introduction` field
    And I should see `some case summary` in the `Appellant's case summary` field
    And I should see `Yes` in the `Do both parties agree the immigration history?` field
    And I should see `some agreed immigration history` in the `Agreed immigration history` field
    And I should see `Yes` in the `Do both parties agree the schedule of issues?` field
    And I should see `some schedule of issues` in the `The appellant's schedule of issues` field

    And I should not see the `Areas of disagreement between the parties concerning the appellant's schedule of issues` field
    And I should not see the `Give the respondent's account of the immigration history` field
    And I should not see the `Give the areas of disagreement in relation to immigration history` field

    When I click the `Save` button
    Then I should see the text `You have started the decision and reasons process`
    And I should see the text `The judge can now download and complete the decision and reasons document.`
    And I click the `Close and Return to case details` button
    #Then I see the open case

    When I click the `Appellant` tab
    Then I should not see the decision fields

    When I click the `Appeal` tab
    Then I should not see the decision fields

    When I click the `Overview` tab
    Then I should see the image `caseOfficer_decision.png`
    And I should not see the decision fields

