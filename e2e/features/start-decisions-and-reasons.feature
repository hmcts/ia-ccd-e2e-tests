Feature: Start decision and reasons


  Background:
    Given I am signed in as a `Legal Org User Rep A`
    Then I wait for 15 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I pay for and submit my appeal
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request home office data
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I wait for 2 seconds
    And I list the case
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I create case summary
    And I generate the hearing bundle
    And I wait for 30 seconds
    And I switch to be a `Case Officer`
    And I wait for 2 seconds

  @regression @start-decision-and-reasons-yes-path @RIA-574 @nightly-test
  Scenario: Start decision and reasons
    When I select the `Start decision and reasons` Next step
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

    # And I should not see the `Areas of disagreement between the parties concerning the appellant's schedule of issues` field
    # And I should not see the `Give the respondent's account of the immigration history` field
    # And I should not see the `Give the areas of disagreement in relation to immigration history` field

    When I click the `Save` button
    Then I should see the text `You have started the decision and reasons process`
    And I should see the text `The judge can now download and complete the decision and reasons document.`
    And I click the `Close and Return to case details` button
    #Then I see the open case

    When I click the `Appellant` tab
    Then I should not see the decision fields

    When I click the `Appeal` tab
    Then I should not see the decision fields

    # When I click the `Overview` tab
    # Then I should see the image `caseOfficer_decision.png`
    # And I should not see the decision fields



  @regression @start-decision-and-reasons-no-path @RIA-574
  Scenario: Start decision and reasons
    When I select the `Start decision and reasons` Next step
    Then I should see the text `Start decision and reasons`
    And I should see the text `Write a brief introduction to the case`

    When I type `some introduction` for the `Introduction (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Add the appellant's case summary`

    When I type `some case summary` for the `Appellant's case summary (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Do both parties agree the immigration history?`

    When I select `No` for the `Do both parties agree the immigration history?` field
    And I should see the text `Give the respondent's account of the immigration history (Optional)`
    And I should see the text `Give the areas of disagreement in relation to immigration history (Optional)`
    And I should not see the text `Agreed immigration history`

    When I type `some respondents account of immigration history` for the `Give the respondent's account of the immigration history (Optional)` field
    And I type `some areas of disagreement` for the `Give the areas of disagreement in relation to immigration history (Optional)` field
    And I click the `Continue` button
    Then I see the text `Do both parties agree the schedule of issues?`

    When I select `No` for the `Do both parties agree the schedule of issues?` field
    And I see the text `Any discussion of the schedule of issues is likely to be found in the document tab. You should check the appeal skeleton argument and the Home Office's response and include the relevant information in the boxes below.`
    And I see the text `The appellant's schedule of issues as stated in the appeal skeleton argument (Optional)`
    And I see the text `Areas of disagreement between the parties concerning the appellant's schedule of issues (Optional)`
    And I should not see the text `Go to the documents tab and find the appeal skeleton argument for this case. This should contain the schedule of issues written by the appellant's legal representative. You can copy and paste the schedule of issues into the box below.`

    When I type `some schedule of issues` for the `The appellant's schedule of issues as stated in the appeal skeleton argument (Optional)` field
    And I type `some refinement or additions` for the `Areas of disagreement between the parties concerning the appellant's schedule of issues (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some introduction` in the `Introduction` field
    And I should see `some case summary` in the `Appellant's case summary` field

    And I should see `No` in the `Do both parties agree the immigration history?` field
    And I should see `some respondents account of immigration history` in the `Give the respondent's account of the immigration history` field
    And I should see `some areas of disagreement` in the `Give the areas of disagreement in relation to immigration history` field

    And I should see `No` in the `Do both parties agree the schedule of issues?` field
    And I should see `some schedule of issues` in the `The appellant's schedule of issues as stated in the appeal skeleton argument` field
    And I should see `some refinement or additions` in the `Areas of disagreement between the parties concerning the appellant's schedule of issues` field

    And I should not see the `Agreed immigration history` field

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


