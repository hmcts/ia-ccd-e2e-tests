Feature: Submit & update hearing requirements (summarised step flow) - Giving evidence from outside the UK (out of country appeal)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my out of country `now` appeal with decision type `refusalOfHumanRights` with address `No` and with sponsor `No`
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements

  @RIA-3825 @RIA-3825-out-of-country-no-flow @out-of-country-submit-hearing-requirements-giving-evidence-no-path
  Scenario: Submit & update hearing requirements (summarised step flow) - Giving evidence from outside the UK (out of country appeal) - No path

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all no when out of country

    # Review hearing requirements (placeholder)
    # This flow requires testing for the field display changes
    When I switch to be a `Case Officer`
    And I click the `review and submit` link
    And I should see the `Hearing requirements` page
    And I select `6 hours` for the `Length` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length` field
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    And I switch to be a `Admin Officer`
    And I list the case

    # Update hearing requirements
    And I switch to be a `Case Officer
    And I update hearing requirements with all no when out of country
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Requirements and requests` collection's second item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Update hearing adjustments (placeholder)
    # This flow requires testing for the field display changes
    When I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page
    And I select `6 hours` for the `Length` field
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Continue` button
    And I click the `Update` button
    And I click the `Close and Return to case details` button


  @RIA-3825 @RIA-3825-out-of-country-yes-flow @out-of-country-submit-hearing-requirements-giving-evidence-yes-path
  Scenario: Submit & update hearing requirements (summarised step flow) - Giving evidence from outside the UK (out of country appeal) - Yes path

    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when out of country

    # Review hearing requirements (placeholder)
    # This flow requires testing for the field display changes
    When I switch to be a `Case Officer`
    And I click the `review and submit` link
    And I should see the `Hearing requirements` page
    And I select `6 hours` for the `Length` field
    And I click the `Continue` button
    And I type `Remote hearing requirement will be reviewed` for the `Remote hearing` field
    And I click the `Continue` button
    And I type `Physical or mental health conditions will be reviewed` for the `Adjustments to accommodate vulnerabilities` field
    And I click the `Continue` button
    And I type `Multimedia equipment requirement will be reviewed` for the `Multimedia equipment` field
    And I click the `Continue` button
    And I type `Single sex court requirement will be reviewed` for the `Single-sex court` field
    And I click the `Continue` button
    And I type `Private hearing requirement will be reviewed` for the `In camera court` field
    And I click the `Continue` button
    And I type `Additional adjustments requirement will be reviewed` for the `Other adjustments` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `6 hours` for the `Length` field
    And I click the `Submit` button
    And I click the `Close and Return to case details` button

    And I switch to be a `Admin Officer`
    And I list the case

    # Update hearing requirements
    And I switch to be a `Case Officer
    And I update hearing requirements with all yes when out of country
    When I click the `Hearing and appointment` tab
    Then I should see the `Hearing and appointment` page
    And I should see the `Requirements and requests` field
    And within the `Requirements and requests` collection's first item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Requirements and requests` collection's second item, I should see `-Gonzlez-hearing-requirements.PDF` in the `Document` field
    And within the `Requirements and requests` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Update hearing adjustments (placeholder)
    # This flow requires testing for the field display changes
    When I select the `Update hearing adjustments` Next step
    Then I am on the `Update hearing adjustments` page
    And I select `6 hours` for the `Length` field
    And I click the `Continue` button
    And I type `Remote hearing requirement will be reviewed - updated` for the `Remote hearing` field
    And I click the `Continue` button
    And I type `Physical or mental health conditions will be reviewed - updated` for the `Adjustments to accommodate vulnerabilities` field
    And I click the `Continue` button
    And I type `Multimedia equipment requirement will be reviewed - updated` for the `Multimedia equipment` field
    And I click the `Continue` button
    And I type `Single sex court requirement will be reviewed - updated` for the `Single-sex court` field
    And I click the `Continue` button
    And I type `Private hearing requirement will be reviewed - updated` for the `In camera court` field
    And I click the `Continue` button
    And I type `Additional adjustments requirement will be reviewed - updated` for the `Other adjustments` field
    And I click the `Continue` button
    And I click the `Update` button
    And I click the `Close and Return to case details` button

