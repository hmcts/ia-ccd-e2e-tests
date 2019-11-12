Feature: Start initial appeal application

  @regression @start-appeal @happy-path @postcode
  Scenario: Start initial appeal application

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

    Given I am on the `Home office details` page
    When I type `A123456/001` for the `Home Office reference` field
    And I type `31-10-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I type `Mr` for the `Title` field
    And I type `José` for the `Given names` field
    And I type `González` for the `Family name` field
    And I type `31-12-1999` for the `Date of birth` field
    And I add an item to the `Nationality` collection
    And within the `Nationality` collection's first item, I select `Finland` for the `Nationality` field
    And I add another item to the `Nationality` collection
    And within the `Nationality` collection's second item, I select `Iceland` for the `Nationality` field
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    When I select `Yes` for the `Does the appellant have a fixed address?` field
    And I see the text `Enter a UK postcode`
    And I type `SW1A 2AA` for the `Enter a UK postcode` field
    And I click the `Find address` button
    And I see the text `Select an address`
    And I wait for any found addresses to load
    And I select `Prime Minister & First Lord Of The Treasury, 10 Downing Street, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button

    Given I am on the `What type of decision is your client appealing against?` page
    When I select `The refusal of a protection claim` for the `Decision type` field
    And I click the `Continue` button

    Given I am on the `On which grounds will you build your appeal?` page
    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Continue` button

    Given I am on the `New matters` page
    When I select `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I type `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I select `Yes` for the `Other appeals` field
    When I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    ###############################################################
    ### This is a bug logged in ServiceNow: Incident INC0484123 ###
    ###############################################################
    #Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I add an item to the `Appeal number` collection
    #And within the `Appeal number` collection's first item, I type `RP/12345/2014` for the field without a label
    #And I add another item to the `Appeal number` collection
    #And within the `Appeal number` collection's second item, I type `PA/54321/2015` for the field without a label
    #And I click the `Continue` button

    Given I am on the `Legal representative details` page
    When I type `IA Legal Services` for the `Company` field
    And I type `Stephen Fenn` for the `Name` field
    And I type `ia-legal-fenn` for the `Own reference` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `A123456/001` for the `Home Office reference` answer
    And I should see `31 Oct 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And within the `Nationality` collection's second item, I should see `Iceland` for the `Nationality` answer
    And I should see `Yes` for the `Does the appellant have a fixed address?` answer
    And within the `Address` fieldset, I should see `Prime Minister & First Lord Of The Treasury` for the `Building and Street` answer
    And within the `Address` fieldset, I should see `10 Downing Street` for the `Address Line 2` answer
    And within the `Address` fieldset, I should see `London` for the `Town or City` answer
    And within the `Address` fieldset, I should see `SW1A 2AA` for the `Postcode/Zipcode` answer
    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` answer
    And I should see `The refusal of a protection claim` for the `Decision type` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    #And I should see `Yes` for the `Other appeals` answer
    And I should see `Yes, but I don't have an appeal number` for the `Other appeals` answer
    #And within the `Appeal number` collection's first item, I should see `RP/12345/2014` for the answer without a label
    #And within the `Appeal number` collection's second item, I should see `PA/54321/2015` for the answer without a label
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
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
    And within the `Nationality` collection's second item, I should see `Iceland` for the `Nationality` field
    And I should see `Yes` for the `Does the appellant have a fixed address?` field
    And within the `Address` fieldset, I should see `Prime Minister & First Lord Of The Treasury` for the `Building and Street` field
    And within the `Address` fieldset, I should see `10 Downing Street` for the `Address Line 2` field
    And within the `Address` fieldset, I should see `London` for the `Town or City` field
    And within the `Address` fieldset, I should see `SW1A 2AA` for the `Postcode/Zipcode` field
    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant` field
    And I should see `The refusal of a protection claim` for the `Type of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `Yes, but I don't have an appeal number` for the `Previous appeals` field
    And I should see `31 Oct 2018` for the `Home Office decision letter sent` field

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the `Submit your appeal` link
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `The refusal of a protection claim` for the `Type of appeal` field
    And I should see `A123456` for the `Home Office reference` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field



  @regression @start-appeal @happy-path
  Scenario: Start initial appeal application with legal rep address

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

    Given I am on the `Home office details` page
    When I type `A123456/001` for the `Home Office reference` field
    And I type `31-10-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I type `Mr` for the `Title` field
    And I type `José` for the `Given names` field
    And I type `González` for the `Family name` field
    And I type `31-12-1999` for the `Date of birth` field
    And I add an item to the `Nationality` collection
    And within the `Nationality` collection's first item, I select `Finland` for the `Nationality` field
    And I add another item to the `Nationality` collection
    And within the `Nationality` collection's second item, I select `Iceland` for the `Nationality` field
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    When I select `No` for the `Does the appellant have a fixed address?` field
    And I click the `Continue` button

    Given I am on the `What type of decision is your client appealing against?` page
    When I select `The refusal of a protection claim` for the `Decision type` field
    And I click the `Continue` button

    Given I am on the `On which grounds will you build your appeal?` page
    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Continue` button

    Given I am on the `New matters` page
    When I select `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I type `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I select `Yes` for the `Other appeals` field
    When I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    ###############################################################
    ### This is a bug logged in ServiceNow: Incident INC0484123 ###
    ###############################################################
    #Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I add an item to the `Appeal number` collection
    #And within the `Appeal number` collection's first item, I type `RP/12345/2014` for the field without a label
    #And I add another item to the `Appeal number` collection
    #And within the `Appeal number` collection's second item, I type `PA/54321/2015` for the field without a label
    #And I click the `Continue` button

    Given I am on the `Legal representative details` page
    When I type `IA Legal Services` for the `Company` field
    And I type `Stephen Fenn` for the `Name` field
    And I type `ia-legal-fenn` for the `Own reference` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `A123456/001` for the `Home Office reference` answer
    And I should see `31 Oct 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And within the `Nationality` collection's second item, I should see `Iceland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a fixed address?` answer
    And I should see `The refusal of a protection claim` for the `Decision type` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    #And I should see `Yes` for the `Other appeals` answer
    And I should see `Yes, but I don't have an appeal number` for the `Other appeals` answer
    #And within the `Appeal number` collection's first item, I should see `RP/12345/2014` for the answer without a label
    #And within the `Appeal number` collection's second item, I should see `PA/54321/2015` for the answer without a label
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
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
    And within the `Nationality` collection's second item, I should see `Iceland` for the `Nationality` field
    And I should see `No` for the `Does the appellant have a fixed address?` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant` field
    And I should see `The refusal of a protection claim` for the `Type of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `Yes, but I don't have an appeal number` for the `Previous appeals` field
    And I should see `31 Oct 2018` for the `Home Office decision letter sent` field

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the `Submit your appeal` link
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `The refusal of a protection claim` for the `Type of appeal` field
    And I should see `A123456` for the `Home Office reference` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field
