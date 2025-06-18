Feature: Bails Upload Bail Summary
 Background:
   Given I am signed in as a `Legal Org User Rep A Bails`
   And I create a new bail application
   And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
   And I submit my bail application as a `Legal Rep`
   And I should see the text `What happens next`
   # Listing steps need to go here
    And I switch to be a `Admin Officer Bails`
    And I list the bail case
    
   @upload-bail-summary @RIA-5707 @bails-full @bails-regression @bails-summarytest 
  Scenario: Upload the Bail Summary as the Home Office
    When I switch to be a `Home Office Bails`
    And I select the `Upload Bail Summary` Next step
    Then I am on the `Upload summary` page
    And The page is accessible
    When I complete the `Upload Bail Summary` page
    And I click the `Continue` button
    Then I see the text `Check your answers`
    When I click the `Upload` button

    Then I should see the text `You have uploaded the Bail Summary`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I should see the text `The Bail Summary has been uploaded and is available`
    When I click the `Documents` tab
    Then within the `Home Office documents` collection's first item, I should see `BailSummary.pdf` in the `Document` field
    And within the `Home Office documents` collection's first item, I should see `This is the bail summary` in the `Description` field