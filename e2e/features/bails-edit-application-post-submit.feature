Feature: Bails Edit application postSubmit
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    And I wait for 60 seconds
   And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Prison detention with one financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I should see the text `What happens next`

  @bails-edit-application-post-submit @bails-full @RIA-5868 @bails-edit-application-post-submit-post-submit @nightly-test
  Scenario: Edit application after submitting
    When I switch to be a `Admin Officer Bails`
    And I edit my submitted application as a `Admin Officer` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative that had a Legal Representative before
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    
    And I should see `Harry Pughes` for the `Applicant name` field
    And I should see `Yarlswood` for the `Immigration removal centre` field
    And I should see `Yarlswood` for the `Hearing centre` field
    And I should see `76543210` for the `Home Office reference` field
    And I should see `Edited Legal Representative Company` for the `Company` field
    And I should see `Edited Legal Representative Name` for the `Name` field
    And I should see `editedlegalRep@test.com` for the `Email address` field
    And I should see `Edited this reference` for the `Reference` field
    When I click the `Bail application` tab
    Then I should see `25 Dec 1999` for the `Date of birth` field
    And I should see `Male` for the `Gender` field
    And I should see `No` for the `Mobile phone` field
    And I should see `No` for the `Pending appeal hearing` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Has the applicant made a previous application before?` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `Edited grounds for bail` for the `Enter the bail grounds` field
    And I should see `Yes` for the `Transfer bail management` field
    And I should see `No` for the `Supporting evidence` field
    And I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field
    When I click the `Hearing` tab
    Then I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field

  @bails-edit-application-post-submit @bails-full @RIA-5868 @bails-edit-application-post-submit-post-bail-summary
  Scenario: Edit application after uploading bail summary
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer Bails`
    And I edit my submitted application as a `Admin Officer` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative that had a Legal Representative before
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    And I should see `Harry Pughes` for the `Applicant name` field
    And I should see `Yarlswood` for the `Immigration removal centre` field
    And I should see `Yarlswood` for the `Hearing centre` field
    And I should see `76543210` for the `Home Office reference` field
    And I should see `Edited Legal Representative Company` for the `Company` field
    And I should see `Edited Legal Representative Name` for the `Name` field
    And I should see `editedlegalRep@test.com` for the `Email address` field
    And I should see `Edited this reference` for the `Reference` field
    When I click the `Bail application` tab
    Then I should see `25 Dec 1999` for the `Date of birth` field
    And I should see `Male` for the `Gender` field
    And I should see `No` for the `Mobile phone` field
    And I should see `No` for the `Pending appeal hearing` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Has the applicant made a previous application before?` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `Edited grounds for bail` for the `Enter the bail grounds` field
    And I should see `Yes` for the `Transfer bail management` field
    And I should see `No` for the `Supporting evidence` field
    And I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field
    When I click the `Hearing` tab
    Then I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field

  @bails-edit-application-post-submit @bails-full @RIA-5868 @bails-edit-application-post-submit-post-record-decision
  Scenario: Edit application after recording a decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer Bails`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I edit my submitted application as a `Admin Officer` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative that had a Legal Representative before
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    
    And I should see `Harry Pughes` for the `Applicant name` field
    And I should see `Yarlswood` for the `Immigration removal centre` field
    And I should see `Yarlswood` for the `Hearing centre` field
    And I should see `76543210` for the `Home Office reference` field
    And I should see `Edited Legal Representative Company` for the `Company` field
    And I should see `Edited Legal Representative Name` for the `Name` field
    And I should see `editedlegalRep@test.com` for the `Email address` field
    And I should see `Edited this reference` for the `Reference` field
    When I click the `Bail application` tab
    Then I should see `25 Dec 1999` for the `Date of birth` field
    And I should see `Male` for the `Gender` field
    And I should see `No` for the `Mobile phone` field
    And I should see `No` for the `Pending appeal hearing` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Has the applicant made a previous application before?` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `Edited grounds for bail` for the `Enter the bail grounds` field
    And I should see `Yes` for the `Transfer bail management` field
    And I should see `No` for the `Supporting evidence` field
    And I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field
    When I click the `Hearing` tab
    Then I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field

  @bails-edit-application-post-submit @bails-full @RIA-5868 @bails-edit-application-post-submit-post-upload-signed-decision-notice
  Scenario: Edit application after uploading signed decision notice for a conditional bail
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer Bails`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant
    And I edit my submitted application as a `Admin Officer` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative that had a Legal Representative before
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    
    And I should see `Harry Pughes` for the `Applicant name` field
    And I should see `Yarlswood` for the `Immigration removal centre` field
    And I should see `Yarlswood` for the `Hearing centre` field
    And I should see `76543210` for the `Home Office reference` field
    And I should see `Edited Legal Representative Company` for the `Company` field
    And I should see `Edited Legal Representative Name` for the `Name` field
    And I should see `editedlegalRep@test.com` for the `Email address` field
    And I should see `Edited this reference` for the `Reference` field
    When I click the `Bail application` tab
    Then I should see `25 Dec 1999` for the `Date of birth` field
    And I should see `Male` for the `Gender` field
    And I should see `No` for the `Mobile phone` field
    And I should see `No` for the `Pending appeal hearing` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Has the applicant made a previous application before?` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `Edited grounds for bail` for the `Enter the bail grounds` field
    And I should see `Yes` for the `Transfer bail management` field
    And I should see `No` for the `Supporting evidence` field
    And I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field
    When I click the `Hearing` tab
    Then I should see `No` for the `Interpreter` field
    And I should see `No` for the `Disability` field
    And I should see `Yes` for the `Able to join video hearing` field