Feature: Edit appeal before submit

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    When I save my initial RP appeal for nonPayment with hearing

  @regression @edit-appeal @RIA-653 @RIA-3334 @test
  Scenario: Edit a draft appeal

    When I select the `Edit appeal` Next step
    Given I am on the `Tell us about your client` page
    And I click the `Continue` button
    Given I am on the `Location` page
    And I click the `Continue` button
    Given I am on the `Home Office details` page
    When I type `01234567` for the `Home Office UAN or GWF reference` field
    And I click the `Continue` button
    Given I am on the `Upload the Notice of Decision` page
    And I click the `Continue` button
    Given I am on the `Type of appeal` page
    And I click the `Continue` button
    Given I am on the `The grounds of your appeal` page
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I click the `Continue` button
    Given I am on the `What is the appellant's nationality?` page
    And I click the `Continue` button

    Given I am on the `Appellant's address` page
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    When I select `Email` for the `Communication Preference` field
    And I type `test@test.com` for the `Email address` field
    And I click the `Continue` button

    Given I am on the `Appellant's sponsor` page
    And I click the `Continue` button

    Given I am on the `Deportation order` page
    And I click the `Continue` button

    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Other appeals` page
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    And I click the `Continue` button

    Given I am on the `Hearing type` page
    And I click the `Continue` button
    Given I am on the `Edit appeal` page
    When I click the `Save and continue` button
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I click the `Appellant` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `Mr` for the `Title` field
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `Yes` for the `Does the appellant have a postal address?` field
    And I should see `Email` for the `Communication Preference` field
    And I should see `test@test.com` for the `Email address` field
#    And I should see `Stephen` for the `Given names` field
#    And I should see `Fenn` for the `Family name` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `07060021700` for the `Contact number` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the `Submit your appeal` link
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `Revocation of a protection status` for the `Type of appeal` field
    And I should see `001234567` for the `Home Office UAN or GWF reference` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `Revocation of a protection status` for the `Type of appeal` field
    And I should see `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `No` for the `Other appeals` field
    And I should see `Yes` for the `Has a deportation order been made against the appellant?` field
    Then I submit my nonpayment appeal

  @regression @edit-appeal-after-submit-in-time @RIA-1359
  Scenario: Edit submitted appeal when submitted in time

    When I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

    When I click the `Overview` tab
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image

    And I click the `Applications` tab
    And I click the `Record an application` link
    Then I am on the `Record an application` page
    And I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the document field without a label
    And I click the `The legal representative` label
    And I select `Update appeal details` for the `Type of application` field
    And I type `update appeal details reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Update appeal details` in the `Type of application` field
    And I should see `update appeal details reason` in the `Reason for application` field
    And I should see `{$TODAY-3|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You've recorded an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is available in the applications tab. You must now edit the appeal details based on the new information provided in the application.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Record an application`
    And I should see the text `The application decision has been recorded and is available in the applications tab.`
    And I should see the text `You must now edit the appeal details based on the new information provided in the application.`
    
    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update appeal details` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update appeal details reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `In progress` for the `Status` field

    When I click the `Overview` tab
    When I click the `edit the appeal details` link
    Then I am on the `Edit appeal` page

    Given I am on the `Home Office details` page
    When I type `01234567` for the `Home Office UAN or GWF reference` field
    And I type `{$TODAY-3|DD-MM-YYYY}` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I type `John` for the `Given names` field
    And I type `Smith` for the `Family name` field
    And I click the `Continue` button

    Given I am on the `Appellant's address` page
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    And I click the `Continue` button

    Given I am on the `Deportation order` page
    And I click the `Continue` button
    
    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Other appeals` page
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `{$TODAY-3|D MMM YYYY}` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `John` for the `Given names` answer
    And I should see `Smith` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a postal address?` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `No` for the `Previous appeals` answer
    And I should see `IA Legal Services` for the `Company` answer
    And I should see `Stephen Fenn` for the `Name` answer
    And I should see `ia-legal-fenn` for the `Own reference` answer

    When I click the `Save and continue` button
    Then I should see the text `You've updated the application`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified and the service will be updated.`
    And I should see the text `The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image
    And I should see an alert confirming the case `has been updated with event: Edit appeal`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update appeal details` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update appeal details reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `Completed` for the `Status` field

    When I click the `Documents` tab

    And I should see the `Appellant documents` field
    And within the `Appellant documents` collection's first item, I should see `-Smith-appeal-form.PDF` in the `Document` field
    And within the `Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @regression @edit-appeal-after-submit-out-of-time @RIA-1359
  Scenario: Edit submitted appeal when submitted out of time

    When I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

    When I click the `Overview` tab
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image

    And I click the `Applications` tab
    And I click the `Record an application` link
    Then I am on the `Record an application` page
    And I add an item to the `Application email` collection
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the document field without a label
    And I click the `The legal representative` label
    And I select `Update appeal details` for the `Type of application` field
    And I type `update appeal details reason` for the `Reason for application` field
    And I select `{$TODAY-3|DD-MM-YYYY}` for the `Date application was made` field
    And I click the `Granted` label
    And I type `some application decision reason` for the `Reasons for decision` field

    Then the `Continue` button is enabled

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `test.doc` in the `Application email` field
    And I should see `The legal representative` in the `Application from` field
    And I should see `Update appeal details` in the `Type of application` field
    And I should see `update appeal details reason` in the `Reason for application` field
    And I should see `{$TODAY-3|D MMM YYYY}` in the `Date application was made` field
    And I should see `Granted` in the `Application decision` field
    And I should see `some application decision reason` in the `Reasons for decision` field

    When I click the `Record application` button
    Then I should see the text `You've recorded an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is available in the applications tab. You must now edit the appeal details based on the new information provided in the application.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Record an application`
    And I should see the text `The application decision has been recorded and is available in the applications tab.`
    And I should see the text `You must now edit the appeal details based on the new information provided in the application.`
    
    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update appeal details` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update appeal details reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `In progress` for the `Status` field

    When I click the `Overview` tab
    When I click the `edit the appeal details` link
    Then I am on the `Edit appeal` page

    Given I am on the `Home Office details` page
    When I type `01234567` for the `Home Office UAN or GWF reference` field
    And I type `15-09-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I type `John` for the `Given names` field
    And I type `Smith` for the `Family name` field
    And I click the `Continue` button

    Given I am on the `Appellant's address` page
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    And I click the `Continue` button

    Given I am on the `Deportation order` page
    And I click the `Continue` button
    
    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Other appeals` page
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    And I click the `Continue` button

    When I type `some reason` for the `You can upload a document or fill out the box below. (Optional)` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `15 Sep 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `John` for the `Given names` answer
    And I should see `Smith` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a postal address?` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `No` for the `Previous appeals` answer
    And I should see `IA Legal Services` for the `Company` answer
    And I should see `Stephen Fenn` for the `Name` answer
    And I should see `ia-legal-fenn` for the `Own reference` answer

    When I click the `Save and continue` button
    Then I should see the text `You've updated the application`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified and the service will be updated.`
    And I should see the text `The new details will be used on all future correspondence and documents.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should only see the `caseOfficer_awaitingRespondentEvidence` case progress image
    And I should see an alert confirming the case `has been updated with event: Edit appeal`

    When I click the `Applications` tab
    Then I should see the `Applications` field
    And I should see the `Record an application` link
    And within the `Applications` collection's first item, I should see `test.doc` for the `Application email` field
    And within the `Applications` collection's first item, I should see `The legal representative` for the `Application from` field
    And within the `Applications` collection's first item, I should see `Update appeal details` for the `Type of application` field
    And within the `Applications` collection's first item, I should see `update appeal details reason` for the `Reason of application` field
    And within the `Applications` collection's first item, I should see `{$TODAY-3|D MMM YYYY}` for the `Date application was made` field
    And within the `Applications` collection's first item, I should see `Granted` for the `Decision` field
    And within the `Applications` collection's first item, I should see `some application decision reason` for the `Reason of decision` field
    And within the `Applications` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Applications` collection's first item, I should see `Completed` for the `Status` field

    When I click the `Documents` tab

    And I should see the `Appellant documents` field
    And within the `Appellant documents` collection's first item, I should see `-Smith-appeal-form.PDF` in the `Document` field
    And within the `Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Appeal` tab
    Then I should see the `Appeal details` page
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `some reason` for the `Reasons for late appeal submission` field
