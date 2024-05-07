Feature: Bails End the application
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`

  @bails-end-the-application @bails-full @RIA-5760 @bails-end-the-application-withdrawn @bails-end-the-application-post-submit @bails-regression @nightly-test @bails
  Scenario: End Application after submitting
    When I switch to be a `Admin Officer Bails`
    And I select the `End the application` Next step
    Then I am on the `Outcome and reasons` page
    And The page is accessible
    When I click the `Withdrawn` label
    And I type `Withdrawn because it was needed for the test.` for the `Reasons` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Withdrawn` for the `Outcome` field
    And I should see `Withdrawn because it was needed for the test.` for the `Reasons` field
    When I click the `End application` button
    Then I should see the text `You have ended the application`
    And I should see the text `A notification has been sent to all parties. No further action is required.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `No further action is required on this application.`
    And I should see `Withdrawn` for the `Outcome` field
    And I should see `Withdrawn because it was needed for the test.` for the `Reasons` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date application ended` field
    When I click the `Documents` tab
    Then within the `Tribunal documents` collection's first item, I should see `Pugh-ended-application-notice.PDF` for the `Document` field

  @bails-end-the-application @bails-full @RIA-5760 @bails-end-the-application-dismissed @bails-end-the-application-post-bail-summary 
  Scenario: End Application after uploading bail summary
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer Bails`
    And I select the `End the application` Next step
    Then I am on the `Outcome and reasons` page
    And The page is accessible
    And I click the `Bail dismissed without a hearing` label
    When I type `Dismissed because it was needed for the test.` for the `Reasons` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Bail dismissed without a hearing` for the `Outcome` field
    And I should see `Dismissed because it was needed for the test.` for the `Reasons` field
    When I click the `End application` button
    Then I should see the text `You have ended the application`
    And I should see the text `A notification has been sent to all parties. No further action is required.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `No further action is required.`
    And I should see `Bail dismissed without a hearing` for the `Outcome` field
    And I should see `Dismissed because it was needed for the test.` for the `Reasons` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date application ended` field
    When I click the `Documents` tab
    Then within the `Tribunal documents` collection's first item, I should see `Pugh-ended-application-notice.PDF` for the `Document` field

  @bails-end-the-application @bails-full @RIA-5760 @bails-end-the-application-not-in-detention @bails-end-the-application-post-record-decision
  Scenario: End Application after recording a decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer Bails`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I select the `End the application` Next step
    Then I am on the `Outcome and reasons` page
    And The page is accessible
    And I click the `Not in immigration detention` label
    When I type `Not in detention because it was needed for the test.` for the `Reasons` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Not in immigration detention` for the `Outcome` field
    And I should see `Not in detention because it was needed for the test.` for the `Reasons` field
    When I click the `End application` button
    Then I should see the text `You have ended the application`
    And I should see the text `A notification has been sent to all parties. No further action is required.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `No further action is required.`
    And I should see `Not in immigration detention` for the `Outcome` field
    And I should see `Not in detention because it was needed for the test.` for the `Reasons` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date application ended` field
    When I click the `Documents` tab
    Then within the `Tribunal documents` collection's first item, I should see `Pugh-ended-application-notice.PDF` for the `Document` field

  @bails-end-the-application @bails-full @RIA-5760 @bails-end-the-application-not-in-detention @bails-end-the-application-post-upload-signed-decision-notice
  Scenario: End Application after uploading signed decision notice for a conditional bail
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer Bails`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant
    And I select the `End the application` Next step
    Then I am on the `Outcome and reasons` page
    And The page is accessible
    And I click the `Not in immigration detention` label
    When I type `Not in detention because it was needed for the test.` for the `Reasons` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And The page is accessible
    And I should see `Not in immigration detention` for the `Outcome` field
    And I should see `Not in detention because it was needed for the test.` for the `Reasons` field
    When I click the `End application` button
    Then I should see the text `You have ended the application`
    And I should see the text `A notification has been sent to all parties. No further action is required.`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see the text `No further action is required.`
    And I should see `Not in immigration detention` for the `Outcome` field
    And I should see `Not in detention because it was needed for the test.` for the `Reasons` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date application ended` field
    When I click the `Documents` tab
    Then within the `Tribunal documents` collection's first item, I should see `Pugh-ended-application-notice.PDF` for the `Document` field
