Feature: Request respondent evidence

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    Then I should be on the overview page
    And I pay for and submit my appeal by Card
    And I switch to be a `Case Officer`
    And I check the case has been paid for

  @regression @create-direction @RIA-892 @RIA-2694 @appeal-nightly-test
  Scenario: Request respondent evidence

    And I click the `Overview` tab
    And I should see the text `You must review the appeal data and cross reference it with Home Office data in the Validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`

    When I select the `Request Home Office data` Next step
    And I am on the `Match appellant details` page
    And I should see the option `No Match` for the `Make a selection` field
    And I select `No Match` for the `Make a selection` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `No Match` for the `Make a selection` field
    And I click the `Request Home Office data` button

    Then I should see the text `You have matched the appellant details`
    And I should see the text `Do this next`
    And I should see the text `You must review the appeal data and cross reference it with Home Office data in the validation tab. If the appeal looks valid, you must tell the respondent to supply their evidence.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I wait for 5 seconds
    Then I click the `Validation` tab
    And I should see the text `There are no matching details for this appellant. You can contact the Home Office if you need more information to validate the appeal.`

    When I select the `Request respondent evidence` Next step
    Then I am on the `Request respondent evidence` page
    And I see the default text in the Request respondent evidence text area input field
    And I should see `A notice of appeal has been lodged against this decision.` in the `Explain the direction you are issuing` text area input field
    And I should see `By the date indicated below the respondent is directed to supply the documents:` in the `Explain the direction you are issuing` text area input field
    And I should see `The bundle must comply with (i) Rule 23 or Rule 24 of the Tribunal Procedure Rules 2014 (as applicable) and (ii) Practice Direction (1.11.2024) Part 3, sections 7.1 - 7.4. Specifically, the bundle must contain:` in the `Explain the direction you are issuing` text area input field
    And I should see `- the notice of decision appealed against.` in the `Explain the direction you are issuing` text area input field
    And I should see `- any other document provided to the appellant giving reasons for that decision.` in the `Explain the direction you are issuing` text area input field
    And I should see `- any evidence or material relevant to the disputed issues.` in the `Explain the direction you are issuing` text area input field
    And I should see `- any statements of evidence.` in the `Explain the direction you are issuing` text area input field
    And I should see `- the application form.` in the `Explain the direction you are issuing` text area input field
    And I should see `- any record of interview with the appellant in relation to the decision being appealed.` in the `Explain the direction you are issuing` text area input field
    And I should see `- any previous decision(s) of the Tribunal and Upper Tribunal (IAC) relating to the appellant.` in the `Explain the direction you are issuing` text area input field
    And I should see `- any other unpublished documents on which you rely.` in the `Explain the direction you are issuing` text area input field
    And I should see `- the notice of any other appealable decision made in relation to the appellant.` in the `Explain the direction you are issuing` text area input field
    And I should see `Where the appeal involves deportation, you must also include the following evidence:` in the `Explain the direction you are issuing` text area input field
    And I should see `- a copy of the Certificate of Conviction.` in the `Explain the direction you are issuing` text area input field
    And I should see `- a copy of any indictment/charge.` in the `Explain the direction you are issuing` text area input field
    And I should see `- a transcript of the Sentencing Judge's Remarks.` in the `Explain the direction you are issuing` text area input field
    And I should see `- a copy of any Pre-Sentence Report.` in the `Explain the direction you are issuing` text area input field
    And I should see `- a copy of the appellant's criminal record.` in the `Explain the direction you are issuing` text area input field
    And I should see `- a copy of any Parole Report or other document relating to the appellant's period in custody and/or release.` in the `Explain the direction you are issuing` text area input field
    And I should see `- a copy of any mental health report.` in the `Explain the direction you are issuing` text area input field
    And I should see `Parties must ensure they conduct proceedings with procedural rigour. The Tribunal will not overlook breaches of the requirements of the Procedure Rules, Practice Statement or Practice Direction, nor failures to comply with directions issued by the Tribunal. Parties are reminded of the sanctions for non-compliance set out in paragraph 5.3 of the Practice Direction of 01.11.24.` in the `Explain the direction you are issuing` text area input field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14}` for the `By what date must they comply?` date input field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `A notice of appeal has been lodged against this decision.` in the `Explain the direction you are issuing` field
    And I should see `By the date indicated below the respondent is directed to supply the documents:` in the `Explain the direction you are issuing` field
    And I should see `The bundle must comply with (i) Rule 23 or Rule 24 of the Tribunal Procedure Rules 2014 (as applicable) and (ii) Practice Direction (1.11.2024) Part 3, sections 7.1 - 7.4. Specifically, the bundle must contain:` in the `Explain the direction you are issuing` field
    And I should see `- the notice of decision appealed against.` in the `Explain the direction you are issuing` field
    And I should see `- any other document provided to the appellant giving reasons for that decision.` in the `Explain the direction you are issuing` field
    And I should see `- any evidence or material relevant to the disputed issues.` in the `Explain the direction you are issuing` field
    And I should see `- any statements of evidence.` in the `Explain the direction you are issuing` field
    And I should see `- the application form.` in the `Explain the direction you are issuing` field
    And I should see `- any record of interview with the appellant in relation to the decision being appealed.` in the `Explain the direction you are issuing` field
    And I should see `- any previous decision(s) of the Tribunal and Upper Tribunal (IAC) relating to the appellant.` in the `Explain the direction you are issuing` field
    And I should see `- any other unpublished documents on which you rely.` in the `Explain the direction you are issuing` field
    And I should see `- the notice of any other appealable decision made in relation to the appellant.` in the `Explain the direction you are issuing` field
    And I should see `Where the appeal involves deportation, you must also include the following evidence:` in the `Explain the direction you are issuing` field
    And I should see `- a copy of the Certificate of Conviction.` in the `Explain the direction you are issuing` field
    And I should see `- a copy of any indictment/charge.` in the `Explain the direction you are issuing` field
    And I should see `- a transcript of the Sentencing Judge's Remarks.` in the `Explain the direction you are issuing` field
    And I should see `- a copy of any Pre-Sentence Report.` in the `Explain the direction you are issuing` field
    And I should see `- a copy of the appellant's criminal record.` in the `Explain the direction you are issuing` field
    And I should see `- a copy of any Parole Report or other document relating to the appellant's period in custody and/or release.` in the `Explain the direction you are issuing` field
    And I should see `- a copy of any mental health report.` in the `Explain the direction you are issuing` field
    And I should see `Parties must ensure they conduct proceedings with procedural rigour. The Tribunal will not overlook breaches of the requirements of the Procedure Rules, Practice Statement or Practice Direction, nor failures to comply with directions issued by the Tribunal. Parties are reminded of the sanctions for non-compliance set out in paragraph 5.3 of the Practice Direction of 01.11.24.` in the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+14|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `Wait for the respondent to complete the direction`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `A notice of appeal has been lodged against this decision.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `By the date indicated below the respondent is directed to supply the documents:` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `The bundle must comply with (i) Rule 23 or Rule 24 of the Tribunal Procedure Rules 2014 (as applicable) and (ii) Practice Direction (1.11.2024) Part 3, sections 7.1 - 7.4. Specifically, the bundle must contain:` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- the notice of decision appealed against.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- any other document provided to the appellant giving reasons for that decision.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- any evidence or material relevant to the disputed issues.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- any statements of evidence.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- the application form.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- any record of interview with the appellant in relation to the decision being appealed.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- any previous decision(s) of the Tribunal and Upper Tribunal (IAC) relating to the appellant.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- any other unpublished documents on which you rely.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- the notice of any other appealable decision made in relation to the appellant.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Where the appeal involves deportation, you must also include the following evidence:` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a copy of the Certificate of Conviction.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a copy of any indictment/charge.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a transcript of the Sentencing Judge's Remarks.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a copy of any Pre-Sentence Report.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a copy of the appellant's criminal record.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a copy of any Parole Report or other document relating to the appellant's period in custody and/or release.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `- a copy of any mental health report.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Parties must ensure they conduct proceedings with procedural rigour. The Tribunal will not overlook breaches of the requirements of the Procedure Rules, Practice Statement or Practice Direction, nor failures to comply with directions issued by the Tribunal. Parties are reminded of the sanctions for non-compliance set out in paragraph 5.3 of the Practice Direction of 01.11.24.` in the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+14|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field

  @regression @create-direction @RIA-892
  Scenario: Request respondent evidence with changes to default values

    When I select the `Request respondent evidence` Next step
    Then I am on the `Request respondent evidence` page
    When I type `Something else` for the `Explain the direction you are issuing` field
    When I type `{$TODAY+20|DD MM YYYY}` for the `By what date must they comply?` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Something else` for the `Explain the direction you are issuing` field
    And I should see `Respondent` for the `Who are you giving the direction to?` field
    And I should see `{$TODAY+20|D MMM YYYY}` for the `By what date must they comply?` field

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    #And I see the open case
    And I click the `Directions` tab
    And within the `Directions` collection's first item, I should see `Something else` for the `Explanation` field
    And within the `Directions` collection's first item, I should see `Respondent` for the `Parties` field
    And within the `Directions` collection's first item, I should see `{$TODAY+20|D MMM YYYY}` for the `Date due` field
    And within the `Directions` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date sent` field
