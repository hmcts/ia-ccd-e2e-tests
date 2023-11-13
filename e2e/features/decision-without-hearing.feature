Feature: Decision without a hearing from respondent review

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review

  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing respondentReview
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`


  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing from listing
    When I add the appeal response
    And I request hearing requirements
    And I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `The appeal is going to a hearing and you should tell the Tribunal if the appellant has any hearing requirements.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+5|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`

  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing from submitHearingRequirements
    When I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Case Officer`
    Then I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`

  @RIA-2122
  Scenario: Case Officer makes a decision without a hearing after adjourned
  When I add the appeal response
  And I request hearing requirements
  And I switch to be a `Legal Org User Rep A`
  And I submit hearing requirements with all yes when in country
  And I switch to be a `Case Officer`
  And I record agreed hearing requirements yes path
  And I switch to be a `Admin Officer`
  And I list the case
  And I switch to be a `Case Officer`
  When I select the `Adjourn hearing without a date` Next step
  Then I am on the `Adjourn hearing without a date` page
  And I should see the text `Reasons for adjournment`
  And I should see the text `This will be visible to both parties`
  And the `Continue` button is disabled

  When I type `some reasons for adjournment` for the `Reasons for adjournment` field
  And I click the `Continue` button
  Then I am on the `Adjourn hearing without a date` page
  And I should see the text `Check your answers`
  And I should see the text `Reasons for adjournment`
  And I should see the text `some reasons for adjournment`

  When I click the `Adjourn` button
  Then I should see the text `The hearing has been adjourned`
  And I should see the text `Both parties will be notified and a Notice of Adjournment will be generated.`

  When I click the `Close and Return to case details` button if present
  Then I select the `Decision without a hearing` Next step
  Then I am on the `Decision without a hearing` page
  And I click the `Decision` button
  And I should see the text `has been updated with event: Decision without a hearing`

  @RIA-4473
  Scenario: Case Officer makes a decision without a hearing respondentReview and generateHearingBundle after
    When I select the `Decision without a hearing` Next step
    Then I am on the `Decision without a hearing` page
    And I click the `Decision` button
    And I should see the text `has been updated with event: Decision without a hearing`
    And I generate the hearing bundle
    And I wait for 10 seconds
    And I reload the Case Overview Page
    Then I should see the text `Do this next`
    Then I should see the text `You can start to create the decision and reasons document.`

