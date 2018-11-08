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
    Given I create a new case

    Given I am on the Home Office reference page
    When I type A123456/001 for the Home Office reference number field
    When I type 31-10-2018 for the Date on the decision letter field
    When I click the Continue button

    Given I am on the Basic details page
    When I type Mr for the Title field
    When I type José for the Given names field
    When I type González for the Last name field
    When I type 31-12-1999 for the Date of birth field
    When I add a new item to the Nationality collection
    When Within the Nationality collection, I select Finland for the first Nationality field
    When I add another new item to the Nationality collection
    When Within the Nationality collection, I select Iceland for the second Nationality field
    When I select No for the My client's nationality is not agreed field
    When I click the Continue button

    Given I am on the Your client's address page
    When I select Yes for the Does the appellant have a fixed address? field
    When I type SW1A 2AA for the Enter a UK postcode field
    When I click the Find address button
    When I select 10 Downing Street, London for the Select an address field
    When I click the Continue button

    Given I am on the Why is your client appealing? page
    When I select My client's protection claim was refused for the Appeal reason field
    When I click the Continue button

    Given I am on the New matters page
    When I select Yes for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    When I select Birth of a child from the New matters field
    When I select New relationship from the New matters field
    When I select Removal would disrupt family life from the New matters field
    When I select Appellant now claims to be a refugee from the New matters field
    When I select New marriage from the New matters field
    When I click the Continue button

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    When I select Yes for the Other appeals field
    When I click the Continue button

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    When I add a new item to the Appeal number collection
    When Within the Appeal number collection, I type 1234 for the first Appeal number field
    When I add a new item to the Appeal number collection
    When Within the Appeal number collection, I type 5678 for the second Appeal number field
    When I click the Continue button

    Given I am on the Your own reference number page
    When I type some-ref for the If you prefer to use your own reference number for this case, you can enter it here. (Optional) field
    When I click the Continue button

    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see A123456/001 for the Home Office reference number field
    Then I should see 31 Oct 2018 for the Date on the decision letter field
    Then I should see Mr for the Title field
    Then I should see José for the Given names field
    Then I should see González for the Last name field
    Then I should see 31 Dec 1999 for the Date of birth field
    Then Within the Nationality collection, I should see Finland for the first Nationality field
    Then Within the Nationality collection, I should see Iceland for the second Nationality field
    Then I should see No for the My client's nationality is not agreed field
    Then I should see Yes for the Does the appellant have a fixed address? field
    Then Within the Address fieldset, I should see 10 Downing Street for the Building and Street field
    Then Within the Address fieldset, I should see London for the Town or City field
    Then Within the Address fieldset, I should see SW1A 2AA for the Postcode/Zipcode field
    Then Within the Address fieldset, I should see United Kingdom for the Country field
    Then I should see My client's protection claim was refused for the Appeal reason field
    Then I should see Yes for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    Then I should see Birth of a child for the New matters field
    Then I should see New relationship for the New matters field
    Then I should see Removal would disrupt family life for the New matters field
    Then I should see Appellant now claims to be a refugee for the New matters field
    Then I should see New marriage for the New matters field
    Then I should see Yes for the Other appeals field
    Then Within the Appeal number collection, I should see 1234 for the first Appeal number field
    Then Within the Appeal number collection, I should see 5678 for the second Appeal number field
    Then I should see some-ref for the If you prefer to use your own reference number for this case, you can enter it here. field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (without a fixed address)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Home Office reference page
    Given I complete the Basic details page

    Given I am on the Your client's address page
    When I select No for the Does the appellant have a fixed address? field
    When I click the Continue button

    Given I complete the Why is your client appealing? page
    Given I complete the New matters page
    Given I complete the Has your client appealed against any other UK immigration decisions? page
    Given I complete the Your own reference number page
    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see No for the Does the appellant have a fixed address? field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (protection status revoked)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Home Office reference page
    Given I complete the Basic details page
    Given I complete the Your client's address page

    Given I am on the Why is your client appealing? page
    When I select My client's protection status was revoked for the Appeal reason field
    Then I click the Continue button

    Given I complete the New matters page
    Given I complete the Has your client appealed against any other UK immigration decisions? page
    Given I complete the Your own reference number page
    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see My client's protection status was revoked for the Appeal reason field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (without providing legal representative reference number)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Home Office reference page
    Given I complete the Basic details page
    Given I complete the Your client's address page
    Given I complete the Why is your client appealing? page
    Given I complete the New matters page
    Given I complete the Has your client appealed against any other UK immigration decisions? page

    Given I am on the Your own reference number page
    When I click the Continue button

    And I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then the If you prefer to use your own reference number for this case, you can enter it here. field should be empty

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (no new matters)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Home Office reference page
    Given I complete the Basic details page
    Given I complete the Your client's address page
    Given I complete the Why is your client appealing? page

    Given I am on the New matters page
    When I select No for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    Then I click the Continue button

    Given I complete the Has your client appealed against any other UK immigration decisions? page
    Given I complete the Your own reference number page
    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see No for the Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay? field
    Then I should not see the New matters field

  @create-case @lodge-appeal @alternate
  Scenario Outline: Lodge an appeal application (no known other appeals)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Home Office reference page
    Given I complete the Basic details page
    Given I complete the Your client's address page
    Given I complete the Why is your client appealing? page
    Given I complete the New matters page

    Given I am on the Has your client appealed against any other UK immigration decisions? page
    When I select <otherAppeals> for the Other appeals field
    When I click the Continue button

    Given I complete the Your own reference number page
    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see <otherAppeals> for the Other appeals field

    Examples:
      | otherAppeals                           |
      | Yes, but I don't have an appeal number |
      | No                                     |
      | I'm not sure                           |
