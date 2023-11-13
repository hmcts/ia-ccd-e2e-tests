Feature: Bails Upload signed decision notice
  Background:
    Given I am signed in as a `Home Office Bails`
    And I wait for 10 seconds
   And I create a new bail application
    And I save my initial application as a `Home Office Bails` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Home Office Bails`
    And I upload the bail summary

  @bails-upload-signed-decision-notice @bails-full @RIA-5759 @bails-upload-signed-decision-notice-refused @bails-regression
  Scenario: Upload signed decision notice for refused case
    Given I switch to be a `Admin Officer Bails`
    When I record a refused decision with SS consent Yes with no financial condition supporters
    And I select the `Upload signed decision notice` Next step
    Then I am on the `Upload document` page
    And The page is accessible
    When I upload `{@SignedDecisionNoticeRefused.pdf}` for the `Decision document` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `SignedDecisionNoticeRefused.pdf` for the `Decision document` field
    When I click the `Upload` button
    And I should see the text `You uploaded the signed decision notice`
    And I should see the text `The signed decision notice is available to view in the documents tab.`
    When I click the `Close and Return to case details` button if present
    
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `Pugh-decision-notice.pdf` for the `Decision document` field

  @bails-upload-signed-decision-notice @bails-full @RIA-5759 @bails-upload-signed-decision-notice-granted
  Scenario: Upload signed decision notice for granted case
    Given I switch to be a `Admin Officer Bails`
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
    
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `Pugh-decision-notice.pdf` for the `Decision document` field

  @bails-upload-signed-decision-notice @bails-full @RIA-5759 @bails-upload-signed-decision-notice-conditional-grant
  Scenario: Upload signed decision notice for conditional grant case
    Given I switch to be a `Admin Officer Bails`
    When I record a conditional grant decision with SS consent Yes with no financial condition supporters
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
    
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `Pugh-decision-notice.pdf` for the `Decision document` field

  @bails-upload-signed-decision-notice @bails-full @RIA-5759 @bails-upload-signed-decision-notice-judge
  Scenario: Upload signed decision notice as Judge
    Given I switch to be a `Admin Officer Bails`
    When I record a refused decision with SS consent Yes with no financial condition supporters
    And I switch to be a `Judge Bails`
    And I select the `Upload signed decision notice` Next step
    Then I am on the `Upload document` page
    And The page is accessible
    When I upload `{@SignedDecisionNoticeRefused.pdf}` for the `Decision document` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `SignedDecisionNoticeRefused.pdf` for the `Decision document` field
    When I click the `Upload` button
    And I should see the text `You uploaded the signed decision notice`
    And I should see the text `The signed decision notice is available to view in the documents tab.`
    When I click the `Close and Return to case details` button if present
    
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `Pugh-decision-notice.pdf` for the `Decision document` field
