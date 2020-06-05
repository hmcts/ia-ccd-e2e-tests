Feature: Edit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

  @regression @edit-appeal @RIA-653
  Scenario: Edit a draft appeal

    When I select the `Edit appeal` Next step
    Then I am on the `Edit appeal` page

    Given I am on the `Home office details` page
    When I type `B123456/999` for the `Home Office reference` field
    And I type `31-12-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    When I select `Text message` for the `Communication Preference` field
    And I type `07930111111` for the `Mobile phone number` field
    And I click the `Continue` button

    Given I am on the `Type of appeal` page
    When I select `Revocation of a protection status` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations in relation to persons eligible for humanitarian protection` label
    And I click the `Continue` button

    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `B123456/999` for the `Home Office reference` answer
    And I should see `31 Dec 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a fixed address?` answer
    And I should see `Text message` for the `Communication Preference` answer
    And I should see `07930111111` for the `Mobile phone number` answer
    And I should see `Refusal of protection claim` for the `Type of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `No` for the `Previous appeals` answer
    And I should see `IA Legal Services` for the `Company` answer
    And I should see `Stephen Fenn` for the `Name` answer
    And I should see `ia-legal-fenn` for the `Own reference` answer

    When I click the `Save and continue` button
    Then I should see the text `Appeal saved`
    And I should see the text `You still need to submit it`
    And I should see the text `Ready to submit?`
    And I should see the text `Submit your appeal when you are ready.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case to make changes.`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Appellant` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `Mr` for the `Title` field
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    #And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `No` for the `Does the appellant have a fixed address?` field
    And I should see `Text message` for the `Communication Preference` field
    And I should see `07930111111` for the `Mobile phone number` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the `Submit your appeal` link
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    #And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `The revocation of a protection status` for the `Type of appeal` field
    ### Possible Bug ###
    ### Why do we not see the full B123445/999 reference number after submit or edit ###
    And I should see `B123456/999` for the `Home Office reference` field
    ### End ###

    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    #And I should see `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `No` for the `Previous appeals` field
    And I should see `31 Dec 2018` for the `Home Office decision letter sent` field

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
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
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

    When I click the `Close and Return to case details` button
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

    Given I am on the `Home office details` page
    When I type `B123456/999` for the `Home Office reference` field
    And I type `{$TODAY-3|DD-MM-YYYY}` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I type `John` for the `Given names` field
    And I type `Smith` for the `Family name` field
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    And I click the `Continue` button

    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `B123456/999` for the `Home Office reference` answer
    And I should see `{$TODAY-3|D MMM YYYY}` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `John` for the `Given names` answer
    And I should see `Smith` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a fixed address?` answer
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

    When I click the `Close and Return to case details` button
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
    Then I should see the `Documents` page
    And I should see the `Legal representative documents` field
    And within the `Legal representative documents` collection's first item, I should see `-Smith-appeal-form.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

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
    And within the `Application email` collection's first item, I upload `{@test.doc}` for the field without a label
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

    When I click the `Close and Return to case details` button
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

    Given I am on the `Home office details` page
    When I type `B123456/999` for the `Home Office reference` field
    And I type `15-09-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I type `John` for the `Given names` field
    And I type `Smith` for the `Family name` field
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    And I click the `Continue` button

    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I click the `Continue` button

    Given I am on the `Legal representative details` page
    And I click the `Continue` button

    When I type `some reason` for the `You can upload a document or fill out the box below. (Optional)` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `B123456/999` for the `Home Office reference` answer
    And I should see `15 Sep 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `John` for the `Given names` answer
    And I should see `Smith` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a fixed address?` answer
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

    When I click the `Close and Return to case details` button
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
    Then I should see the `Documents` page
    And I should see the `Legal representative documents` field
    And within the `Legal representative documents` collection's first item, I should see `-Smith-appeal-form.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Yes` for the `Was the appeal submission late?` field
    And I should see `some reason` for the `Reasons for late appeal submission` field
