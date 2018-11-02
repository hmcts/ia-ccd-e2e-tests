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

  @create-case @lodge-appeal
  Scenario: Lodge an appeal application (happy path)

    Given I am signed in as a Legal Rep
    Given I create a new case

    Given I am on the Basic details page
    When I type Mr for the Title field
    When I type José for the Given names field
    When I type González for the Last name field
    When I type 31 12 1999 for the Date of birth field
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

    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
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

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (without a fixed address)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Basic details page

    Given I am on the Your client's address page
    When I select No for the Does the appellant have a fixed address? field
    When I click the Continue button

    Given I complete the Why is your client appealing? page
    When I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see No for the Does the appellant have a fixed address? field

  @create-case @lodge-appeal @alternate
  Scenario: Lodge an appeal application (without a fixed address)

    Given I am signed in as a Legal Rep
    Given I create a new case
    Given I complete the Basic details page
    Given I complete the Your client's address page

    Given I am on the Why is your client appealing? page
    When I select My client's protection status was revoked for the Appeal reason field
    Then I click the Continue button

    Given I click the Save and continue button
    Then I should see an alert confirming the case has been created

    Given I click the Case details tab
    Then I should see My client's protection status was revoked for the Appeal reason field
