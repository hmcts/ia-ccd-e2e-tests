Feature: Edit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal

  @edit-appeal @RIA-653
  Scenario: Edit a draft appeal

    When I select the `Edit appeal` Next step
    Then I am on the `Edit appeal` page

    Given I am on the `Home Office reference` page
    When I type `B123456/999` for the Home Office reference number field
    And I type `31-12-2018` for the `Date on the decision letter` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    And I click the `Continue` button

    Given I am on the `What type of decision is your client appealing against?` page
    When I select `The revocation of a protection status` for the `Decision type` field
    And I click the `Continue` button

    Given I am on the `On which grounds will you build your appeal?` page
    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    And I click the `Continue` button

    Given I am on the `New matters` page
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I click the `Continue` button

    Given I am on the `Your own reference number` page
    When I type `CASE999` for the `If you prefer to use your own reference number for this case, you can enter it here. (Optional)` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `B123456/999` for the `Home Office reference number` answer
    And I should see `31 Dec 2018` for the `Date on the decision letter` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a fixed address?` answer
    And I should see `The revocation of a protection status` for the `Decision type` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain what the new matters are and why they are relevant to this appeal.` answer
    And I should see `No` for the `Other appeals` answer
    And I should see `CASE999` for the `If you prefer to use your own reference number for this case, you can enter it here.` answer

    When I click the `Save and continue` button
    Then I should see the text `Appeal saved`
    And I should see the text `You still need to submit it`
    And I should see the text `Ready to submit?`
    And I should see the text `Submit your appeal when you are ready.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case to make changes.`

    When I click the `Close and Return to case details` button
    And I click the `Case details` tab
    Then I should see `B123456` for the `Home Office reference number` field
    And I should see `31 Dec 2018` for the `Date on the decision letter` field
    And I should see `Mr` for the `Title` field
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `No` for the `Does the appellant have a fixed address?` field
    And I should see `The revocation of a protection status` for the `Type of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain what the new matters are and why they are relevant to this appeal.` field
    And I should see `No` for the `Other appeals` field
    And I should see `CASE999` for the `If you prefer to use your own reference number for this case, you can enter it here.` field
