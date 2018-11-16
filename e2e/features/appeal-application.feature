Feature: Complete the appeal application online

  @create-case
  Scenario: Create case
    Given I am signed in as a Legal Rep
    When I click the Create new case button
    Then I should see the Create Case page
    Then I should see Immigration & Asylum for the Jurisdiction field
    Then I should see IA Asylum Case for the Case type field
    Then I should see Start your appeal for the Event field
    Then I should see the Start button

  @create-case @lodge-appeal @happy-path
  Scenario: Lodge an appeal application (happy path)

    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page

    Given I am on the Home Office reference page
    When I type A123456/001 for the Home Office reference number field
    And I type 31-10-2018 for the Date on the decision letter field
    And I click the Continue button

    Given I am on the Basic details page
    And I type Mr for the Title field
    And I type José for the Given names field
    And I type González for the Last name field
    And I type 31-12-1999 for the Date of birth field
    And I add a new item to the Nationality collection
    And Within the Nationality collection, I select Finland for the first Nationality field
    And I add another new item to the Nationality collection
    And Within the Nationality collection, I select Iceland for the second Nationality field
    And I click the Continue button

    Given I am on the Your client's address page
    When I select Yes for the Does the appellant have a fixed address? field
    And I type SW1A 2AA for the Enter a UK postcode field
    And I click the Find address button
    And I select 10 Downing Street, London for the Select an address field
    And I click the Continue button

    Given I am on the Why is your client appealing? page
    When I select My client's protection claim was refused for the Appeal reason field
    And I click the Continue button

    Given I am on the New matters page
    When I select Yes for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    And I select Birth of a child from the New matters field
    And I select New relationship from the New matters field
    And I select Removal would disrupt family life from the New matters field
    And I select Appellant now claims to be a refugee from the New matters field
    And I select New marriage from the New matters field
    And I click the Continue button

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    When I select Yes for the Other appeals field
    And I click the Continue button

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    When I add a new item to the Appeal number collection
    And Within the Appeal number collection, I type 1234 for the first Appeal number field
    And I add a new item to the Appeal number collection
    And Within the Appeal number collection, I type 5678 for the second Appeal number field
    And I click the Continue button

    Given I am on the Your own reference number page
    When I type some-ref for the If you prefer to use your own reference number for this case, you can enter it here. (Optional) field
    And I click the Continue button

    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    When I click the Case details tab
    Then I should see A123456 for the Home Office reference number field
    And I should see 31 Oct 2018 for the Date on the decision letter field
    And I should see Mr for the Title field
    And I should see José for the Given names field
    And I should see González for the Last name field
    And I should see 31 Dec 1999 for the Date of birth field
    And Within the Nationality collection, I should see Finland for the first Nationality field
    And Within the Nationality collection, I should see Iceland for the second Nationality field
    And I should see Yes for the Does the appellant have a fixed address? field
    And Within the Address fieldset, I should see 10 Downing Street for the Building and Street field
    And Within the Address fieldset, I should see London for the Town or City field
    And Within the Address fieldset, I should see SW1A 2AA for the Postcode/Zipcode field
    And Within the Address fieldset, I should see United Kingdom for the Country field
    And I should see My client's protection claim was refused for the Appeal reason field
    And I should see Yes for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    And I should see Birth of a child for the New matters field
    And I should see New relationship for the New matters field
    And I should see Removal would disrupt family life for the New matters field
    And I should see Appellant now claims to be a refugee for the New matters field
    And I should see New marriage for the New matters field
    And I should see Yes for the Other appeals field
    And Within the Appeal number collection, I should see 1234 for the first Appeal number field
    And Within the Appeal number collection, I should see 5678 for the second Appeal number field
    And I should see some-ref for the If you prefer to use your own reference number for this case, you can enter it here. field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (without a fixed address)

    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page

    Given I am on the Your client's address page
    When I select No for the Does the appellant have a fixed address? field
    And I click the Continue button

    Given I complete the Why is your client appealing? page
    And I complete the New matters page
    And I complete the Has your client appealed against any other UK immigration decisions? page
    And I complete the Your own reference number page
    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    When I click the Case details tab
    Then I should see No for the Does the appellant have a fixed address? field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (protection status revoked)

    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page
    And I complete the Your client's address page

    Given I am on the Why is your client appealing? page
    When I select My client's protection status was revoked for the Appeal reason field
    And I click the Continue button

    Given I complete the New matters page
    And I complete the Has your client appealed against any other UK immigration decisions? page
    And I complete the Your own reference number page
    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    When I click the Case details tab
    Then I should see My client's protection status was revoked for the Appeal reason field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (without providing legal representative reference number)

    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page
    And I complete the Your client's address page
    And I complete the Why is your client appealing? page
    And I complete the New matters page
    And I complete the Has your client appealed against any other UK immigration decisions? page

    Given I am on the Your own reference number page
    When I click the Continue button
    And I click the Save and continue button
    Then I should see an alert confirming the case has been created

    When I click the Case details tab
    Then I should not see the If you prefer to use your own reference number for this case, you can enter it here. field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (no new matters)

    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page
    And I complete the Your client's address page
    And I complete the Why is your client appealing? page

    Given I am on the New matters page
    When I select No for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    And I click the Continue button

    Given I complete the Has your client appealed against any other UK immigration decisions? page
    And I complete the Your own reference number page
    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    When I click the Case details tab
    Then I should see No for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    Then I should not see the New matters field

  @create-case @lodge-appeal @alternate
  Scenario Outline: Lodge an appeal application (no known other appeals)

    Given I am signed in as a Legal Rep
    And I create a new case
    And I complete the screening questions page
    And I complete the Home Office reference page
    And I complete the Basic details page
    And I complete the Your client's address page
    And I complete the Why is your client appealing? page
    And I complete the New matters page

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    When I select <otherAppeals> for the Other appeals field
    And I click the Continue button

    Given I complete the Your own reference number page
    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    When I click the Case details tab
    Then I should see <otherAppeals> for the Other appeals field

    Examples:
      | otherAppeals                           |
      | Yes, but I don't have an appeal number |
      | No                                     |
      | I'm not sure                           |
