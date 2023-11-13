Feature: New Overview tab - FTPA resident judge records the appellant decision and reasons

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
    And I wait for 10 seconds
    And I reload the Case Overview Page
    And I start decision and reasons
    And I prepare decision and reasons
    And I send decision and reasons
    And I switch to be a `Home Office POU`
    And I apply for respondent FTPA


  @ftpa-reheard-feature @ftpa-reheard-rule-35 @RIA-3651
  Scenario: New Overview tab - FTPA respondent resident judge decision (Reheard Rule 35)

    When I switch to be a Judge
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    And I click the `Continue` button
    And I type `These are list of objections to the draft Notice` for the `List any objections to the draft Notice from either party (Optional)` field
    And I add an item to the `Notice communication` collection
    And within the `Notice communication` collection's first item, I upload `{@FTPANoticeOfCommunication.pdf}` for the `Document` field
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
    And I click the `Close and Return to case details` button if present

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any Tribunal instructions and then the listing team will relist the case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. First check the FTPA tab and follow any instructions the Judge has made to the Tribunal`
    And I should see the text `You should then direct the appellant to submit any new requirements`
    And I should see the `FTPA tab` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I click the `FTPA tab` link
    Then I should see the `FTPA` page

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case is ready to be listed.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified if you need to do anything.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 35` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field


  @ftpa-reheard-feature @ftpa-reheard-rule-32 @RIA-3651
  Scenario: New Overview tab - FTPA respondent resident judge decision (Reheard Rule 32)

    When I switch to be a Judge
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type

    And I click the `Continue` button
    And I select `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
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
    Then I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    And I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any Tribunal instructions and then the listing team will relist the case.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Case Officer`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `Do this next`
    And I should see the text `The appeal is being reheard. First check the FTPA tab and follow any instructions the Judge has made to the Tribunal`
    And I should see the text `You should then direct the appellant to submit any new requirements`
    And I should see the `FTPA tab` link
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I click the `FTPA tab` link
    Then I should see the `FTPA` page

    When I switch to be a `Admin Officer`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case is ready to be listed.`
    And I should see the text `These flags are only visible to the Tribunal`
    And I should see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified if you need to do anything.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office APC`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office POU`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office LART`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    When I switch to be a `Home Office Generic`
    Then I click the `Overview` tab
    And I should see the image `appeal_reheard.png`
    And I should see the text `What happens next`
    And I should see the text `The appeal is being reheard. A Tribunal Caseworker will review any instructions from the Judge and you will be notified when the case has been listed.`
    And I should not see the text `These flags are only visible to the Tribunal`
    And I should not see the image `caseFlagSetAsideReheard.svg`
    And I should see `Decision set aside and to be reheard in the First-tier under rule 32` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

