Feature: Case progression

  @send-direction @RIA-908 @RIA-909 @RIA-910 @RIA-911 @RIA-912 @RIA-914 @RIA-915
  Scenario: Case progression information is displayed for each case state

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I click the `Overview` tab
    Then I should see the image `legalRep_appealSubmitted.png`
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal`
    And I should see the text `You don't need to do anything else right now`

    When I switch to be a `Case Officer`
    And I request respondent evidence
    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    Then I should see the image `legalRep_awaitingRespondentEvidence.png`
    And I should see the text `Do this next`
    And I should see the text `You'll get an email when the respondent evidence is available in the documents tab`
    When I click the `Build your case` link
    Then I am on the `Build your case` page
    Then I click the `Cancel` link

    When I switch to be a `Case Officer`
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    Then I should see the image `legalRep_caseBuilding.png`
    And I should see the text `Do this next`
    And I should see the text `The respondent evidence is now available in the documents tab`
    And I should not see the text `submit your case`
    When I click the `Build your case` link
    Then I am on the `Build your case` page
    Then I click the `Cancel` link

    When I build my case
    And I click the `Overview` tab
    Then I should see the image `legalRep_caseBuilding.png`
    And I should see the text `Do this next`
    And I should see the text `If you're not yet ready for your case to be reviewed, continue to build your case`
    And I should see the text `If you're ready for your case to be reviewed, submit your case`
    When I click the `build your case` link
    Then I am on the `Build your case` page
    Then I click the `Cancel` link
    And I click the `Overview` tab
    When I click the `submit your case` link
    Then I am on the `Submit your case` page
    Then I click the `Cancel` link

    When I submit my case
    And I click the `Overview` tab
    Then I should see the image `legalRep_caseUnderReview.png`
    And I should see the text `Do this next`
    And I should see the text `Your case is now under review`
    And I should see the text `You'll get an email telling you what happens next`

    When I switch to be a `Case Officer`
    And I request respondent review
    And I switch to be a `Legal Rep`
    And I click the `Overview` tab
    Then I should see the image `legalRep_respondentReview.png`
    And I should see the text `Do this next`
    And I should see the text `The case has now been sent to the respondent for review.`
    And I should see the text `If you want to reply to the response, you should contact the case officer within 5 days`
    And I should see the text `If you don't respond within 5 days, the case will proceed to a hearing`
