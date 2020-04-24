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
    #And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
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
    #And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `Revocation of a protection status` for the `Type of appeal` field
    ### Possible Bug ###
    ### Why do we not see the full B123445/999 reference number after submit or edit ###
    And I should see `B123456` for the `Home Office reference` field
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
