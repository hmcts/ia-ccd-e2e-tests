Feature: Start an appeal application alternate paths

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @start-appeal @alternate
  Scenario: Start an appeal application without a fixed address

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page

    Given I am on the `Your client's address` page
    When I select `No` for the `Does the appellant have a fixed address?` field
    And I click the `Continue` button

    Given I complete the `What type of decision is your client appealing against?` page
    And I complete the `On which grounds will you build your appeal?` page
    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Your own reference number` page

    Given I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    When I click the `Case details` tab
    Then I should see `No` for the `Does the appellant have a fixed address?` field

  @start-appeal @alternate
  Scenario: Start an appeal application with protection status revoked

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page
    And I complete the `Your client's address` page

    Given I am on the `What type of decision is your client appealing against?` page
    When I select `The revocation of a protection status` for the `Decision type` field
    And I click the `Continue` button

    Given I am on the `On which grounds will you build your appeal?` page
    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    And I click the `Continue` button

    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Your own reference number` page

    Given I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    When I click the `Case details` tab
    Then I should see `The revocation of a protection status` for the `Type of appeal` field

  @start-appeal @alternate
  Scenario: Start an appeal application without providing legal representative reference number

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page
    And I complete the `Your client's address` page
    And I complete the `What type of decision is your client appealing against?` page
    And I complete the `On which grounds will you build your appeal?` page
    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page

    Given I am on the `Your own reference number` page
    When I click the `Continue` button

    Given I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    When I click the `Case details` tab
    Then I should not see the `If you prefer to use your own reference number for this case, you can enter it here.` field

  @start-appeal @alternate
  Scenario: Start an appeal application with no new matters

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page
    And I complete the `Your client's address` page
    And I complete the `What type of decision is your client appealing against?` page
    And I complete the `On which grounds will you build your appeal?` page

    Given I am on the `New matters` page
    When I select `No` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I click the `Continue` button

    Given I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Your own reference number` page

    Given I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    When I click the `Case details` tab
    Then I should see `No` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    Then I should not see the `Explain what the new matters are and why they are relevant to this appeal.` field

  @start-appeal @alternate
  Scenario Outline: Start an appeal application with no known other appeals

    Given I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page
    And I complete the `Your client's address` page
    And I complete the `What type of decision is your client appealing against?` page
    And I complete the `On which grounds will you build your appeal?` page
    And I complete the `New matters` page

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    When I select <otherAppeals> for the `Other appeals` field
    And I click the `Continue` button

    Given I complete the `Your own reference number` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    When I click the `Case details` tab
    Then I should see <otherAppeals> for the `Other appeals` field

    Examples:
      | otherAppeals                           |
      | Yes, but I don't have an appeal number |
      | No                                     |
      | I'm not sure                           |
