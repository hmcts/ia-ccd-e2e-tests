Feature: Start bail application as a Legal Representative user

  @start-bail-application @RIA-5657 @start-bail-application-legal-rep
  Scenario: Start bail application as Legal Rep

    Given I am signed in as a `Legal Org User Rep A`
    When I create a new bail application
    And I am on the `Before you start` page
    And I click the `Continue` button
    Then I am on the `What is the applicant’s name?` page

    Given I am on the `What is the applicant’s name?` page
    When I type `Harri` for the `Given names` field
    And I type `Pugh` for the `Family name` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s date of birth?` page

    Given I am on the `What is the applicant’s date of birth?` page
    When I type `31-12-1998` for the `Date of birth` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s gender?` page

    Given I am on the `What is the applicant’s gender?` page
    When I select `Male` for the `Gender` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s nationality?` page

    Given I am on the `What is the applicant’s nationality` page
    When I select `The applicant is stateless` for the `Nationality` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s Home Office reference number?` page

    Given I am on the `What is the applicant’s Home Office reference number?` page
    When I type `01234568` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Where is the applicant detained?` page

    Given I am on the `Where is the applicant detained?` page
    When I select `Immigration removal centre` for the `Detention facility` field
    And I click the `Continue` button
    Then I am on the `In which immigration removal centre is the applicant detained?` page

    Given I am on the `In which immigration removal centre is the applicant detained?` page
    When I select `Larne House` for the `Immigration removal centre name` field
    And I click the `Continue` button
    Then I am on the `What date did the applicant arrive in the UK?` page

    Given I am on the `What date did the applicant arrive in the UK?` page
    When I type `31-12-2008` for the `Date of arrival in the UK` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have access to a mobile phone?` page

    Given I am on the `Does the applicant have access to a mobile phone?` page
    When I select `No` for the `Mobile phone` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have an appeal hearing pending in the First-tier Tribunal (IAC)?` page

    Given I am on the `Does the applicant have an appeal hearing pending in the First-tier Tribunal (IAC)?` page
    When I select `Yes, but I don't know the appeal reference number` for the `Pending appeal hearing` field
    And I click the `Continue` button
    Then I am on the `Has the applicant made an application for immigration bail before?` page

    Given I am on the `Has the applicant made an application for immigration bail before?` page
    When I select `Yes, but I don't know the bail application number` for the `Previous application` field
    And I click the `Continue` button
    Then I am on the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` page

    Given I am on the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` page
    When I select `No` for the `Bail refused in the last 28 days` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have somewhere to live if this bail application is granted?` page

    Given I am on the `Does the applicant have somewhere to live if this bail application is granted?` page
    When I select `No` for the `Address if bail granted` field
    And I click the `Continue` button
    Then I am on the `Does the applicant agree to be bound by a financial condition?` page

    Given I am on the `Does the applicant agree to be bound by a financial condition?` page
    When I select `No` for the `Financial condition` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have a financial condition supporter?` page

    Given I am on the `Does the applicant have a financial condition supporter?` page
    When I select `No` for the `Financial condition supporter` field
    And I click the `Continue` button
    Then I am on the `Grounds for bail` page

    Given I am on the `Grounds for bail` page
    When I click the `Continue` button
    Then I am on the `On what grounds is the applicant applying for bail?` page

    Given I am on the `On what grounds is the applicant applying for bail?` page
    When I type `Grounds for bail` for the `Enter the bail grounds` field
    And I click the `Continue` button
    Then I am on the `Do you want to provide supporting evidence?` page

    Given I am on the `Do you want to provide supporting evidence?` page
    When I click the `No` label
    And I click the `Continue` button
    Then I am on the `Does the applicant consent to future management of bail being transferred to the Home Office?` page

    Given I am on the `Does the applicant consent to future management of bail being transferred to the Home Office?` page
    When I select `Yes` for the `Transfer bail management` field
    And I click the `Continue` button
    Then I am on the `Does the applicant or any financial condition supporters need an interpreter at the hearing?` page

    Given I am on the `Does the applicant or any financial condition supporters need an interpreter at the hearing?` page
    When I select `No` for the `Interpreter` field
    And I click the `Continue` button
    Then I am on the `Does the applicant, the applicant’s legal representative or any financial condition supporters have a disability which may affect them at the hearing?` page

    Given I am on the `Does the applicant, the applicant’s legal representative or any financial condition supporters have a disability which may affect them at the hearing?` page
    When I select `No` for the `Disability` field
    And I click the `Continue` button
    Then I am on the `Would the applicant be able to join the hearing by video link?` page

    Given I am on the `Would the applicant be able to join the hearing by video link?` page
    When I select `Yes` for the `Able to join video hearing` field
    And I click the `Continue` button
    Then I am on the `Enter the legal representative’s details` page

    Given I am on the `Enter the legal representative’s details` page
    When I type `Legal Rep` for the `Name` field
    When I type `07292929292` for the field with ID `legalRepPhone`
    And I type `This is a reference` for the `Reference` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page

    Given I am on the `Check your answers` page

    Then I should see `Pugh` for the first `Family name` answer
    And I should see `31 Dec 1998` for the first `Date of birth` answer
    And I should see `Male` for the `Gender` answer
    And I should see `Immigration removal centre` for the `Detention facility` answer
    And I should see `Larne House` for the `Immigration removal centre name` answer
    And I should see `Yes, but I don't know the appeal reference number` for the `Pending appeal hearing` answer
    And I should see `Yes, but I don't know the bail application number` for the `Previous application` answer
    And I should see `No` for the `Address if bail granted` answer
    And I should see `No` for the `Financial condition supporter` answer
    And I should see `Grounds for bail` for the `Enter the bail grounds` answer
    And I should see `Yes` for the `Able to join video hearing` answer
    And I should see `Legal Rep` for the `Name` answer
    And I should see `07292929292` for the `Phone number` answer
    And I should see `This is a reference` for the `Reference` answer

    Given I click the `Save application` button
    And I wait for 30 seconds
    And I should see the text `You have saved this application`
    When I click the `Close and Return to case details` button
    And I wait for 10 seconds
    Then I should see the text `Case record`

    Given I click the `Overview` tab
    Then I should see `Harri Pugh` for the `Applicant name` field
    And I should see `Immigration removal centre` for the `Detention facility` field
    And I should see `Larne House` for the `Immigration removal centre` field
    And I should see `01234568` for the `Home Office reference` field
    And I should see `Fake Org Ltd` for the `Company` field
    And I should see `Legal Rep` for the `Name` field
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` for the `Email address` field
    And I should see `07292929292` for the `Phone number` field
    And I should see `This is a reference` for the `Reference` field

    Given I click the `Bail application` tab
    Then I should see the text `Submission`
    And I should see `Legal Representative` for the `Application submitted by` answer

    And I should see `31 Dec 1998` for the first `Date of birth` answer
    And I should see the text `Stateless`
    And I should see `01234568` for the `Home Office reference` answer
    And I should see `31 Dec 2008` for the `Date of arrival in the UK` answer
    And I should see `No` for the `Address if bail granted` answer
    And I should see the text `Yes, but I don't know the bail application number`
    And I should see `No` for the `Financial condition` answer
    And I should see `No` for the `Financial condition supporter` answer
    And I should see `No` for the `Interpreter` answer
    And I should see `No` for the `Disability` answer
    And I should see the text `Legal Representative`
    And I should see `Fake Org Ltd` for the `Company` answer
    And I should see `Legal Rep` for the `Name` answer
    And I should see `ia-law-firm-a-sc@fake.hmcts.net` for the `Email address` answer
    And I should see `07292929292` for the `Phone number` answer
    And I should see `This is a reference` for the `Reference` answer




