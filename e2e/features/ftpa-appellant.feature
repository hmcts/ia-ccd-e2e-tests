Feature: FTPA Appellant application to the Upper Tribunal


  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I start decision and reasons
    And I prepare decision and reasons
    And I send decision and reasons


  @ftpa-appellant @RIA-1293 @RIA-2581
  Scenario: FTPA Appellant application
    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal has been decided. You have the right to apply for permission to appeal to the Upper Tribunal.`
    And I should see the text `You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    Then I should see the `apply for permission to appeal` link
    And I click the `apply for permission to appeal` link
    Then I should see the text `Apply for permission to appeal`
    Then I should see the text `Upload a document that explains the grounds of your application:`
    Then I should see the text `files must be no more than 100MB in size`
    Then I should see the text `You can upload jpg, png, svg, gif, doc and PDF files`
    Then I should see the text `before uploading a file, give it a meaningful file name. For example, application-to-appeal-Jsmith.pdf`
    Then I should see the text `Upload the grounds of your application`
    Then I should see the text `Upload any other evidence that supports this application (Optional)`

    When I add an item to the `Grounds of the application` collection
    And within the `Grounds of the application` collection's first item, I upload `{@FTPAAppellantGrounds.pdf}` for the `Document` field
    And within the `Grounds of the application` collection's first item, I type `This is the FTPA Appellant grounds` for the `Describe the document` field

    When I add an item to the `Supporting evidence (Optional)` collection
    And within the `Supporting evidence` collection's first item, I upload `{@FTPAAppellantEvidence.pdf}` for the `Document (Optional)` field
    And within the `Supporting evidence` collection's first item, I type `This is the FTPA Appellant evidence` for the `Describe the document (Optional)` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppellantGrounds.pdf` for the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field

    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` for the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field
    When I click the `Submit` button

    Then I should see the text `You've applied for permission to appeal to the Upper Tribunal`
    Then I should see the text `What happens next`
    Then I should see the text `The First-tier Tribunal will review your application and decide shortly.`

    When I click the `Close and Return to case details` button if present
    And I click the `Overview` tab
    And I should see the image `ftpaInProgress.png`
    And I should see the text `What happens next`
    And I should see the text `The First-tier Tribunal will consider the application and make a decision shortly. The application is available to view in the FTPA tab`
    Then I should see the `FTPA tab` link
    And I click the `FTPA tab` link
    And I should see the `FTPA` page
    And I verify the presence of appellant FTPA documents under FTPA tab

    When I click the `Documents` tab

    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppellantGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field


    ## CO
    When I switch to be a `Case Officer`
    And I should see the image `ftpaInProgress.png`
    And I should see the text `What happens next`
    And I should see the text `A judge will be assigned to consider the application, they'll then record their decision.`
    When I click the `FTPA` tab
    And I should see the `FTPA` page
    And I verify the presence of appellant FTPA documents under FTPA tab

    When I click the `Documents` tab

    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppellantGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field


    ## Admin Officer
    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    And I should see the image `ftpaInProgress.png`
    And I should see the text `Do this next`
    And I should see the text `Assign the application to a judge then record the judge's name.`
    Then I should see the `record the judge's name` link
    And I click the `record the judge's name` link
    And I should see the `Record allocated Judge` page
    And I click the `Cancel` link

    When I click the `FTPA` tab
    Then I should see the `FTPA` page
    And I verify the presence of appellant FTPA documents under FTPA tab

    When I click the `Documents` tab

    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppellantGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ## Judge
    When I switch to be a `Judge`
    When I click the `FTPA` tab
    Then I should see the `FTPA` page
    And I verify the presence of appellant FTPA documents under FTPA tab

    When I click the `Documents` tab

    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppellantGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ## Home Office APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `Do this next`
    And I should see the text `The appeal has been decided. The Decision and Reasons document is available in the documents tab.`

    When I click the `Documents` tab

    And I should not see the text `FTPA Appellant documents`
    And I click the `FTPA` tab
    And I should not see the text `Appellant: Application for permission to appeal`

    ## Home Office LART
    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `Do this next`
    And I should see the text `The appeal has been decided. The Decision and Reasons document is available in the documents tab.`

    When I click the `Documents` tab

    And I should not see the text `FTPA Appellant documents`
    And I click the `FTPA` tab
    And I should not see the text `Appellant: Application for permission to appeal`

    ## Home Office Generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal has been decided. You have the right to apply for permission to appeal to the Upper Tribunal.`
    And I should see the text `You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    Then I should see the `apply for permission to appeal` link

    When I click the `Documents` tab

    And I should not see the text `FTPA Appellant documents`
    And I click the `FTPA` tab
    And I should not see the text `Appellant: Application for permission to appeal`

    ## Home Office POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal has been decided. You have the right to apply for permission to appeal to the Upper Tribunal.`
    And I should see the text `You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    Then I should see the `apply for permission to appeal` link

    When I click the `Documents` tab

    And I should not see the appellant FTPA documents under Documents tab
    And I click the `FTPA` tab
    And I should not see the appellant FTPA documents under FTPA tab

    When I submit FTPA Respondent appeal
    And I click the `Overview` tab
    And I should see the image `ftpaInProgress.png`
    And I should see the text `What happens next`
    And I should see the text `The First-tier Tribunal will consider the application and make a decision shortly. The application is available to view in the FTPA tab`
    Then I should see the `FTPA tab` link
    And I click the `FTPA tab` link
    And I should see the `FTPA` page
    And I verify the presence of respondent FTPA documents under FTPA tab


