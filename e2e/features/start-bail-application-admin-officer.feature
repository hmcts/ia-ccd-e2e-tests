Feature: Start bail application as Admin Officer

@start-bail-application @RIA-5634
  Scenario: Start bail application as Admin Officer

    # Applicant's personal details
    Given I am signed in as a `Admin Officer`
    When I create a new bail application
    And I am on the `Before you start` page
    And I click the `Continue` button
    Then I am on the `Which party sent the application to the Tribunal?` page
    
    Given I am on the `Which party sent the application to the Tribunal?` page
    When I select `Applicant` for the `Application sent by` field
    # When I select `Legal representative` for the `Application sent by` field
    # When I select `Home Office` for the `Application sent by` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s name?` page

    Given I am on the `What is the applicant’s name?` page
    When I type `José` for the `Given names` field
    And I type `González` for the `Family name` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s date of birth?` page

    Given I am on the `What is the applicant’s date of birth?` page
    When I type `31-12-1999` for the `Date of birth` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s gender?` page

    Given I am on the `What is the applicant’s gender?` page
    # When I select `Female` for the `Gender` field
    # When I select `Male` for the `Gender` field
    When I select `Other` for the `Gender` field
    And I type `Other` for the `Enter details` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s nationality?` page

    Given I am on the `What is the applicant’s nationality` page
    When I select `The applicant is stateless` for the `Nationality` field
    # When I select `The applicant has a nationality` for the `Nationality` field
    # And I add an item to the `Nationality` collection
    # And within the `Nationality` collection's first item, I select `Finnish` for the `Nationality` field
    # And I add another item to the `Nationality` collection
    # And within the `Nationality` collection's second item, I select `Icelandic` for the `Nationality` field
    And I click the `Continue` button
    Then I am on the `What is the applicant’s Home Office reference number?` page

    # Application details
    Given I am on the `What is the applicant’s Home Office reference number?` page
    When I type `01234567` for the `Home Office reference` field
    And I click the `Continue` button
    Then I am on the `Where is the applicant detained?` page

    Given I am on the `Where is the applicant detained?` page
    # When I select `Immigration removal centre` for the `Detention facility` field
    # And I click the `Continue` button
    # Then I am on the `In which immigration removal centre is the applicant detained?` page
    When I select `Prison` for the `Detention facility` field
    And I type `987654321` for the `What is the applicant’s NOMS number?` field
    And I click the `Continue` button
    Then I am on the `In which prison is the applicant detained?` page

    # Given I am on the `In which immigration removal centre is the applicant detained?` page
    # When I select `Larne House` for the `Immigration remove centre name` field
    # And I click the `Continue` button
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
    When I select `Yes` for the `Bail refused in the last 28 days` field
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

    # Financial condition details
    Given I am on the `Does the applicant agree to be bound by a financial condition?` page
    When I select `Yes` for the `Financial condition` field
    And I type `1000` for the `Enter the financial condition amount (£)?` field
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
    And I select ` First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button
    Then I am on the `What are the financial condition supporter’s contact details?` page

    Given I am on the `What are the financial condition supporter’s contact details?` page
    When I select `Telephone` for the `Contact details` field
    And I select `Mobile` for the `Contact details` field
    And I select `Email` for the `Contact details` field
    And I type `01182904610` for the `Telephone` field
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
    And I select ` First Tier Tribunal Immigration & Asylum Chamber, Taylor House, 88 Rosebery Avenue, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button
    Then I am on the `What are the financial condition supporter’s contact details?` page

    Given I am on the `What are the financial condition supporter’s contact details?` page
    When I select `Email` for the `Contact details` field
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
    And within the `Nationality` collection's first item, I select `Angolan` for the `Nationality` field
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
    When I select `Yes` for the `Financial condition supporter 3` field
    And I click the `Continue` button
    Then I am on the `Provide supporting evidence` page

    Given I am on the `Provide supporting evidence` page
    When I add an item to the `Upload a file` collection
    And within the `Upload a file` collection's first item, I upload `{@GroundsForBailSupportingEvidence.pdf}` for the `Document` field
    And within the `Upload a file` collection's first item, I type `This is the supporting evidence` for the `Describe the document` field
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
    And within the `Language Details` collection's first item, I select `Bambara` for the `Document` field
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
    And I click the `Continue` button
    Then I am on the `Check your answers` page

#    Given I am on the `Check your answers` page
#    # Applicant personal details
#    Then I should see `José` for the `Given names` answer
#    And I should see `González` for the `Family name` answer
#    And I should see `31 Dec 1999` for the `Date of birth` answer
#    And I should see `Other` for the `Gender` answer
#    And I should see `other` for the `Enter details` answer
#    And I should see `The applicant is stateless` for the `Nationality` answer
#    # Application details
#    And I should see `0123456` for the `Home Office reference` answer
#    And I should see `Prison` for the `Detention facility` answer
#    And I should see `987654321` for the `What is the applicant’s NOMS number?` answer
#    And I should see `HM Prison Blundeston` for the `Prison name` answer
#    And I should see `31 Dec 2009` for the `Date of arrival in the UK` answer
#    And I should see `Yes` for the `Mobile phone` answer
#    And I should see `07930111111` for the `Mobile phone number` answer
#    And I should see `Yes` for the `Pending appeal hearing` answer
#    And I should see `What is the reference number for the applicant’s appeal?` for the `098765` answer
#    And I should see `Yes` for the `Previous application` answer
#    And I should see `What is the bail number for the previous application?` for the `123456` answer
#    And I should see `Yes` for the `Bail refused in the last 28 days` answer
#    And I should see `What was the date of the hearing?` for the `31 Dec 2019` answer
#    And I should see `Yes` for the `Address if bail granted` answer
#    And within the `Address` fieldset, I should see `Prime Minister & First Lord Of The Treasury` for the `Building and Street` answer
#    And within the `Address` fieldset, I should see `10 Downing Street` for the `Address Line 2` answer
#    And within the `Address` fieldset, I should see `London` for the `Town or City` answer
#    And within the `Address` fieldset, I should see `SW1A 2AA` for the `Postcode/Zipcode` answer
#    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` answer
#    # Financial condition details
#    And I should see `Yes` for the `Financial condition` answer
#    And I should see `1000` for the `Enter the financial condition amount (£)` answer
#    And I should see `Yes` for the `Financial condition supporter` answer
#    And I should see `John` for the `Given names` answer
#    And I should see `Smith` for the `Family name` answer
#    And within the `Address` fieldset, I should see `First Tier Tribunal Immigration & Asylum Chamber, Taylor House` for the `Building and Street` answer
#    And within the `Address` fieldset, I should see `88 Rosebery Avenue` for the `Address Line 2` answer
#    And within the `Address` fieldset, I should see `London` for the `Town or City` answer
#    And within the `Address` fieldset, I should see `EC1R 4QU` for the `Postcode/Zipcode` answer
#    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` answer
#    And I should see `01182904610` for the `Telephone number` answer
#    And I should see `07930111222` for the `Mobile number` answer
#    And I should see `johnSmith@test.com` for the `Email address` answer
#    And I should see `30 Dec 1999` for the `Date of birth` answer
#    And I should see `Uncle` for the `Relationship to the applicant` answer
#    And I should see `Lawyer` for the `Occupation` answer
#    And I should see `Citizen` for the `Immigration status` answer
#    And within the `Nationalities` collection's first item, I should see `Angolan` for the `Nationality` field
#    And within the `Nationalities` collection's second item, I should see `Uzbek` for the `Nationality` field
#    And I should see `Yes` for the `Passport` answer
#    And I should see `123456789` for the `Passport number` answer
#    And I should see `450` for the `Financial condition amount (£)` answer
#    And I should see `Yes` for the `Financial condition supporter 2` answer
#
#    And I should see `Jane` for the `Given names` answer
#    And I should see `Doe` for the `Family name` answer
#    And within the `Address` fieldset, I should see `First Tier Tribunal Immigration & Asylum Chamber, Taylor House` for the `Building and Street` answer
#    And within the `Address` fieldset, I should see `88 Rosebery Avenue` for the `Address Line 2` answer
#    And within the `Address` fieldset, I should see `London` for the `Town or City` answer
#    And within the `Address` fieldset, I should see `EC1R 4QU` for the `Postcode/Zipcode` answer
#    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` answer
#    And I should see `janeDoe@test.com` for the `Email address` answer
#    And I should see `29 Dec 1999` for the `Date of birth` answer
#    And I should see `Aunt` for the `Relationship to the applicant` answer
#    And I should see `Lawyer` for the `Occupation` answer
#    And I should see `Immigrant` for the `Immigration status` answer
#    And within the `Nationalities` collection's first item, I should see `Angolan` for the `Nationality` field
#    And I should see `Yes` for the `Passport` answer
#    And I should see `550` for the `Financial condition amount (£)` answer
#    And I should see `No` for the `Financial condition supporter 3` answer
#    # Grounds for bail
#    And I should see `Grounds for bail` for the `Enter the bail grounds` answer
#    And I should see `No` for the `Transfer bail management` answer
#    And I should see `They do not consent to bail being transferred` for the `Explain why the applicant does not consent to bail being transferred` answer
#    # Hearing requirements
#    And I should see `Yes` for the `Disability` answer
#    And I should see `They need special arrangements` for the `Explain any special arrangements needed for the hearing` answer
#    And I should see `No` for the `Able to join video hearing` answer
#    And I should see `They can't join video` for the `Explain why the applicant would not be able to join the hearing by video link` answer
#    # Representative details
#    And I should see `No` for the `Legal representative` answer

    Given I click the `Save application` button
    And I should see the text `You have saved this application`
    And I click the `Close and Return to case details` button
    Then I should see the text `Case record`










































  Given I am on the `Your client's address` page
    When I select `Yes` for the `Does the appellant have a fixed address?` field
    And I see the text `Enter a UK postcode`
    And I type `SW1A 2AA` for the `Enter a UK postcode` field
    And I click the `Find address` button
    And I see the text `Select an address`
    And I wait for any found addresses to load
    And I select `Prime Minister & First Lord Of The Treasury, 10 Downing Street, London` for the `Select an address` field
    And I see the text `Building and Street`
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    When I select `Text message` for the `Communication Preference` field
    And I type `07930111111` for the `Mobile phone number` field
    And I click the `Continue` button

    Given I am on the `Type of appeal` page
    When I select `Refusal of protection claim` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Continue` button

    Given I am on the `Deportation order` page
    When I select `Yes` for the `Has a deportation order been made against the appellant?` field
    And I click the `Continue` button

    Given I am on the `New matters` page
    When I select `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I type `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I select `Yes` for the `Other appeals` field
    When I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    ###############################################################
    ### This is a bug logged in ServiceNow: Incident INC0484123 ###
    ###############################################################
    #Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I add an item to the `Appeal number` collection
    #And within the `Appeal number` collection's first item, I type `RP/12345/2014` for the field without a label
    #And I add another item to the `Appeal number` collection
    #And within the `Appeal number` collection's second item, I type `PA/54321/2015` for the field without a label
    #And I click the `Continue` button

    Given I am on the `Legal representative details` page
    When I type `IA Legal Services` for the `Company` field
    And I type `Stephen Fenn` for the `Name` field
    And I type `ia-legal-fenn` for the `Own reference` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `31 Oct 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
    And within the `Nationality` collection's second item, I should see `Iceland` for the `Nationality` answer
    And I should see `Yes` for the `Does the appellant have a fixed address?` answer
    And within the `Address` fieldset, I should see `Prime Minister & First Lord Of The Treasury` for the `Building and Street` answer
    And within the `Address` fieldset, I should see `10 Downing Street` for the `Address Line 2` answer
    And within the `Address` fieldset, I should see `London` for the `Town or City` answer
    And within the `Address` fieldset, I should see `SW1A 2AA` for the `Postcode/Zipcode` answer
    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` answer
    And I should see `Text message` for the `Communication Preference` answer
    And I should see `07930111111` for the `Mobile phone number` answer
    And I should see `Refusal of protection claim` for the `Type of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    #And I should see `Yes` for the `Other appeals` answer
    And I should see `Yes, but I don't have an appeal number` for the `Other appeals` answer
    #And within the `Appeal number` collection's first item, I should see `RP/12345/2014` for the answer without a label
    #And within the `Appeal number` collection's second item, I should see `PA/54321/2015` for the answer without a label
    And I should see `IA Legal Services` for the `Company` answer
    And I should see `Stephen Fenn` for the `Name` answer
    And I should see `ia-legal-fenn` for the `Own reference` answer
    And I should see `Yes` in the `Has a deportation order been made against the appellant?` field

    When I click the `Save and continue` button
    Then I should see the text `Your appeal details have been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit your appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`


    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Appellant` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `Mr` for the `Title` field
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And within the `Nationalities` collection's second item, I should see `Iceland` for the `Nationality` field
    And I should see `Yes` for the `Does the appellant have a fixed address?` field
    And within the `Address` fieldset, I should see `Prime Minister & First Lord Of The Treasury` for the `Building and Street` field
    And within the `Address` fieldset, I should see `10 Downing Street` for the `Address Line 2` field
    And within the `Address` fieldset, I should see `London` for the `Town or City` field
    And within the `Address` fieldset, I should see `SW1A 2AA` for the `Postcode/Zipcode` field
    And within the `Address` fieldset, I should see `United Kingdom` for the `Country` field
    And I should see `Text message` for the `Communication Preference` field
    And I should see `07930111111` for the `Mobile phone number` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `Yes, but I don't have an appeal number` for the `Previous appeals` field
    And I should see `31 Oct 2018` for the `Home Office decision letter sent` field
    And I should see `Yes` in the `Has a deportation order been made against the appellant?` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the `Submit your appeal` link
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `01234567` for the `Home Office Reference/Case ID` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field



  @regression @start-appeal @happy-path @RIA-3334
  Scenario: Start initial appeal application with legal rep address

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

    Given I am on the `Home Office details` page
    When I type `01234567` for the `Home Office Reference/Case ID` field
    And I type `31-10-2018` for the `Enter the date the decision letter was sent` field
    And I click the `Continue` button

    Given I am on the `Basic details` page
    And I type `Mr` for the `Title` field
    And I type `José` for the `Given names` field
    And I type `González` for the `Family name` field
    And I type `31-12-1999` for the `Date of birth` field
    And I add an item to the `Nationality` collection
    And within the `Nationality` collection's first item, I select `Finland` for the `Nationality` field
    And I add another item to the `Nationality` collection
    And within the `Nationality` collection's second item, I select `Iceland` for the `Nationality` field
    And I click the `Continue` button

    Given I am on the `Your client's address` page
    When I select `No` for the `Does the appellant have a fixed address?` field
    And I click the `Continue` button

    Given I am on the `The appellant's contact preference` page
    When I select `Text message` for the `Communication Preference` field
    And I type `07930111111` for the `Mobile phone number` field
    And I click the `Continue` button

    Given I am on the `Type of appeal` page
    When I select `Refusal of protection claim` for the `Type of appeal` field
    And I click the `Continue` button

    Given I am on the `The grounds of your appeal` page
    When I click the `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` label
    And I click the `Continue` button

    Given I am on the `Deportation order` page
    When I select `Yes` for the `Has a deportation order been made against the appellant?` field
    And I click the `Continue` button

    Given I am on the `New matters` page
    When I select `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I type `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I click the `Continue` button

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I select `Yes` for the `Other appeals` field
    When I select `Yes, but I don't have an appeal number` for the `Other appeals` field
    And I click the `Continue` button

    ###############################################################
    ### This is a bug logged in ServiceNow: Incident INC0484123 ###
    ###############################################################
    #Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    #When I add an item to the `Appeal number` collection
    #And within the `Appeal number` collection's first item, I type `RP/12345/2014` for the field without a label
    #And I add another item to the `Appeal number` collection
    #And within the `Appeal number` collection's second item, I type `PA/54321/2015` for the field without a label
    #And I click the `Continue` button

    Given I am on the `Legal representative details` page
    When I type `IA Legal Services` for the `Company` field
    And I type `Stephen Fenn` for the `Name` field
    And I type `ia-legal-fenn` for the `Own reference` field
    And I click the `Continue` button

    When I am on the `Fee remissions` page
    Then I select `My client has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Fee remissions` page
    And I select `My client receives Legal Aid` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Given I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `31 Oct 2018` for the `Enter the date the decision letter was sent` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `31 Dec 1999` for the `Date of birth` answer
    #And within the `Nationality` collection's first item, I should see `Finland` for the `Nationality` answer
   # And within the `Nationality` collection's second item, I should see `Iceland` for the `Nationality` answer
    And I should see `No` for the `Does the appellant have a fixed address?` answer
    And I should see `Text message` for the `Communication Preference` answer
    And I should see `07930111111` for the `Mobile phone number` answer
    And I should see `Refusal of protection claim` for the `Type of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    #And I should see `Yes` for the `Other appeals` answer
    And I should see `Yes, but I don't have an appeal number` for the `Other appeals` answer
    #And within the `Appeal number` collection's first item, I should see `RP/12345/2014` for the answer without a label
    #And within the `Appeal number` collection's second item, I should see `PA/54321/2015` for the answer without a label
    And I should see `IA Legal Services` for the `Company` answer
    And I should see `Stephen Fenn` for the `Name` answer
    And I should see `ia-legal-fenn` for the `Own reference` answer
    And I should see `Yes` in the `Has a deportation order been made against the appellant?` field

    When I click the `Save and continue` button
    Then I should see the text `Your appeal details have been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit your appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button
    #And I see the open case
    And I click the `Appellant` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `Mr` for the `Title` field
    And I should see `José` for the `Given names` field
    And I should see `González` for the `Family name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And within the `Nationalities` collection's second item, I should see `Iceland` for the `Nationality` field
    And I should see `No` for the `Does the appellant have a fixed address?` field
    And I should see `Text message` for the `Communication Preference` field
    And I should see `07930111111` for the `Mobile phone number` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `Stephen Fenn` for the `Name` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field

    When I click the `Appeal` tab
    Then I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` field
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` field
    And I should see `Yes, but I don't have an appeal number` for the `Previous appeals` field
    And I should see `31 Oct 2018` for the `Home Office decision letter sent` field
    And I should see `Yes` in the `Has a deportation order been made against the appellant?` field

    When I click the `Overview` tab
    Then I should only see the `progress_legalRep_appealStarted` case progress image
    And I should see the text `Do this next`
    And I should see the `Submit your appeal` link
    And I should see the `Edit appeal` link
    And I should see `DRAFT` for the `Appeal reference` field
    And I should see `José González` for the `Appellant name` field
    And I should see `31 Dec 1999` for the `Date of birth` field
    And within the `Nationalities` collection's first item, I should see `Finland` for the `Nationality` field
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `01234567` for the `Home Office Reference/Case ID` field
    And I should see `IA Legal Services` for the `Company` field
    And I should see `ia-legal-fenn` for the `Legal representative reference` field
