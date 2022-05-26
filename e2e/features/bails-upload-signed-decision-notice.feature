Feature: Upload signed decision notice
  Background:
    Given I am signed in as a `Home Office Generic`
    And I create a new bail application
    And I save my initial application as a `Home Office Generic` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Home Office Generic`
    And I upload the bail summary
    And I switch to be a `Admin Officer`

  @upload-signed-decision-notice @upload-signed-decision-notice-refused
  Scenario: Upload signed decision notice for refused case
    When I record a refused decision with SS consent Yes with no financial condition supporters
    And I select the `Upload signed decision notice` Next step
    Then I am on the `Upload document` page
    When I upload `{@SignedDecisionNoticeRefused.pdf}` for the `Decision document` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `SignedDecisionNoticeRefused.pdf` for the `Decision document` field
    When I click the `Upload` button
    And I should see the text `You uploaded the signed decision notice`
    And I should see the text `The signed decision notice is available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload signed decision notice`
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `SignedDecisionNoticeRefused.pdf` for the `Decision document` field

  @upload-signed-decision-notice @upload-signed-decision-notice-granted
  Scenario: Upload signed decision notice for granted case
    When I record a granted decision with SS consent No with no financial condition supporters
    Then I select the `Upload signed decision notice` Next step
    Then I am on the `Upload document` page
    When I upload `{@SignedDecisionNoticeGranted.pdf}` for the `Decision document` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `SignedDecisionNoticeGranted.pdf` for the `Decision document` field
    When I click the `Upload` button
    And I should see the text `You uploaded the signed decision notice`
    And I should see the text `The signed decision notice is available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload signed decision notice`
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `SignedDecisionNoticeGranted.pdf` for the `Decision document` field

  @upload-signed-decision-notice @upload-signed-decision-notice-conditional-grant
  Scenario: Upload signed decision notice for conditional grant case
    When I record a conditional grant decision with SS consent Yes with no financial condition supporters
    Then I select the `Upload signed decision notice` Next step
    Then I am on the `Upload document` page
    When I upload `{@SignedDecisionNoticeGranted.pdf}` for the `Decision document` field
    And I wait for 5 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `SignedDecisionNoticeGranted.pdf` for the `Decision document` field
    When I click the `Upload` button
    And I should see the text `You uploaded the signed decision notice`
    And I should see the text `The signed decision notice is available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload signed decision notice`
    And I should see the text `This application has been decided. The decision notice is available in the documents tab.`
    And I should see `SignedDecisionNoticeGranted.pdf` for the `Decision document` field
