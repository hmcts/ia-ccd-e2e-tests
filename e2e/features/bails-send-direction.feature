Feature: Bails Send direction
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`

  @bails-full @RIA-5771 @bails-send-direction @bails-send-direction-to-applicant @bails-send-direction-to-applicant-AO @bail-nightly-test
  Scenario: Send a direction to Applicant as an Admin Officer
    When I switch to be a `Admin Officer Bails`
    And I select the `Send direction` Next step
    Then I am on the `Direction details` page
    And The page is accessible
    When I type `This is a test direction to the Applicant` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving direction to?` field
    And I type `{$TODAY+8|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `This is a test direction to the Applicant` for the `Explain the direction you are issuing` field
    And I should see `Legal representative` in the `Who are you giving direction to?` field
    And I should see `{$TODAY+8|D MMM YYYY}` in the `By what date must they comply?` field
    When I click the `Send the direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `This is a test direction to the Applicant` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Party` field
    And within the `Directions` collection's first item, I should see `{$TODAY+8|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @bails-full @RIA-5771 @bails-send-direction @bails-send-direction-to-LR @bails-send-direction-to-LR-AO @bails-regression
  Scenario: Send a direction to Legal Representative as an Admin Officer
    When I switch to be a `Admin Officer Bails`
    And I select the `Send direction` Next step
    Then I am on the `Direction details` page
    And The page is accessible
    When I type `This is a test direction to the Legal Rep` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving direction to?` field
    And I type `{$TODAY+6|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `This is a test direction to the Legal Rep` for the `Explain the direction you are issuing` field
    And I should see `Legal representative` in the `Who are you giving direction to?` field
    And I should see `{$TODAY+6|D MMM YYYY}` in the `By what date must they comply?` field
    When I click the `Send the direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `This is a test direction to the Legal Rep` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Party` field
    And within the `Directions` collection's first item, I should see `{$TODAY+6|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @bails-full @RIA-5771 @bails-send-direction @bails-send-direction-to-HO @bails-send-direction-to-HO-AO
  Scenario: Send a direction to Home Office as an Admin Officer
    When I switch to be a `Admin Officer Bails`
    And I select the `Send direction` Next step
    Then I am on the `Direction details` page
    And The page is accessible
    When I type `This is a test direction to the Home Office` for the `Explain the direction you are issuing` field
    And I select `Home Office` for the `Who are you giving direction to?` field
    And I type `{$TODAY+4|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `This is a test direction to the Home Office` for the `Explain the direction you are issuing` field
    And I should see `Home Office` in the `Who are you giving direction to?` field
    And I should see `{$TODAY+4|D MMM YYYY}` in the `By what date must they comply?` field
    When I click the `Send the direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `This is a test direction to the Home Office` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Home Office` for the `Party` field
    And within the `Directions` collection's first item, I should see `{$TODAY+4|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @bails-full @RIA-5771 @bails-send-direction @bails-send-direction-to-applicant @bails-send-direction-to-applicant-judge @bails-regression
  Scenario: Send a direction to Applicant as a Judge
    When I switch to be a `Judge Bails`
    And I select the `Send direction` Next step
    Then I am on the `Direction details` page
    And The page is accessible
    When I type `This is a test direction to the Applicant` for the `Explain the direction you are issuing` field
    And I select `Applicant` for the `Who are you giving direction to?` field
    And I type `{$TODAY+3|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `This is a test direction to the Applicant` for the `Explain the direction you are issuing` field
    And I should see `Applicant` in the `Who are you giving direction to?` field
    And I should see `{$TODAY+3|D MMM YYYY}` in the `By what date must they comply?` field
    When I click the `Send the direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `This is a test direction to the Applicant` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Applicant` for the `Party` field
    And within the `Directions` collection's first item, I should see `{$TODAY+3|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @bails-full @RIA-5771 @bails-send-direction @bails-send-direction-to-LR @bails-send-direction-to-LR-judge
  Scenario: Send a direction to Legal Representative as a Judge
    When I switch to be a `Judge Bails`
    And I select the `Send direction` Next step
    Then I am on the `Direction details` page
    And The page is accessible
    When I type `This is a test direction to the Legal Rep` for the `Explain the direction you are issuing` field
    And I select `Legal representative` for the `Who are you giving direction to?` field
    And I type `{$TODAY+2|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `This is a test direction to the Legal Rep` for the `Explain the direction you are issuing` field
    And I should see `Legal representative` in the `Who are you giving direction to?` field
    And I should see `{$TODAY+2|D MMM YYYY}` in the `By what date must they comply?` field
    When I click the `Send the direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `This is a test direction to the Legal Rep` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Legal representative` for the `Party` field
    And within the `Directions` collection's first item, I should see `{$TODAY+2|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @bails-full @RIA-5771 @bails-send-direction @bails-send-direction-to-HO @bails-send-direction-to-HO-judge
  Scenario: Send a direction to Home Office as a Judge
    When I switch to be a `Judge Bails`
    And I select the `Send direction` Next step
    Then I am on the `Direction details` page
    And The page is accessible
    When I type `This is a test direction to the Home Office` for the `Explain the direction you are issuing` field
    And I select `Home Office` for the `Who are you giving direction to?` field
    And I type `{$TODAY+1|DD MM YYYY}` for the `By what date must they comply?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `This is a test direction to the Home Office` for the `Explain the direction you are issuing` field
    And I should see `Home Office` in the `Who are you giving direction to?` field
    And I should see `{$TODAY+1|D MMM YYYY}` in the `By what date must they comply?` field
    When I click the `Send the direction` button
    Then I should see the text `You have sent a direction`
    And I should see the text `You can see the status of the direction in the directions tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `This is a test direction to the Home Office` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Home Office` for the `Party` field
    And within the `Directions` collection's first item, I should see `{$TODAY+1|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
