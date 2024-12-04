Feature: Start an appeal application alternate paths

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @regression @start-appeal @alternate @start-appeal-alternate-paths
  Scenario: Alternate paths: no fixed address, appeal protection status revoked, no new matters

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `Tell us about your client's nationality` page

    # Start an appeal application without a fixed address
    Given I am on the `Your client's address` page
    When I select `No` for the `Does the appellant have a postal address?` field
    And I click the `Continue` button

     # Start an appeal application with mobile phone number
    Given I am on the `The appellant's contact preference` page
    When I select `Text message` for the `Communication Preference` field
    And I type `07930111111` for the `Mobile phone number` field
    And I click the `Continue` button

    # Start an appeal application with protection status revoked
    Given I am on the `Type of appeal` page
    When I select `Revocation of a protection status` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations in relation to persons eligible for humanitarian protection` label
    And I click the `Continue` button

    # Start an appeal application with no new matters
    Given I am on the `New matters` page
    When I select `No` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I click the `Continue` button

    Given I complete the `Has your client appealed against any other UK immigration decisions?` page
    Given I complete the `Legal representative details` page

    Given I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I am on the `DRAFT` page

    When I click the `Appellant` tab
    Then I should see `No` for the `Does the appellant have a postal address?` field
    And I should not see the `Explain what the new matters are and why they are relevant to this appeal.` field
    And I should not see the `If you prefer to use your own reference number for this case, you can enter it here.` field

    When I click the `Appeal` tab
    Then I should see `Revocation of a protection status` for the `Type of appeal` field
    And I should see `No` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field



  @regression @start-appeal @alternate @start-appeal-alternate-paths
  Scenario: Alternate paths for no other UK immigration appeal numbers

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `Tell us about your client's nationality` page
    And I complete the `Your client's address` page
    And I complete the `The appellant's contact preference` page
    And I complete the `Type of appeal` page
    And I complete the `The grounds of your appeal` page
    And I complete the `New matters` page

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    When I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    Given I complete the `Legal representative details` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I am on the `DRAFT` page
    When I click the `Appeal` tab
    Then I should see `Yes, but I don't have an appeal number` for the `Previous appeals` field

    When I click the `Overview` tab
    Given I select the `Edit appeal` Next step
    And I skip the `Home Office details` page by clicking `Continue`
    And I skip the `Basic details` page by clicking `Continue`
    And I skip the `Your client's address` page by clicking `Continue`
    And I skip the `The appellant's contact preference` page by clicking `Continue`
    And I skip the `Type of appeal` page by clicking `Continue`
    And I skip the `The grounds of your appeal` page by clicking `Continue`
    And I skip the `New matters` page by clicking `Continue`

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    When I select `No` for the `Previous appeals` field
    And I click the `Continue` button

    Given I complete the `Legal representative details` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I am on the `DRAFT` page
    When I click the `Appeal` tab
    Then I should see `No` for the `Previous appeals` field

    Given I select the `Edit appeal` Next step
    And I skip the `Home Office details` page by clicking `Continue`
    And I skip the `Basic details` page by clicking `Continue`
    And I skip the `Your client's address` page by clicking `Continue`
    And I skip the `The appellant's contact preference` page by clicking `Continue`
    And I skip the `Type of appeal` page by clicking `Continue`
    And I skip the `The grounds of your appeal` page by clicking `Continue`
    And I skip the `New matters` page by clicking `Continue`

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    When I select `I'm not sure` for the `Previous appeals` field
    And I click the `Continue` button

    Given I complete the `Legal representative details` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I am on the `DRAFT` page
    When I click the `Appeal` tab
    Then I should see `I'm not sure` for the `Previous appeals` field
