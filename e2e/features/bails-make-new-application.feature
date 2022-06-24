Feature: Make new application
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Prison detention with one financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-admin-officer @bails-make-new-application-conditional-grant @bails-regression
  Scenario: Make new application as Admin Officer after conditional grant decided
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant
    And I move the application to decided
    And I select the `Make new application` Next step
    And I make a new application as a `Admin Officer` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Applicant` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the text `This is a new B1 form`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-admin-officer @bails-make-new-application-granted
  Scenario: Make new application as Admin Officer after granted decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a granted decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a grant
    And I select the `Make new application` Next step
    And I make a new application as a `Admin Officer` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Applicant` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the text `This is a new B1 form`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-admin-officer @bails-make-new-application-refused
  Scenario: Make new application as Admin Officer after refused decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a refused decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a refusal
    And I select the `Make new application` Next step
    And I make a new application as a `Admin Officer` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Applicant` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the text `This is a new B1 form`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-admin-officer @bails-make-new-application-ended
  Scenario: Make new application as Admin Officer after ended application
    When I switch to be a `Admin Officer`
    And I end the application
    And I select the `Make new application` Next step
    And I make a new application as a `Admin Officer` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Applicant` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the text `This is a new B1 form`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-home-office @bails-make-new-application-conditional-grant
  Scenario: Make new application as Home Office after conditional grant decided
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant
    And I move the application to decided
    And I switch to be a `Home Office Bails`
    And I select the `Make new application` Next step
    And I make a new application as a `Home Office Bails` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Home Office` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-home-office @bails-make-new-application-granted
  Scenario: Make new application as Home Office after granted decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a granted decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a grant
    And I switch to be a `Home Office Bails`
    And I select the `Make new application` Next step
    And I make a new application as a `Home Office Bails` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Home Office` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-home-office @bails-make-new-application-refused
  Scenario: Make new application as Home Office after refused decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a refused decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a refusal
    And I switch to be a `Home Office Bails`
    And I select the `Make new application` Next step
    And I make a new application as a `Home Office Bails` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Home Office` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-home-office @bails-make-new-application-ended
  Scenario: Make new application as Home Office after ended application
    When I switch to be a `Admin Officer`
    And I end the application
    And I switch to be a `Home Office Bails`
    And I select the `Make new application` Next step
    And I make a new application as a `Home Office Bails` for a Prison detention with no financial condition supporters and with no Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Home Office` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field


    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-legal-rep @bails-make-new-application-conditional-grant
  Scenario: Make new application as Legal Rep after conditional grant decided
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a conditional grant decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a conditional grant
    And I move the application to decided
    And I switch to be a `Legal Org User Rep A`
    And I select the `Make new application` Next step
    And I make a new application as a `Legal Rep` for a Prison detention with no financial condition supporters and with a Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Legal Representative` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    And I should see `This is a better reference` for the `Reference` field
    And I should see `New Legal Representative Name` for the `Name` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-legal-rep @bails-make-new-application-granted
  Scenario: Make new application as Legal Rep after granted decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a granted decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a grant
    And I switch to be a `Legal Org User Rep A`
    And I select the `Make new application` Next step
    And I make a new application as a `Legal Rep` for a Prison detention with no financial condition supporters and with a Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Legal Representative` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    And I should see `This is a better reference` for the `Reference` field
    And I should see `New Legal Representative Name` for the `Name` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-legal-rep @bails-make-new-application-refused @bails-regression
  Scenario: Make new application as Legal Rep after refused decision
    When I switch to be a `Home Office Bails`
    And I upload the bail summary
    And I switch to be a `Admin Officer`
    And I record a refused decision with SS consent Yes with no financial condition supporters
    And I upload the signed decision notice for a refusal
    And I switch to be a `Legal Org User Rep A`
    And I select the `Make new application` Next step
    And I make a new application as a `Legal Rep` for a Prison detention with no financial condition supporters and with a Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Legal Representative` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    And I should see `This is a better reference` for the `Reference` field
    And I should see `New Legal Representative Name` for the `Name` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

  @bails-make-new-application @bails @RIA-5773 @bails-make-new-application-legal-rep @bails-make-new-application-ended
  Scenario: Make new application as Legal Rep after ended application
    When I switch to be a `Admin Officer`
    And I end the application
    And I switch to be a `Legal Org User Rep A`
    And I select the `Make new application` Next step
    And I make a new application as a `Legal Rep` for a Prison detention with no financial condition supporters and with a Legal Representative
    Then I should see an alert confirming the case `has been updated with event: Make new application`
    When I click the `Bail application` tab
    Then I should see `Legal Representative` for the `Application submitted by` field
    And I should see `Harri` for the `Given names` field
    And I should see `No` for the `Mobile phone` field
    And I should see `01234567` for the `Home Office reference` field
    And I should see `No` for the `Address if bail granted` field
    And I should see `No` for the `Financial condition` field
    And I should see `No` for the `Financial condition supporter` field
    And I should see `New grounds for bail` for the `Enter the bail grounds` field
    And I should see `This is a better reference` for the `Reference` field
    And I should see `New Legal Representative Name` for the `Name` field
    When I click the `Documents` tab
    Then I should see the text `This is a different supporting evidence`
    And I should see the `Previous applications` tab

