Feature: Grounds of appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page
    And I complete the `Your client's address` page

  @start-appeal @RIA-230
  Scenario: Grounds of appeal are captured for protection type cases

    Given I am on the `What type of decision is your client appealing against?` page
    When I select `The refusal of a protection claim` for the `Decision type` field
    And I click the `Continue` button

    Given I am on the `On which grounds will you build your appeal?` page
    And I should see the text `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998`
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
    And I complete the `Your own reference number` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    And I am on the `DRAFT` page
    And I click the `Case details` tab

    Then I should see the text `Removing the appellant from the UK would breach the UK's obligation in relation to persons eligible for a grant of humanitarian protection`
    And I should see the text `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention`
    And I should see the text `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998`

  @start-appeal @RIA-236
  Scenario: Grounds of appeal are captured for revocation type cases

    Given I am on the `What type of decision is your client appealing against?` page
    When I select `The revocation of a protection status` for the `Decision type` field
    And I click the `Continue` button

    Given I am on the `On which grounds will you build your appeal?` page
    And I should not see the text `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998`
    And the `Continue` button is disabled

    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    Then the `Continue` button is enabled

    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    And I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations in relation to persons eligible for humanitarian protection` label
    Then the `Continue` button is still enabled

    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    And I click the `Continue` button

    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Your own reference number` page
    And I complete the `Start appeal check your answers` page
    And I click the `Close and Return to case details` button
    And I am on the `DRAFT` page
    And I click the `Case details` tab

    And I should see the text `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention`
    And I should see the text `Revocation of the appellant's protection status breaches the United Kingdom's obligations in relation to persons eligible for humanitarian protection`
