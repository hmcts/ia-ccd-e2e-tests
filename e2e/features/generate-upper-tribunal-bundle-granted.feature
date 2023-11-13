Feature: Generate Upper Tribunal Bundle (FTPA granted)

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I pay for and submit my appeal by PBA for a PA appeal type
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
    And I wait for 30 seconds
    And I switch to be a `Case Officer`
    And I start decision and reasons
    And I prepare decision and reasons
    And I send decision and reasons


  @RIA-4351 @RIA-4351-granted @RIA-4351-granted-leadership-judge-appellant
  Scenario: Generate Upper Tribunal Bundle - FTPA Granted (Leadership Judge / Appellant)

    When I switch to be a `Legal Org User Rep A`
    Then I apply for appellant FTPA

    When I switch to be a `Judge`
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Appellant for the applicant type
    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button if present
    And I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`

    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should see the image `ftpaGranted.png`
    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I select the `Generate Upper Tribunal bundle` Next step
    Then I am on the `Generate Upper Tribunal bundle` page
    When I click the `Generate` button
    Then I should see the text `The Upper Tribunal bundle is being generated`
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`

    When I click the `Close and Return to case details` button if present
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`
    And I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I wait for 10 seconds

    When I switch to be a `Admin Officer`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the `documents tab` link
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `documents tab` link
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Judge`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `Documents` tab
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field


  @RIA-4351 @RIA-4351-granted @RIA-4351-granted-leadership-judge-respondent
  Scenario: Generate Upper Tribunal Bundle - FTPA Granted (Leadership Judge / Respondent)

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type
    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I should see the text `You've recorded the First-tier permission to appeal decision`
    And I click the `Close and Return to case details` button if present
    And I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`

    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should see the image `ftpaGranted.png`
    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I select the `Generate Upper Tribunal bundle` Next step
    Then I am on the `Generate Upper Tribunal bundle` page
    When I click the `Generate` button
    Then I should see the text `The Upper Tribunal bundle is being generated`
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`

    When I click the `Close and Return to case details` button if present
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`
    And I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I wait for 10 seconds

    When I switch to be a `Admin Officer`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the `documents tab` link
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `documents tab` link
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Judge`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `Documents` tab
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field


  @RIA-4351 @RIA-4351-granted @RIA-4351-granted-resident-judge-appellant
  Scenario: Generate Upper Tribunal Bundle - FTPA Granted (Resident Judge / Appellant)

    When I switch to be a `Legal Org User Rep A`
    Then I apply for appellant FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Appellant for the applicant type
    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I select `No` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I click the `Continue` button
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I click the `Close and Return to case details` button if present
    And I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`

    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should see the image `ftpaGranted.png`
    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I select the `Generate Upper Tribunal bundle` Next step
    Then I am on the `Generate Upper Tribunal bundle` page
    When I click the `Generate` button
    Then I should see the text `The Upper Tribunal bundle is being generated`
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`

    When I click the `Close and Return to case details` button if present
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`
    And I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I wait for 10 seconds

    When I switch to be a `Admin Officer`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the `documents tab` link
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `documents tab` link
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Judge`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `Documents` tab
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field


  @RIA-4351 @RIA-4351-granted @RIA-4351-granted-resident-judge-respondent
  Scenario: Generate Upper Tribunal Bundle - FTPA Granted (Resident Judge / Respondent)

    When I switch to be a `Home Office POU`
    Then I apply for respondent FTPA

    When I switch to be a `Judge`
    And I select the `Resident judge FTPA decision` Next step
    And I am on the `Resident judge FTPA decision` page
    And I select Home Office for the applicant type
    And I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field
    And I click the `Continue` button
    And I select `No` for the `Before this decision, did you send a Notice of Decision set aside and to be reheard in the First-tier under rule 35?` field
    And I click the `Continue` button
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field
    And I click the `Continue` button
    And I am on the `Check your answers` page
    And I click the `Submit` button
    And I click the `Close and Return to case details` button if present
    And I should see an alert confirming the case `has been updated with event: Resident judge FTPA decision`
    And I click the `Overview` tab
    And I should see the image `ftpaGranted.png`

    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Admin Officer`
    And I click the `Overview` tab
    Then I should see the image `ftpaGranted.png`
    And I should see the text `Do this next`
    And I should see the text `You must create a bundle for the Upper Tribunal.`
    And I should see the `Generate the Upper Tribunal bundle` link
    And I should see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I select the `Generate Upper Tribunal bundle` Next step
    Then I am on the `Generate Upper Tribunal bundle` page
    When I click the `Generate` button
    Then I should see the text `The Upper Tribunal bundle is being generated`
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`

    When I click the `Close and Return to case details` button if present
    And I should see the text `What happens next`
    And I should see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`
    And I should see the text `If the bundle fails to generate, you will be notified and must follow the same steps to generate the bundle again.`
    And I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I wait for 10 seconds

    When I switch to be a `Admin Officer`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the `documents tab` link
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `documents tab` link
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Judge`
    Then I should see the image `ftpaGranted.png`
    Then I should not see the image `appeal_dismissed.png`
    And I should see the text `What happens next`
    And I should see the text `The Upper Tribunal bundle has been generated and is available to view and download in the documents tab.`
    And I should see the text `There is no further action required.`
    And I should not see the text `You will soon be able to view and download the bundle under Upper Tribunal documents in the documents tab.`

    And I click the `Documents` tab
    And I should see the `Upper Tribunal documents` field
    And within the `Upper Tribunal documents` collection's first item, I should see `-Upper-Tribunal-Bundle.pdf` in the `Document` field
    And within the `Upper Tribunal documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Legal Org User Rep A`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office LART`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field

    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should not see the text `You must create a bundle for the Upper Tribunal.`
    And I should not see the option `Generate Upper Tribunal bundle` for the `Next step` field
