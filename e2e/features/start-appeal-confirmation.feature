Feature: Start appeal shows confirmation when saved

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office reference` page
    And I complete the `Basic details` page
    And I complete the `Your client's address` page
    And I complete the `What type of decision is your client appealing against?` page
    And I complete the `On which grounds will you build your appeal?` page
    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Your own reference number` page
    And I complete the `Start appeal check your answers` page

  @start-appeal @alternate
  Scenario: Confirmation page is displayed when saved

    Then I should see the text `Appeal saved`
    And I should see the text `You still need to submit it`
    And I should see the text `Ready to submit?`
    And I should see the text `Submit your appeal when you are ready.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case to make changes.`

    When I click the Submit your appeal link
    Then I am on the Submit your appeal page
