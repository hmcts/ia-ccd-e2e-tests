Feature: Start appeal shows confirmation when saved

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `Tell us about your client's nationality` page
    And I complete the `Your client's address` page
    And I complete the `The appellant's contact preference` page
    And I complete the `Type of appeal` page
    And I complete the `The grounds of your appeal` page
    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Legal representative details` page
    And I complete the `no remission details` page
    And I complete the `Start appeal check your answers` page

  @regression @start-appeal @alternate @start-appeal-confirmation @1925
  Scenario: Confirmation page is displayed when saved

    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the Submit your appeal link
    Then I am on the Submit your appeal page
