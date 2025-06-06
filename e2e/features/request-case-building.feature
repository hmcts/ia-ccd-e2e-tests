Feature: Request case edit

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I switch to be a `Home Office APC`

  @regression @request-case-building @RIA-1789 @RIA-2694
  Scenario: Send direction to appellant for building their case

    When I click the `Overview` tab
    Then I should see the image `homeOffice_uploadBundle.svg`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle.`
    And I click the `upload the Home Office bundle` link
    And I am on the `Upload Home Office bundle` page
    When I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` document field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the respondent evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Upload Home Office bundle` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I should see `This is the respondent evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I switch to be a `Case Officer`
    Then I click the `Overview` tab
    And I should see the text `If it complies with the procedure rules and practice directions, direct the legal representative to build their case.`

    And I click the `direct the legal representative to build their case` link
    Then I am on the `Request case building` page
    And I should see `You must now build your case to enable the respondent to conduct a thorough review of their decision.` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+42}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `You must now build your case to enable the respondent to conduct a thorough review of their decision.` in the `Explain the direction you are issuing` field
    And I should see `Legal representative` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+42|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `What happens next`
    And I should see the text `Legal representative will be notified by email.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `You must now build your case to enable the respondent to conduct a thorough review of their decision.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` in the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+42|D MMM YYYY} in the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY} in the `Date sent` field

    When I switch to be a `Legal Rep`
    Then I should see the image `progress_legalRep_caseBuilding.png`

