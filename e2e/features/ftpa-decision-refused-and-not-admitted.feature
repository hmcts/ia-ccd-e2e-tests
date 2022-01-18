Feature: FTPA Appellant and Respondent application refused and not-admitted


  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 8 seconds
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


  @ftpa-appellant-refused @RIA-4404-appellant-refused @RIA-4404
  Scenario: FTPA Appellant application refused

    And I switch to be a `Legal Org User Rep A`
    And I apply for appellant FTPA

    When I switch to be a Judge
    And I click the `record the application decision` link
    And I am on the `Leadership judge FTPA decision` page
    And I select Appellant for the applicant type
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

  @ftpa-appellant-not-admitted @RIA-4404-appellant-not-admitted @RIA-4404
  Scenario: FTPA Appellant application not admitted
    When I switch to be a Judge
    And I click the `record the application decision` link
    And I am on the `Leadership judge FTPA decision` page
    And I select Appellant for the applicant type
    And I select `Application not admitted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the text `Appellant: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Appellant: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field

  @ftpa-respondent-refused @RIA-4404-respondent-refused @RIA-4404
  Scenario: FTPA Appellant application refused

    And I switch to be a `Home Office Generic`
    And I apply for respondent FTPA

    When I switch to be a Judge
    And I click the `record the application decision` link
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field

  @ftpa-respondent-not-admitted @RIA-4404-respondent-not-admitted @RIA-4404
  Scenario: FTPA Appellant application not admitted

    When I switch to be a Judge
    And I click the `record the application decision` link
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type
    And I select `Application not admitted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office APC`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Home Office LART`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And within the `Grounds of the application` collection's first item, I should see `FTPAAppealGrounds.pdf` in the `Document` field
    And within the `Grounds of the application` collection's first item, I should see `This is the FTPA Appellant grounds` in the `Describe the document` field
    And within the `Supporting evidence` collection's first item, I should see `FTPAAppellantEvidence.pdf` in the `Document` field
    And within the `Supporting evidence` collection's first item, I should see `This is the FTPA Appellant evidence` in the `Describe the document` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `FTPA` tab
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Respondent: Application for permission to appeal`
    And I should see `{$TODAY|D MMM YYYY}` in the `Application date` field
    And I should not see the `Grounds of the application` field
    And I should not see the `Supporting evidence` field

