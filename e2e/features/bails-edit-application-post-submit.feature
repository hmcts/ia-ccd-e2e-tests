Feature: Edit application preSubmit

  Given I am signed in as a `Legal Org User Rep A`
  And I create a new bail application
  And I save my initial application as a `Legal Rep` for a Prison detention with one financial condition supporters and with a Legal Representative
  And I submit my bail application as a `Legal Rep`

  @bails-edit-application-post-submit @bails @RIA-5868 @bails-edit-application-post-submit-post-submit
  Scenario: Legal Rep Edit application after Submitting
    When I switch to be a `Admin Officer`
    When I edit my submitted application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit the application`
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
    # And I should see `No` for the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` field
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

  @bails-edit-application-pre-submit @bails @RIA-5867 @bails-edit-application-pre-submit-home-office
  Scenario: Home Office Edit application Before Submitting
    Given I am signed in as a `Home Office Bails`
    And I create a new bail application
    And I save my initial application as a `Home Office Bails` for a Prison detention with one financial condition supporters and with no Legal Representative
    When I edit my saved application as a `Home Office Bails` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit the application`
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
    # And I should see `No` for the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` field
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

  @bails-edit-application-pre-submit @bails @RIA-5867 @bails-edit-application-pre-submit-admin-officer
  Scenario: Admin Officer Edit application Before Submitting
    Given I am signed in as a `Admin Officer`
    And I create a new bail application
    And I save my initial application as a `Admin Officer` for a Prison detention with one financial condition supporters and with no Legal Representative
    When I edit my saved application as a `Admin Officer` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    Then I should see the text `Your application details have been updated`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit the application`
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
    # And I should see `No` for the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` field
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
