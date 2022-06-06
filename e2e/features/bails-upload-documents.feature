Feature: Upload Documents
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`

  @bails-upload-documents @RIA-5769 @bails-upload-documents-post-submit
  Scenario: Upload Documents after submitting
    When I select the `Upload documents` Next step
    Then I am on the `Upload` page
    When I click the `Add new` button
    And within the `Upload documents` collection's first item, I upload `{@BailsExampleDocument.pdf}` for the `Upload a file` field
    And within the `Upload documents` collection's first item, I type `This is the a bails document that is being uploaded by the LR after submitting.` for the `Describe the document` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Upload documents` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Upload documents` collection's first item, I should see `This is the a bails document that is being uploaded by the LR after submitting.` in the `Describe the document` field
    When I click the `Upload` button
    Then I should see the text `Your upload is complete`
    And I should see the text `The document(s) you uploaded are available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload documents`
    When I click the `Documents` tab
    And within the `Applicant documents` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Applicant documents` collection's first item, I should see `This is the a bails document that is being uploaded by the LR after submitting.` in the `Description` field
    And within the `Applicant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @bails-upload-documents @RIA-5769 @bails-upload-documents-post-bail-summary
  Scenario: Upload Documents after uploading bail summary
    When I switch to be a `Home Office Generic`
    And I upload the bail summary
    When I select the `Upload documents` Next step
    Then I am on the `Upload` page
    When I click the `Add new` button
    And within the `Upload documents` collection's first item, I upload `{@BailsExampleDocument.pdf}` for the `Upload a file` field
    And within the `Upload documents` collection's first item, I type `This is the a bails document that is being uploaded by the HO after uploading bail summary.` for the `Describe the document` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Upload documents` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Upload documents` collection's first item, I should see `This is the a bails document that is being uploaded by the HO after uploading bail summary.` in the `Describe the document` field
    When I click the `Upload` button
    Then I should see the text `Your upload is complete`
    And I should see the text `The document(s) you uploaded are available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload documents`
    When I click the `Documents` tab
    And within the `Home Office documents` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Home Office documents` collection's first item, I should see `This is the a bails document that is being uploaded by the HO after uploading bail summary.` in the `Description` field
    And within the `Home Office documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @bails-upload-documents @RIA-5769 @bails-upload-documents-post-record-decision
  Scenario: Upload Documents after recording a decision
    When I switch to be a `Home Office Generic`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    When I select the `Upload documents` Next step
    Then I am on the `Upload` page
    When I click the `Add new` button
    And within the `Upload documents` collection's first item, I upload `{@BailsExampleDocument.pdf}` for the `Upload a file` field
    And within the `Upload documents` collection's first item, I type `This is the a bails document that is being uploaded by the AO after recording decision.` for the `Describe the document` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Upload documents` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Upload documents` collection's first item, I should see `This is the a bails document that is being uploaded by the AO after recording decision.` in the `Describe the document` field
    When I click the `Upload` button
    Then I should see the text `Your upload is complete`
    And I should see the text `The document(s) you uploaded are available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload documents`
    When I click the `Documents` tab
    And within the `Tribunal document` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Tribunal document` collection's first item, I should see `This is the a bails document that is being uploaded by the AO after recording decision.` in the `Description` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    
  @bails-upload-documents @RIA-5769 @bails-upload-documents-post-upload-signed-decision-notice
  Scenario: Upload Documents after uploading signed decision notice for a conditional bail
    When I switch to be a `Home Office Generic`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant
    When I select the `Upload documents` Next step
    Then I am on the `Upload` page
    When I click the `Add new` button
    And within the `Upload documents` collection's first item, I upload `{@BailsExampleDocument.pdf}` for the `Upload a file` field
    And within the `Upload documents` collection's first item, I type `This is the a bails document that is being uploaded by the AO after uploading signed decision notice.` for the `Describe the document` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Upload documents` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Upload documents` collection's first item, I should see `This is the a bails document that is being uploaded by the AO after uploading signed decision notice.` in the `Describe the document` field
    When I click the `Upload` button
    Then I should see the text `Your upload is complete`
    And I should see the text `The document(s) you uploaded are available to view in the documents tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload documents`
    When I click the `Documents` tab
    And within the `Tribunal document` collection's first item, I should see `BailsExampleDocument.pdf` in the `Document` field
    And within the `Tribunal document` collection's first item, I should see `This is the a bails document that is being uploaded by the AO after uploading signed decision notice.` in the `Description` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    