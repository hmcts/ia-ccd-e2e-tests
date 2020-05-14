Feature: Decision without a hearing from respondent review

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review

  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    Then I should see the `Overview` page
    And I should see the text `has been updated with event: Decision without a hearing`


  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing
    When I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I click the `Directions` tab
    And I should see the `Directions` page
    And within the `Directions` collection's first item, I should see `The appeal is going to a hearing and you should tell the Tribunal if the appellant has any hearing requirements.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
      When I select the `Decision without a hearing` Next step
      Then I am on the `Decision without a hearing` page
      And I click the `Decision` button
      Then I should see the `Overview` page
      And I should see the text `has been updated with event: Decision without a hearing`

  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing
    When I add the appeal response
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Case Officer`
    Then I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    Then I should see the `Overview` page
    And I should see the text `has been updated with event: Decision without a hearing`
