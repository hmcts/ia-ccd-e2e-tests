Feature: Resident judge record the appellant decision and reasons

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
    And I switch to be a `Legal Org User Rep A`
    And I apply for appellant FTPA

  @ftpa-appellant-resident-judge-decision-granted @ftpa-appellant-resident-judge-decision @RIA-2527 @RIA-2571 @RIA-3211
  Scenario: FTPA appellant resident judge decision - Granted
    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type

    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I should see the text `Do not issue any case specific directions to the parties regarding the onward conduct`
    And I should see the text `of the appeal in the Upper Tribunal. The Upper Tribunal will prepare and issue`
    And I should see the text `standard directions in every case. You should refer the file to the Principal Resident`
    And I should see the text `Judge of UTIAC if you believe further directions should be issued in advance of the`
    And I should see the text `initial Upper Tribunal Hearing.`
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Appellant` in the `Who made the application?` field
    And I should see `Permission granted` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Yes` in the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `There is a point of special difficulty or importance` in the `Tick any applicable points` field
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision. The Upper Tribunal has also been`
    And I should see the text `notified, and will now proceed with the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Appellant: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `No further action required.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Appellant: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `No further action required.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Appellant: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `Send all information and documents related to this case to the Upper Tribunal.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    Then I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    Then I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    Then I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I should see the text `Do not issue any case specific directions to the parties regarding the onward conduct`
    And I should see the text `of the appeal in the Upper Tribunal. The Upper Tribunal will prepare and issue`
    And I should see the text `standard directions in every case. You should refer the file to the Principal Resident`
    And I should see the text `Judge of UTIAC if you believe further directions should be issued in advance of the`
    And I should see the text `initial Upper Tribunal Hearing.`
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Permission granted` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Yes` in the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `There is a point of special difficulty or importance` in the `Tick any applicable points` field
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision. The Upper Tribunal has also been`
    And I should see the text `notified, and will now proceed with the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Home Office: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-appellant-resident-judge-decision-partially-granted @ftpa-appellant-resident-judge-decision @RIA-2527 @RIA-2571 @RIA-3211
  Scenario: FTPA appellant resident judge decision - Partially granted
    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type

    And I click the `Continue` button
    And I select `Permission partially granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I should see the text `Do not issue any case specific directions to the parties regarding the onward conduct`
    And I should see the text `of the appeal in the Upper Tribunal. The Upper Tribunal will prepare and issue`
    And I should see the text `standard directions in every case. You should refer the file to the Principal Resident`
    And I should see the text `Judge of UTIAC if you believe further directions should be issued in advance of the`
    And I should see the text `initial Upper Tribunal Hearing.`
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Appellant` in the `Who made the application?` field
    And I should see `Permission partially granted` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Yes` in the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `There is a point of special difficulty or importance` in the `Tick any applicable points` field
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision. The Upper Tribunal has also been`
    And I should see the text `notified, and will now proceed with the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Appellant: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `No further action required.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Appellant: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `No further action required.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Appellant: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `Send all information and documents related to this case to the Upper Tribunal.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    And I should see the image `ftpaGranted.png`
    And I should see the text `The Upper Tribunal will review the application and make a decision.`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Permission partially granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I should see the text `Do not issue any case specific directions to the parties regarding the onward conduct`
    And I should see the text `of the appeal in the Upper Tribunal. The Upper Tribunal will prepare and issue`
    And I should see the text `standard directions in every case. You should refer the file to the Principal Resident`
    And I should see the text `Judge of UTIAC if you believe further directions should be issued in advance of the`
    And I should see the text `initial Upper Tribunal Hearing.`
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Permission partially granted` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Yes` in the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `There is a point of special difficulty or importance` in the `Tick any applicable points` field
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision. The Upper Tribunal has also been`
    And I should see the text `notified, and will now proceed with the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field
    And I should see the text `Home Office: Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-appellant-resident-judge-decision-refused @ftpa-appellant-resident-judge-decision @RIA-2527 @RIA-2571 @RIA-3211
  Scenario: FTPA appellant resident judge decision - refused
    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type

    And I click the `Continue` button
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    When I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Appellant` in the `Who made the application?` field
    And I should see `Permission refused` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Yes` in the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified that permission was refused. They'll also be able to access this information in the FTPA tab.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `No further action required.`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `No further action required.`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Description` field
    And within the `FTPA Appellant documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `FTPA Appellant documents` collection's second item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `FTPA Appellant documents` collection's second item, I should see `This is the FTPA Appellant evidence` in the `Description` field
    And within the `FTPA Appellant documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `No further action required.`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `The appeal has been dismissed. You have the right to apply for permission to appeal to the Upper Tribunal. You have 14 days to apply from the date the Decision and Reasons document was uploaded.`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `The appeal has been dismissed.`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `The appeal has been dismissed.`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    And I click the `Overview` tab
    And I should see the image `appeal_dismissed.png`
    And I should see the text `The appeal has been dismissed.`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I select `Yes` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field

    When I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Permission refused` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Yes` in the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified that permission was refused. They'll also be able to access this information in the FTPA tab.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-appellant-resident-judge-decision-reheard-rule-35 @ftpa-appellant-resident-judge-decision @RIA-2527 @RIA-2571 @RIA-3211
  Scenario: FTPA appellant resident judge decision - reheard-rule-35
    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of instructions` for the `Listing instructions (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Appellant` in the `Who made the application?` field
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `These are list of instructions` in the `Listing instructions` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties will be notified of the decision. A Caseworker will review any Tribunal`
    And I should see the text `instructions and then relist the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `Do this next`
    And I should see the text `Check the FTPA tab and follow any instructions the judge has made to the Tribunal. Once you've done this you should record the length of the hearing`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field


    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` document field
    And within the `Notice communication` collection's first item, I type `This is the ftpa notice of communication` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of instructions` for the `Listing instructions (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `These are list of objections to the draft Notice` in the `List any objections to the draft Notice from either party` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` for the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` for the `Describe the document` field
    And I should see `These are list of instructions` in the `Listing instructions` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties will be notified of the decision. A Caseworker will review any Tribunal`
    And I should see the text `instructions and then relist the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And within the `Notice communication` collection's first item, I should see `FTPANoticeOfCommunication.pdf` in the `Document` field
    And within the `Notice communication` collection's first item, I should see `This is the ftpa notice of communication` in the `Describe the document` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-appellant-resident-judge-decision-reheard-rule-32 @ftpa-appellant-resident-judge-decision @RIA-2527 @RIA-2571 @RIA-3211
  Scenario: FTPA appellant resident judge decision - reheard-rule-32
    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of instructions` for the `Listing instructions (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Appellant` in the `Who made the application?` field
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `These are list of instructions` in the `Listing instructions` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties will be notified of the decision. A Caseworker will review any Tribunal`
    And I should see the text `instructions and then relist the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `Do this next`
    And I should see the text `Check the FTPA tab and follow any instructions the judge has made to the Tribunal. Once you've done this you should record the length of the hearing`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `A Caseworker will review any Tribunal instructions and then relist the case.`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of instructions` for the `Listing instructions (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `These are list of instructions` in the `Listing instructions` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties will be notified of the decision. A Caseworker will review any Tribunal`
    And I should see the text `instructions and then relist the case.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-appellant-resident-judge-decision-remade-rule-32 @ftpa-appellant-resident-judge-decision @RIA-2527 @RIA-3211
  Scenario: FTPA appellant resident judge decision - remade-rule-32
    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I select `Allowed` for the `What is the First-tier Tribunal's decision on this case following the FTPA?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Appellant` in the `Who made the application?` field
    And I should see `Decision set aside and remade in the First-tier under rule 32` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Allowed` in the `What is the First-tier Tribunal's decision on this case following the FTPA?` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `No further action required.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `No further action required.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The decision was set aside and remade under rule 32 following an application for permission to appeal to the Upper Tribunal. You can apply to the Upper Tribunal directly.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Appellant Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `No further action required.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    Then I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The decision was set aside and remade under rule 32 following an application for permission to appeal to the Upper Tribunal. You can apply to the Upper Tribunal directly.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    Then I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The decision was set aside and remade under rule 32 following an application for permission to appeal to the Upper Tribunal. You can apply to the Upper Tribunal directly.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    Then I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The decision was set aside and remade under rule 32 following an application for permission to appeal to the Upper Tribunal. You can apply to the Upper Tribunal directly.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the text `Appellant: Decision on permission to appeal`
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the text `Appellant: application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should not see the text `Appellant: Tribunal Notes`

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
    And I should not see the `FTPA Appellant documents` field

    Then I click the `Overview` tab
    And I should see the image `appeal_allowed.png`
    And I should see the text `What happens next`
    And I should see the text `The decision was set aside and remade under rule 32 following an application for permission to appeal to the Upper Tribunal. You can apply to the Upper Tribunal directly.`
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I should see `Allowed` for the `New decision of appeal` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` document field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I select `Allowed` for the `What is the First-tier Tribunal's decision on this case following the FTPA?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Decision set aside and remade in the First-tier under rule 32` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `Allowed` in the `What is the First-tier Tribunal's decision on this case following the FTPA?` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and remade in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
