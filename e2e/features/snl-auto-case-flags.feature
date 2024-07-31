  Feature: SnL Flow Auto creation of caseflags

   Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 12 seconds
    And I click the `Close and Return to case details` button
    And I wait for 5 second
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by Card
    And I wait for 15 seconds
    And I switch to be a `Case Officer`
    And I wait for 10 seconds
    And I request home office data
    And I request respondent evidence
    And I wait for 3 seconds
    And I progress case to force request case building
    And I request Force case - case under review
    And I request respondent review
    And I request Force case - hearing reqs
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
    And I record agreed hearing requirements yes path
 
  @nightly-test @snl 
  Scenario: SnL flow Auto case flags appear in Case flags Tab

    When I goto the `Case flags` tab
    And I wait for 8 seconds
    And I should see the text `Case flags`

    And within the `José González` collection's first item, I should see case flag name `Step free / wheelchair access` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Hearing loop (hearing enhancement system)` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Sign Language British Sign Language (BSL)` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Evidence given in private` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `José González` collection's first item, I should see case flag name `Language Interpreter Korean` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

    And within the `Jenny Bat 1` collection's first item, I should see case flag name `Sign Language Lipspeaker` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `Jenny Bat 1` collection's first item, I should see case flag name `Language Interpreter Brong` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

    And within the `krish 2` collection's first item, I should see case flag name `Sign Language Notetaker` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
    And within the `krish 2` collection's first item, I should see case flag name `Language Interpreter Akan` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

    And within the `ramesh 3` collection's first item, I should see case flag name `Sign Language Visual frame signing` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`

    And within the `Case level flags` collection's first item, I should see case flag name `RRO (Restricted Reporting Order / Anonymisation)` and comments "" creation date `{$TODAY|D MMM YYYY}` last modified ` ` flag status `ACTIVE`
