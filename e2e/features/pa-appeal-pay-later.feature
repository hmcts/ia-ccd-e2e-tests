Feature: Legal rep decides payment method and saves appeal (PA appeal types)

  Background:

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

    Then I am on the `Home office details` page
    And I type `A123456/001` for the `Home Office reference` field
    And I type `{$TODAY-5|D MM YYYY}` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Then I am on the `Basic details` page
    And I type `Mr` for the `Title` field
    And I type `José` for the `Given names` field
    And I type `González` for the `Family name` field
    And I type `31-12-1999` for the `Date of birth` field
    And I add an item to the `Nationality` collection
    And within the `Nationality` collection's first item, I select `Finland` for the `Nationality` field
    And I add another item to the `Nationality` collection
    And within the `Nationality` collection's second item, I select `Iceland` for the `Nationality` field
    And I click the `Continue` button

    Then I am on the `Your client's address` page
    When I select `Yes` for the `Does the appellant have a fixed address?` field
    And I see the text `Enter a UK postcode`
    And I type `SW1A 2AA` for the `Enter a UK postcode` field
    And I click the `Find address` button
    And I see the text `Select an address`
    And I wait for any found addresses to load
    And I select `Prime Minister & First Lord Of The Treasury, 10 Downing Street, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button

    Then I am on the `The appellant's contact preference` page
    And I select `Text message` for the `Communication Preference` field
    And I type `07930111111` for the `Mobile phone number` field
    And I click the `Continue` button

  @save-pa-appeal-type-payLater-pba-payment @RIA-3415
  Scenario: Decide pay later with PBA Payment for PA appeal type and submit appeal and payment details visible to all users

    Then I am on the `Type of appeal` page
    And I select `Refusal of protection claim` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    And I should see the text `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention`
    And the `Continue` button is disabled

    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    Then the `Continue` button is enabled

    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Removing the appellant from the UK would breach the UK's obligation in relation to persons eligible for a grant of humanitarian protection` label
    Then the `Continue` button is still enabled

    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` label
    And I click the `Continue` button

    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Legal representative details` page

    Then I select `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Then I should see the text `Don't have Payment by Account?`
    And I should see the `Apply to use Payment by Account` link

    And I click the `Pay now using Payment by Account` label
    And I click the `Pay after submitting the appeal by card` label
    And I click the `Pay after submitting the appeal using Payment by Account` label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `A123456/001` for the `Home Office reference` answer
    And I should see `{$TODAY-5|D MMM YYYY}` for the `Enter the date the decision letter was sent` answer
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
    And I should see `Text message` for the `Communication Preference` answer
    And I should see `07930111111` for the `Mobile phone number` answer
    And I should see `Refusal of protection claim` for the `Type of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `No` for the `Other appeals` answer
    And I should see `IA Legal Services` for the `Company` answer
    And I should see `Stephen Fenn` for the `Name` answer
    And I should see `ia-legal-fenn` for the `Own reference` answer
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should see `Pay after submitting the appeal using Payment by Account` for the `Select a payment method` answer

    When I click the `Save and continue` button
    And I should see the text `Your appeal details have been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `Do this next`
    And I should see the text `If you're ready to proceed submit your appeal.`
    And I should see the `submit your appeal` link
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`
    And I click the `Close and Return to case details` button

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You still need to submit your appeal.`
    And I should see the `Submit your appeal` link
    And I should see the text `You can also review and edit your appeal.`
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `A123456/001` for the `Home Office reference` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `No` for the `Previous appeals` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should see `Payment pending` for the `Payment status` answer

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealStarted` case progress image
    And  I click the `Submit your appeal` link
    Then I am on the `Submit your appeal` page
    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    Then I click the `Submit` button
    And I should see the text `What happens next`
    And I should see the text `You still have to pay for this appeal. You can do this by selecting Make a payment from the Next step dropdown on the overview tab and following the instructions.`
    And I click the `Close and Return to case details` button

    And I should see the `Overview` page
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    When I click the `Appeal` tab
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should see `Payment pending` for the `Payment status` answer

    When I switch to be a Judge
    And  I click the `Appeal` tab
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should not see the text `Payment status`

    When I switch to be a `Admin Officer`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should not see the text `Payment status`

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should not see the text `Payment status`
    And I request respondent evidence

    When I switch to be a `Home Office APC`
    And I click the `Appeal` tab
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` answer
    And I should see `Payment pending` for the `Payment status` answer
