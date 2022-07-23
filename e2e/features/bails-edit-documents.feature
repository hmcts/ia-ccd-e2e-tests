Feature: Edit bail documents
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 10 seconds
   And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I switch to be a `Admin Officer`

  @RIA-5770 @bails-full @bails-edit-documents @bails-edit-documents-delete
  Scenario: Delete a document
    When I select the `Edit documents` Next step
    Then I am on the `Edit or remove documents` page
    And The page is accessible
    When I remove the first item from the `Applicant documents (Optional)` collection
    And I click the `Continue` button
    Then I am on the `Reason for edits` page
    And The page is accessible
    When I type `These are some reasons for removing documents` for the `Reasons for editing or removing documents` field
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    
    When I click the `Documents` tab
    Then within the `Applicant documents` collection's first item, I should see `Pugh-bail-application-details.PDF` for the `Document` field
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `A document was edited or deleted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `Document names: [GroundsForBailSupportingEvidence.pdf]` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `Reason: These are some reasons for removing documents` in the `Case note` field

  @RIA-5770 @bails-full @bails-edit-documents @bails-edit-documents-edit
  Scenario: Edit a document
    When I select the `Edit documents` Next step
    Then I am on the `Edit or remove documents` page
    And The page is accessible
    When within the `Applicant documents (Optional)` collection's first item, I type `This is a new description that wasn't here before` for the `Description (Optional)` field
    And I click the `Continue` button
    Then I am on the `Reason for edits` page
    And The page is accessible
    When I type `Here are some reasons for editing documents` for the `Reasons for editing or removing documents` field
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    
    When I click the `Documents` tab
    Then within the `Applicant documents` collection's first item, I should see `This is a new description that wasn't here before` for the `Description` field
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `A document was edited or deleted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `Document names: [GroundsForBailSupportingEvidence.pdf]` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `Reason: Here are some reasons for editing documents` in the `Case note` field

  @RIA-5770 @bails-full @bails-edit-documents @bails-edit-documents-add
  Scenario: Add a document
    When I select the `Edit documents` Next step
    Then I am on the `Edit or remove documents` page
    And The page is accessible
    When I click the first `Add new` button
    And within the `Applicant documents (Optional)` collection's third item, I type `Somebody testing this` for the `Supplied by (Optional)` field
    And within the `Applicant documents (Optional)` collection's third item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Applicant documents (Optional)` collection's third item, I type `This is a new document that wasn't here before` for the `Description (Optional)` field
    And within the `Applicant documents (Optional)` collection's third item, I type `10-02-2022` for the `Date uploaded (Optional)` field
    And I click the `Continue` button
    Then I am on the `Reason for edits` page
    And The page is accessible
    When I type `Take some reasons for adding a new document` for the `Reasons for editing or removing documents` field
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    
    When I click the `Documents` tab
    Then within the `Applicant documents` collection's third item, I should see `Somebody testing this` for the `Supplied by` field
    And within the `Applicant documents` collection's third item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Applicant documents` collection's third item, I should see `This is a new document that wasn't here before` for the `Description` field
    And within the `Applicant documents` collection's third item, I should see `10 Feb 2022` for the `Date uploaded` field
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `A document was edited or deleted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `Document names: [Evidence1.pdf]` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `Reason: Take some reasons for adding a new document` in the `Case note` field

  @RIA-5770 @bails-full @bails-edit-documents @bails-edit-documents-delete @bails-edit-documents-edit @bails-edit-documents-add @bails-edit-documents-delete-edit-add @bails-regression
  Scenario: Delete, edit and add a document
    When I select the `Edit documents` Next step
    Then I am on the `Edit or remove documents` page
    And The page is accessible
    When I remove the first item from the `Applicant documents (Optional)` collection
    And within the `Applicant documents (Optional)` collection's first item, I type `This is a new description that wasn't here before` for the `Description (Optional)` field
    And I click the first `Add new` button
    And within the `Applicant documents (Optional)` collection's second item, I type `Somebody testing this` for the `Supplied by (Optional)` field
    And within the `Applicant documents (Optional)` collection's second item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Applicant documents (Optional)` collection's second item, I type `This is a new document that wasn't here before` for the `Description (Optional)` field
    And within the `Applicant documents (Optional)` collection's second item, I type `10-02-2022` for the `Date uploaded (Optional)` field
    And I click the `Continue` button
    Then I am on the `Reason for edits` page
    And The page is accessible
    When I type `This is a reason for editing, removing and adding documents` for the `Reasons for editing or removing documents` field
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    
    When I click the `Documents` tab
    Then within the `Applicant documents` collection's first item, I should see `Pugh-bail-application-details.PDF` for the `Document` field
    Then within the `Applicant documents` collection's first item, I should see `This is a new description that wasn't here before` for the `Description` field
    And within the `Applicant documents` collection's second item, I should see `Somebody testing this` for the `Supplied by` field
    And within the `Applicant documents` collection's second item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Applicant documents` collection's second item, I should see `This is a new document that wasn't here before` for the `Description` field
    And within the `Applicant documents` collection's second item, I should see `10 Feb 2022` for the `Date uploaded` field
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `A document was edited or deleted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `Document names: [GroundsForBailSupportingEvidence.pdf, Pugh-bail-application-details.PDF, Evidence1.pdf]` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `Reason: This is a reason for editing, removing and adding documents` in the `Case note` field

  @RIA-5770 @bails-full @bails-edit-documents @bails-edit-documents-delete @bails-edit-documents-edit @bails-edit-documents-add @bails-edit-documents-delete-edit-add-judge
  Scenario: Delete, edit and add a document as a Judge
    When I select the `Edit documents` Next step
    Then I am on the `Edit or remove documents` page
    And The page is accessible
    When I remove the first item from the `Applicant documents (Optional)` collection
    And within the `Applicant documents (Optional)` collection's first item, I type `This is a new description that wasn't here before` for the `Description (Optional)` field
    And I click the first `Add new` button
    And within the `Applicant documents (Optional)` collection's second item, I type `Somebody testing this` for the `Supplied by (Optional)` field
    And within the `Applicant documents (Optional)` collection's second item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Applicant documents (Optional)` collection's second item, I type `This is a new document that wasn't here before` for the `Description (Optional)` field
    And within the `Applicant documents (Optional)` collection's second item, I type `10-02-2022` for the `Date uploaded (Optional)` field
    And I click the `Continue` button
    Then I am on the `Reason for edits` page
    And The page is accessible
    When I type `This is a reason for editing, removing and adding documents` for the `Reasons for editing or removing documents` field
    And I click the `Continue` button
    Then I should see the `Submit` button
    When I click the `Submit` button
    
    When I click the `Documents` tab
    Then within the `Applicant documents` collection's first item, I should see `This is a new description that wasn't here before` for the `Description` field
    And within the `Applicant documents` collection's second item, I should see `Somebody testing this` for the `Supplied by` field
    And within the `Applicant documents` collection's second item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Applicant documents` collection's second item, I should see `This is a new document that wasn't here before` for the `Description` field
    And within the `Applicant documents` collection's second item, I should see `10 Feb 2022` for the `Date uploaded` field
    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `A document was edited or deleted` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `Document names: [GroundsForBailSupportingEvidence.pdf, Pugh-bail-application-details.PDF, Evidence1.pdf]` in the `Case note` field
    And within the `Case notes` collection's first item, I should see `Reason: This is a reason for editing, removing and adding documents` in the `Case note` field
