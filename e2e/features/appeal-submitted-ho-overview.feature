Feature: Overview page for Home Office users for Appeal submitted and Payment pending

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

  @appeal-submitted-ho-overview @RIA-3340
  Scenario: Overview page for Home Office users after appeal submitted (PA appeal type) and in appeal submitted state

    Then I am on the `Type of appeal` page
    And I select `Refusal of protection claim` for the `Type of appeal` field
    And I click the `Continue` button

    Then I am on the `The grounds of your appeal` page
    And I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Continue` button

    Then I am on the `New matters` page
    And I select `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I type `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I click the `Continue` button

    Then I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    Then I am on the `Legal representative details` page
    And I type `IA Legal Services` for the `Company` field
    And I type `Stephen Fenn` for the `Name` field
    And I type `ia-legal-fenn` for the `Own reference` field
    And I click the `Continue` button

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Then I select `Submit the appeal now and pay within 14 days` for the `When will you pay?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I click the `Save and continue` button
    And I click the `Close and Return to case details` button

    Then I click the `Overview` tab
    And I click the `Submit your appeal` link
    And I should see the `Submit your appeal` page
    And I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `A new appeal has been submitted. A Tribunal Caseworker is reviewing the appeal and will be in touch if further action is required.`
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `A new appeal has been submitted. A Tribunal Caseworker is reviewing the appeal and will be in touch if further action is required.`
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `A new appeal has been submitted. A Tribunal Caseworker is reviewing the appeal and will be in touch if further action is required.`
    And I should see the case details
    And I should see the legal representative details

    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_appealSubmitted` case progress image
    And I should see the text `What happens next`
    And I should see the text `A new appeal has been submitted. A Tribunal Caseworker is reviewing the appeal and will be in touch if further action is required.`
    And I should see the case details
    And I should see the legal representative details
