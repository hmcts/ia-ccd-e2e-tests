Feature: Bails case relisting bails application
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`
    And I wait for 5 seconds
    And I switch to be a `Admin Officer Bails`
    And I wait for 5 seconds
    And I list the bail case
@bails-end-the-application @bails-relist
Scenario: case relising after bails upload summary
  When I switch to be a `Home Office Bails`
    And I select the `Upload Bail Summary` Next step
    Then I am on the `Upload summary` page
    And The page is accessible
    When I complete the `Upload Bail Summary` page
    And I click the `Continue` button
    Then I see the text `Check your answers`
    When I click the `Upload` button
    And I wait for 15 seconds
    Then I should see the text `You have uploaded the Bail Summary`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    When I switch to be a `Admin Officer Bails`
    And I wait for 5 seconds
   And  I relist the bail case
    When I record a granted decision with SS consent No with no financial condition supporters
    Then I select the `Upload signed decision notice` Next step
    Then I am on the `Upload document` page
    And The page is accessible
    When I upload `{@SignedDecisionNoticeGranted.pdf}` for the `Decision document` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `SignedDecisionNoticeGranted.pdf` for the `Decision document` field
    When I click the `Upload` button
    And I should see the text `You uploaded the signed decision notice`
    And I should see the text `The signed decision notice is available to view in the documents tab.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `Pugh-decision-notice.pdf` for the `Decision document` field