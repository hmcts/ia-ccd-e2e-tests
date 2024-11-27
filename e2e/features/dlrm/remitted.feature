Feature: Remitted feature - Mark appeal as Remitted


Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I wait for 10 seconds
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    # And I pay for and submit my appeal by Card
    And I pay for and submit my appeal by Card for a non PA appeal type
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
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
    Then I wait for 2 seconds
    Then I apply for appellant FTPA
    And I switch to be a `Judge`
    When I select the `Decide FTPA application` Next step
    And I should see the text `Decide FTPA application`
    And I should see the text `Applicant`
    And I select `Appellant` for the `Who made the application?` field
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Decision`
    And I select `Permission granted` for the `The outcome of the application` field
    And I click the `Continue` button
    And I should see the text `Decide FTPA application`
    And The page is accessible
    And I should see the text `FTPA Decision and Reasons`
    When I upload `{@FTPADecisionAndReasons.pdf}` for the document field without a label
    And I click the `Continue` button
    And The page is accessible
    And I click the `Yes` label
    And I should see the text `List any objections to the draft Notice from either party (Optional)`
    And I click the `Continue` button
    And The page is accessible
    And I should see the text `Notes for the Upper Tribunal`
    And I click the `There is a point of special difficulty or importance` label
    And I click the `There are special reasons, such as the need to request the First-tier Tribunal to provide observations on the grounds of appeal` label
    And I click the `It's clear at this stage that the issue is likely to be used for giving country guidance` label
    And I click the `Continue` button
    And The page is accessible
    And I should see the text `Check your answers`
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button
   

@remitted-dlrm @RIA-8254 @RIA-8631 @RIA-8256 @RIA-8626 @RIA-8253 @RIA-8255 @RIA-8257 @appeal-nightly-test
Scenario: Admin mark the case as remitted and source of remittal as Upper tribunal
    When I switch to be a `Admin Officer`
    When I select the `Mark appeal as remitted` Next step
    And I wait for 3 seconds
    And I should see the text `Source of remittal`
    When I select `Upper Tribunal` for the `Which court remitted the appeal` field
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Mark appeal as remitted`
    And I should see the text `Court reference number`
    And I type `TEST123` for the `What is the Upper Tribunal reference number` field
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Mark appeal as remitted`
    And I should see the text `Listing instructions`
    And I type `test judge excluded` for the `Enter the name of a judge to exclude (Optional)` field
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Mark appeal as remitted`
    And I should see the text `Upload remittal decision`
    When I upload `{@FTPADecisionAndReasons.pdf}` for the document field without a label
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Mark appeal as remitted`
    And I should see the text `Upload other remittal documents`
    And The page is accessible
    And I click the `Continue` button
    And I should see the text `Mark appeal as remitted`
    And I click the `Submit` button
    And I should see the text `Mark appeal as remitted`
    And I should see the text `You have marked the appeal as remitted`
    And The page is accessible
    And I click the `Close and Return to case details` button
    And I should see the text `Do this next`
    And I should see the text `A Legal Officer will review the case and decide the next steps`
    And I should see the text `Rehearing details`
    And I should see `Remitted` in the `Reason for rehearing` field
    And I should see `Upper Tribunal` in the `Remitted from` field
    And I should see `TEST123` in the `Upper Tribunal reference` field
    When I click the `Documents` tab
    Then I should see the `Remittal Documents` field
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `Appeal marked as remitted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `Admin` for the `User` field
    And within the `Case notes` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date added` field
    And I switch to be a `Legal Org User Rep A`
    And I wait for 2 seconds
    And I should see the text `The appeal is being reheard. The Tribunal will review the case and contact you to let you know what to do next`
    When I click the `Applications` tab
    And I select the `Make an application` Next step
    Then I should see the `Type of application` page
    And The page is accessible
    And I should see the option `Update appeal details` for the `Type of application` field
    When I select `Update appeal details` for the `Type of application` field
    And I click the `Continue` button
    Then I should see the `Explain your application` page
    And The page is accessible
    And I should see the text `Update appeal details`
    When I type `Test reason for  Update appeal details` for the `Tell us which appeal details you want to update and explain why the changes are necessary.` field
    And I add an item to the `Supporting evidence (Optional)` collection
    And within the `Supporting evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the field without a label
    And I wait for 3 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Update appeal details` in the `Type of application` field
    When I click the `Submit` button
    And The page is accessible
    Then I should see the text `You've made an application`
    And I click the `Close and Return to case details` button
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. The Tribunal will review the case and contact you to let you know what to do next.`
    And I switch to be a `Home Office Generic`
    And I wait for 2 seconds
    And I should see the text `The appeal is being reheard. The Tribunal will review the case and contact you to let you know what to do next`
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I should see the text `The appeal is being reheard. Review the case and send any directions if required`
    And I switch to be a `Judge`
    And I should see the text `The appeal will be reheard. A Legal Officer will review any Tribunal instructions and then the listing team will relist the case.`
   











     


