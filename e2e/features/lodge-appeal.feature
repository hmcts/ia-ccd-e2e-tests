Feature: Complete the appeal application online

  Background:
    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page
    And I complete the Your client's address page
    And I complete the Why is your client appealing? page
    And I complete the New matters page
    And I complete the Has your client appealed against any other UK immigration decisions? page
    And I complete the Your own reference number page
    And I complete the Check your answers page

  @create-case @lodge-appeal @RIA-515
  Scenario: Lodge an appeal application (happy path)

    Given I should see an alert confirming the case has been created
    When I select the Submit your appeal Next step
    Then I am on the Submit your appeal page
    And the Continue button is disabled
    When I agree to the declaration
    And I click the Continue button
    And I click the Submit button
    Then I should see the text Your appeal has been submitted
    And I should see the text What happens next
    And I should see the text You will receive an email confirming that this appeal has been submitted successfully.
    When I click the Close and Return to case details button
    Then I should see an alert confirming the case has been updated with event: Submit your appeal