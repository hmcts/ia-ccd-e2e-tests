Feature: Grounds of appeal

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `What is the appellant's nationality?` page
    And I complete the `Appellant's address` page
    And I complete the `The appellant's contact preference` page

  @regression @start-appeal @RIA-230
  Scenario: Grounds of appeal are captured for protection type cases

    Given I am on the `Type of appeal` page
    When I select `Refusal of protection claim` for the `Type of appeal` field
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

    And I complete the `Deportation order` page
    And I complete the `New matters` page

    And I complete the `Other appeals` page

    And I save my legal rep details and continue PA
    And I submit my nonpayment appeal

    And I click the `Appeal` tab

    Then I should see the text `Removing the appellant from the UK would breach the UK's obligation in relation to persons eligible for a grant of humanitarian protection`
    And I should see the text `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention`
    And I should see the text `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998`

  @regression @start-appeal @RIA-236
  Scenario: Grounds of appeal are captured for revocation type cases

    Given I am on the `Type of appeal` page
    When I select `Revocation of a protection status` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    And I should not see the text `The decision is unlawful under section 6 of the Human Rights Act 1998`
    And the `Continue` button is disabled

    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    Then the `Continue` button is enabled

    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    And I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations in relation to persons eligible for humanitarian protection` label
    Then the `Continue` button is still enabled

    When I click the `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention` label
    And I click the `Continue` button

    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I complete the `Other appeals` page

    And I save my legal rep details and continue RP
    And I submit my nonpayment appeal

    And I click the `Appeal` tab

    And I should see the text `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention`
    And I should see the text `Revocation of the appellant's protection status breaches the United Kingdom's obligations in relation to persons eligible for humanitarian protection`

  @regression @start-appeal @RIA-2733 @RIA-2693
  Scenario: Grounds of appeal are captured for deprivation of citizenship type cases

    Given I am on the `Type of appeal` page
    When I select `Deprivation of citizenship` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    And I should see the text `The decision is unlawful because discretion should have been exercised differently`
    And the `Continue` button is disabled

    When I click the `The decision is unlawful because discretion should have been exercised differently` label
    Then the `Continue` button is enabled

    When I click the `The decision is unlawful because discretion should have been exercised differently` label
    And I click the `Deprivation would have a disproportionate effect` label
    Then the `Continue` button is still enabled

    When I click the `The decision is unlawful because discretion should have been exercised differently` label
    And I click the `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` label
    And I click the `Continue` button

    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I complete the `Other appeals` page

    And I save my legal rep details and continue DC
    And I submit my nonpayment appeal

    When I click the `Appeal` tab
    Then I should see the text `Deprivation would have a disproportionate effect`
    And I should see the text `The decision is unlawful because discretion should have been exercised differently`
    And I should see the text `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998`

    When I click the `Documents` tab

    And within the `Appellant documents` collection's first item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field

  @regression @start-appeal @RIA-2733-EA @RIA-2693
  Scenario: Grounds of appeal are captured for EEA refusal type cases

    Given I am on the `Type of appeal` page
    When I select `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    And I should not see the text `The decision is unlawful under section 6 of the Human Rights Act 1998`
    And the `Continue` button is disabled

    When I click the `The decision breaches the appellant's rights under the EEA regulations` label
    Then the `Continue` button is enabled

    When I click the `The decision breaches the appellant's rights under the EEA regulations` label
    Then the `Continue` button is disabled

    When I click the `The decision breaches the appellant's rights under the EEA regulations` label
    And I click the `Continue` button

    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I complete the `Other appeals` page

    And I save my legal rep details and continue EA
    And I submit my nonpayment appeal

    And I click the `Appeal` tab
    And I should see the text `The decision breaches the appellant's rights under the EEA regulations`

    When I click the `Documents` tab

    And within the `Appellant documents` collection's first item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field

  @regression @start-appeal @RIA-2733-HU @RIA-2693
  Scenario: Grounds of appeal are captured for human rights refusal type cases

    Given I am on the `Type of appeal` page
    When I select `Refusal of a human rights claim` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    And I should not see the text `Revocation of the appellant's protection status breaches the United Kingdom's obligations under the Refugee Convention`
    And the `Continue` button is disabled

    When I click the `The decision is unlawful under section 6 of the Human Rights Act 1998` label
    Then the `Continue` button is enabled

    When I click the `The decision is unlawful under section 6 of the Human Rights Act 1998` label
    Then the `Continue` button is disabled

    When I click the `The decision is unlawful under section 6 of the Human Rights Act 1998` label
    And I click the `Continue` button

    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I complete the `Other appeals` page

    And I save my legal rep details and continue HU
    And I submit my nonpayment appeal

    And I click the `Appeal` tab
    And I should see the text `The decision is unlawful under section 6 of the Human Rights Act 1998`

    When I click the `Documents` tab

    And within the `Appellant documents` collection's first item, I should see `-Gonzlez-appeal-form.PDF` in the `Document` field
