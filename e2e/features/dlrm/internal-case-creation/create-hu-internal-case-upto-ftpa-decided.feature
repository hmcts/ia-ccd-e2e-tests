Feature: Create HU internal case upto FTPA submitted

  Background:
    Given I am signed in as a `Admin Officer`
    And I create a new case
    And I wait for 5 seconds
    And I save my initial internal HU appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I pay for and submit my appeal by Card
    And I switch to be a `Case Officer`
    And I check the case has been paid for
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
    And I wait for 5 seconds
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
    And I refresh the page
    And I wait for 4 seconds

    When I select the `Start decision and reasons` Next step
    Then I should see the text `Start decision and reasons`

    When I type `some introduction` for the `Introduction (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Add the appellant's case summary`

    When I type `some case summary` for the `Appellant's case summary (Optional)` field
    And I click the `Continue` button
    Then I should see the text `Do both parties agree the immigration history?`

    When I select `Yes` for the `Do both parties agree the immigration history?` field
    When I type `some agreed immigration history` for the `Agreed immigration history (Optional)` field
    And I click the `Continue` button
    Then I see the text `Do both parties agree the schedule of issues?`

    When I select `Yes` for the `Do both parties agree the schedule of issues?` field
    When I type `some schedule of issues` for the `The appellant's schedule of issues (Optional)` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some introduction` in the `Introduction` field
    When I click the `Save` button
    Then I should see the text `You have started the decision and reasons process`
    And I should see the text `The judge can now download and complete the decision and reasons document.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    And I prepare decision and reasons
    And I send decision and reasons
    When I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds

  @dlrm-hu-case  @dlrm-cases @dlrm-icc @TAG-TO-CHANGE
  Scenario: PA case submit FTPA
    Then I wait for 2 seconds
    # Then I apply for appellant FTPA

