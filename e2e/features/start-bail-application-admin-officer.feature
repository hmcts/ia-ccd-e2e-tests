Feature: Start bail application as an Admin Officer user

  @start-bail-application @RIA-5634 @start-bail-application-admin-officer
  Scenario: Start bail application as Admin Officer

    Given I am signed in as a `Admin Officer`
    When I create a new bail application
    And I am on the `Before you start` page
    And I click the `Continue` button
    Then I am on the `Which party sent the application to the Tribunal?` page

    Given I am on the `Which party sent the application to the Tribunal?` page
    When I select `Applicant` for the `Application sent by` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s name?` page

    Given I am on the `What is the applicant’s name?` page
    When I type `Harri` for the `Given names` field
    And I type `Pugh` for the `Family name` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s date of birth?` page

    Given I am on the `What is the applicant’s date of birth?` page
    When I type `31-12-1999` for the `Date of birth` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s gender?` page

    Given I am on the `What is the applicant’s gender?` page
    When I select `Other` for the `Gender` field
    And I type `Other` for the `Enter details` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s nationality?` page

    Given I am on the `What is the applicant’s nationality` page
    When I select `The applicant is stateless` for the `Nationality` field
#     When I select `The applicant has a nationality` for the `Nationality` field
#     And I add an item to the `Nationality` collection
#     And within the `Nationality` collection's first item, I select `Finnish` for the `Nationality` field
#     And I add another item to the `Nationality` collection
#     And within the `Nationality` collection's second item, I select `Icelandic` for the `Nationality` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s Home Office reference number?` page

    Given I am on the `What is the applicant’s Home Office reference number?` page
    When I type `01234567` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Where is the applicant detained?` page

    Given I am on the `Where is the applicant detained?` page
    When I select `Prison` for the `Detention facility` field
    And I type `987654321` for the `What is the applicant’s NOMS number?` field
    And I click the `Continue` button
    Then I am on the `In which prison is the applicant detained?` page

    Given I am on the `In which prison is the applicant detained?` page
    When I select `HM Prison Blundeston` for the `Prison name` field
    And I click the `Continue` button
    Then I am on the `What date did the applicant arrive in the UK?` page

    Given I am on the `What date did the applicant arrive in the UK?` page
    When I type `31-12-2009` for the `Date of arrival in the UK` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have access to a mobile phone?` page

    Given I am on the `Does the applicant have access to a mobile phone?` page
    When I select `Yes` for the `Mobile phone` field
    And I type `07930111111` for the `Mobile phone number` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have an appeal hearing pending in the First-tier Tribunal (IAC)?` page

    Given I am on the `Does the applicant have an appeal hearing pending in the First-tier Tribunal (IAC)?` page
    When I select `Yes` for the `Pending appeal hearing` field
    And I type `098765` for the `What is the reference number for the applicant’s appeal?` field
    And I click the `Continue` button
    Then I am on the `Has the applicant made an application for immigration bail before?` page

    Given I am on the `Has the applicant made an application for immigration bail before?` page
    When I select `Yes` for the `Previous application` field
    And I type `123456` for the `What is the bail number for the previous application?` field
    And I click the `Continue` button
    Then I am on the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` page

    Given I am on the `Has the applicant been refused immigration bail at a hearing within the last 28 days?` page
    When I select `Yes` for the `Bail refused in the last 28 days` field
    And I type `31-12-2019` for the `What was the date of the hearing?` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have somewhere to live if this bail application is granted?` page

    Given I am on the `Does the applicant have somewhere to live if this bail application is granted?` page
    When I select `Yes` for the `Address if bail granted` field
    And I click the `Continue` button
    Then I am on the `At what address will the applicant live if this bail application is granted?` page

    Given I am on the `At what address will the applicant live if this bail application is granted?` page
    When I type `SW1A 2AA` for the `Enter a UK postcode` field
    And I click the `Find address` button
    And I see the text `Select an address`
    And I wait for any found addresses to load
    And I select `Prime Minister & First Lord Of The Treasury, 10 Downing Street, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button
    Then I am on the `Does the applicant agree to be bound by a financial condition?` page

    Given I am on the `Does the applicant agree to be bound by a financial condition?` page
    When I select `Yes` for the `Financial condition` field
    And I type `1000` for the `Enter the financial condition amount (£)` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have a financial condition supporter?` page

    Given I am on the `Does the applicant have a financial condition supporter?` page
    When I select `Yes` for the `Financial condition supporter` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s name?` page

    Given I am on the `What is the financial condition supporter’s name?` page
    When I type `John` for the `Given names` field
    And I type `Smith` for the `Family name` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s address?` page

    Given I am on the `What is the financial condition supporter’s address?` page
    When I type `EC1R 4QU` for the `Enter a UK postcode` field
    And I click the `Find address` button
    And I see the text `Select an address`
    And I wait for any found addresses to load
    And I select `First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button
    Then I am on the `What are the financial condition supporter’s contact details?` page

    Given I am on the `What are the financial condition supporter’s contact details?` page
    When I click the `Telephone` label
    And I click the `Mobile` label
    And I click the `Email` label
    And I type `01182904610` for the `Telephone number` field
    And I type `07930111222` for the `Mobile number` field
    And I type johnSmith@test.com` for the `Email address` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s date of birth?` page

    Given I am on the `What is the financial condition supporter’s date of birth?` page
    When I type `30-12-1999` for the `Date of birth` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s relationship to the applicant?` page

    Given I am on the `What is the financial condition supporter’s relationship to the applicant?` page
    When I type `Uncle` for the `Relationship to the applicant` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s occupation?` page

    Given I am on the `What is the financial condition supporter’s occupation?` page
    When I type `Lawyer` for the `Occupation` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s immigration status?` page

    Given I am on the `What is the financial condition supporter’s immigration status?` page
    When I type `Citizen` for the `Immigration status` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s nationality?` page

    Given I am on the `What is the financial condition supporter’s nationality?` page
    When I add an item to the `Nationality` collection
    And within the `Nationality` collection's first item, I select `Angolan` for the `Nationality` field
    And I add another item to the `Nationality` collection
    And within the `Nationality` collection's second item, I select `Uzbek` for the `Nationality` field
    And I click the `Continue` button
    Then I am on the `Does the financial condition supporter have a passport?` page

    Given I am on the `Does the financial condition supporter have a passport?` page
    When I select `Yes` for the `Passport` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s passport number?` page

    Given I am on the `What is the financial condition supporter’s passport number?` page
    When I type `123456789` for the `Passport number (Optional)` field
    And I click the `Continue` button
    Then I am on the `What amount does the financial condition supporter undertake to pay?` page

    Given I am on the `What amount does the financial condition supporter undertake to pay?` page
    When I type `450` for the `Financial condition amount (£)` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have another financial condition supporter?` page

    Given I am on the `Does the applicant have another financial condition supporter?` page
    When I select `Yes` for the `Financial condition supporter 2` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s name?` page

    Given I am on the `What is the financial condition supporter’s name?` page
    When I type `Jane` for the `Given names` field
    And I type `Doe` for the `Family name` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s address?` page

    Given I am on the `What is the financial condition supporter’s address?` page
    When I type `EC1R 4QU` for the `Enter a UK postcode` field
    And I click the `Find address` button
    And I see the text `Select an address`
    And I wait for any found addresses to load
    And I select `First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button
    Then I am on the `What are the financial condition supporter’s contact details?` page

    Given I am on the `What are the financial condition supporter’s contact details?` page
    When I click the `Email` label
    And I type `janeDoe@test.com` for the `Email address` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s date of birth?` page

    Given I am on the `What is the financial condition supporter’s date of birth?` page
    When I type `29-12-1999` for the `Date of birth` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s relationship to the applicant?` page

    Given I am on the `What is the financial condition supporter’s relationship to the applicant?` page
    When I type `Aunt` for the `Relationship to the applicant` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s occupation?` page

    Given I am on the `What is the financial condition supporter’s occupation?` page
    When I type `Lawyer` for the `Occupation` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s immigration status?` page

    Given I am on the `What is the financial condition supporter’s immigration status?` page
    When I type `Immigrant` for the `Immigration status` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s nationality?` page

    Given I am on the `What is the financial condition supporter’s nationality?` page
    When I add an item to the `Nationality` collection
    And within the `Nationality` collection's first item, I select `Armenian` for the `Nationality` field
    And I click the `Continue` button
    Then I am on the `Does the financial condition supporter have a passport?` page

    Given I am on the `Does the financial condition supporter have a passport?` page
    When I select `Yes` for the `Passport` field
    And I click the `Continue` button
    Then I am on the `What is the financial condition supporter’s passport number?` page

    Given I am on the `What is the financial condition supporter’s passport number?` page
    When I click the `Continue` button
    Then I am on the `What amount does the financial condition supporter undertake to pay?` page

    Given I am on the `What amount does the financial condition supporter undertake to pay?` page
    When I type `550` for the `Financial condition amount (£)` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have another financial condition supporter?` page

    Given I am on the `Does the applicant have another financial condition supporter?` page
    When I select `No` for the `Financial condition supporter 3` field
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
    When I click the `Yes` label
    And I click the `Continue` button
    Then I am on the `Provide supporting evidence` page

    Given I am on the `Provide supporting evidence` page
    When I add an item to the `Upload a file` collection
    And within the `Upload a file` collection's first item, I upload `{@GroundsForBailSupportingEvidence.pdf}` for the `Document` field
    And within the `Upload a file` collection's first item, I type `This is the supporting evidence` for the `Describe the document` field
    And I wait for 8 seconds
    And I click the `Continue` button
    Then I am on the `Does the applicant consent to future management of bail being transferred to the Home Office?` page

    Given I am on the `Does the applicant consent to future management of bail being transferred to the Home Office?` page
    When I select `No` for the `Transfer bail management` field
    And I type `They do not consent to bail being transferred` for the `Explain why the applicant does not consent to bail being transferred` field
    And I click the `Continue` button
    Then I am on the `Does the applicant or any financial condition supporters need an interpreter at the hearing?` page

    Given I am on the `Does the applicant or any financial condition supporters need an interpreter at the hearing?` page
    When I select `Yes` for the `Interpreter` field
    And I add an item to the `Language Details` collection
    And within the `Language Details` collection's first item, I select `Bambara` for the `Language` field
    And within the `Language Details` collection's first item, I type `N/A` for the `Dialect` field
    And I click the `Continue` button
    Then I am on the `Does the applicant, the applicant’s legal representative or any financial condition supporters have a disability which may affect them at the hearing?` page

    Given I am on the `Does the applicant, the applicant’s legal representative or any financial condition supporters have a disability which may affect them at the hearing?` page
    When I select `Yes` for the `Disability` field
    And I type `They need special arrangements` for the `Explain any special arrangements needed for the hearing` field
    And I click the `Continue` button
    Then I am on the `Would the applicant be able to join the hearing by video link?` page

    Given I am on the `Would the applicant be able to join the hearing by video link?` page
    When I select `No` for the `Able to join video hearing` field
    And I type `They can't join video` for the `Explain why the applicant would not be able to join the hearing by video link` field
    And I click the `Continue` button
    Then I am on the `Does the applicant have a legal representative?` page

    Given I am on the `Does the applicant have a legal representative?` page
    When I select `No` for the `Legal representative` field
    And I click the `Continue` button
    Then I am on the `Upload B1 form` page

    Given I am on the `Upload B1 form` page
    When I add an item to the `Upload B1 form` collection
    And within the `Upload B1 form` collection's first item, I upload `{@B1Form.pdf}` for the `Document` field
    And within the `Upload B1 form` collection's first item, I type `This is the B1 form` for the `Describe the document` field
    And I wait for 8 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page

    Given I am on the `Check your answers` page
    Then I should see `Harri` for the first `Given names` answer
    And I should see `Other` for the `Gender` answer
    And I should see `Other` for the `Enter details` answer
#    And I should see the text `Finnish`
#    And I should see the text `Icelandic`
    And I should see `The applicant is stateless` for the `Nationality` answer
    And I should see `Prison` for the `Detention facility` answer
    And I should see `987654321` for the `What is the applicant’s NOMS number?` answer
    And I should see `HM Prison Blundeston` for the `Prison name` answer
    And I should see `07930111111` for the `Mobile phone number` answer
    And I should see `098765` for the `What is the reference number for the applicant’s appeal?` answer
    And I should see `123456` for the `What is the bail number for the previous application?` answer
    And I should see `31 Dec 2019` for the `What was the date of the hearing?` answer
    And within the first `Address` fieldset, I should see `Prime Minister & First Lord Of The Treasury` for the `Building and Street` answer
    And I should see `1000` for the `Enter the financial condition amount (£)` answer
    And I should see `John` for the second `Given names` answer
    And I should see `Smith` for the second `Family name` answer
    And within the second `Address` fieldset, I should see `First Tier Tribunal Immigration & Asylum Chamber, Taylor House` for the `Building and Street` answer
    And I should see `01182904610` for the first `Telephone number` answer
    And I should see `07930111222` for the first `Mobile number` answer
    And I should see `johnSmith@test.com` for the first `Email address` answer
    And I should see `30 Dec 1999` for the second `Date of birth` answer
    And I should see `Uncle` for the first `Relationship to the applicant` answer
    And I should see `Jane` for the third `Given names` answer
    And I should see `29 Dec 1999` for the third `Date of birth` answer
    And I should see `Aunt` for the second `Relationship to the applicant` answer
    And I should see `Lawyer` for the second `Occupation` answer
    And I should see `Immigrant` for the second `Immigration status` answer
    And I should see `550` for the second `Financial condition amount (£)` answer
    And I should see `No` for the `Financial condition supporter 3` answer
    And I should see `They do not consent to bail being transferred` for the `Explain why the applicant does not consent to bail being transferred` answer
    And I should see `They need special arrangements` for the `Explain any special arrangements needed for the hearing` answer
    And I should see `They can't join video` for the `Explain why the applicant would not be able to join the hearing by video link` answer
    And I should see `No` for the `Legal representative` answer

    Given I click the `Save application` button
    And I wait for 30 seconds
    And I should see the text `You have saved this application`
    When I click the `Close and Return to case details` button
    And I wait for 10 seconds
    Then I should see the text `Case record`

    Given I click the `Overview` tab
    Then I should see `Harri Pugh` for the `Applicant name` field
    And I should see `HM Prison Blundeston` for the `Prison` field
    And I should see `01234567` for the `Home Office reference` field

    Given I click the `Bail application` tab
    Then I should see the text `Submission`
    And I should see `Applicant` for the `Application submitted by` answer
    And I should see `Harri` for the first `Given names` answer
    And I should see `Other` for the `Enter details` answer
#    And I should see the text `Finnish`
#    And I should see the text `Icelandic`
    And I should see the text `Stateless`
    And I should see `Prison` for the `Detention facility` answer
    And I should see `987654321` for the `Prison NOMS number` answer
    And I should see `HM Prison Blundeston` for the `Prison` answer
    And I should see `31 Dec 2009` for the `Date of arrival in the UK` answer
    And I should see `098765` for the `Appeal reference number` answer
    And within the first `Address` fieldset, I should see `10 Downing Street` for the `Address Line 2` answer
    And I should see `123456` for the `Bail number` answer
    And I should see `John` for the second `Given names` answer
    And I should see `07930111222` for the first `Mobile number` answer
    And I should see `johnSmith@test.com` for the first `Email address` answer
    And I should see `30 Dec 1999` for the second `Date of birth` answer
    And I should see `Yes` for the first `Passport` answer
    And I should see `123456789` for the first `Passport number` answer
    And I should see `Jane` for the third `Given names` answer
    And I should see `Doe` for the third `Family name` answer
    And I should see `janeDoe@test.com` for the second `Email address` answer
    And I should see `29 Dec 1999` for the third `Date of birth` answer
    And I should see `Aunt` for the second `Relationship to the applicant` answer
    And I should see `550` for the second `Financial condition amount (£)` answer
    And I should see `Grounds for bail` for the `Enter the bail grounds` answer
    And I should see `Yes` for the `Supporting evidence` answer
    And I should see the `GroundsForBailSupportingEvidence.pdf` link
    And I should see the text `This is the supporting evidence`
    And I should see `Yes` for the `Interpreter` answer
    And I should see the text `Language Details`
    And I should see the text `Bambara`
    And I should see the text `N/A`
    And I should see `They need special arrangements` for the `Explain any special arrangements needed for the hearing` answer
    And I should see `They can't join video` for the `Explain why the applicant would not be able to join the hearing by video link` answer
    And I should see `No` for the `Legal Representative` answer


