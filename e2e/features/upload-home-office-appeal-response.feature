Feature: Upload appeal response - Home Office user

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review

  @regression @RIA-1309 @RIA-1810 @amend-appeal-response
  Scenario: Uploading appeal response adds documents

    When I select the `Add appeal response` Next step
    Then I am on the `Add appeal response` page
    When I upload `{@AppealResponse.pdf}` for the `Response document` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Evidence (Optional)` collection
    And within the `Evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Evidence (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponse.pdf` in the `Response document` field
    And I should see `This is the appeal response` in the `Describe the document` field
    And within the `Evidence` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Evidence` collection's first item, I should see `This is the evidence` in the `Describe the document` field

    When I click the `Cancel` button

    #    Home Office APC
    When I switch to be a `Home Office APC`
    Then I should not see the option `Upload the appeal response` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field


    #    Home Office POU
    When I switch to be a `Home Office POU`
    Then I should not see the option `Upload the appeal response` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field


    #    Home Office Generic
    When I switch to be a `Home Office Generic`
    Then I should see the option `Upload the appeal response` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field

    And I select the `Upload the appeal response` Next step
    Then I am on the `Upload the appeal response` page

    When I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponse.pdf` in the `Upload the appeal response` field
    And I should see `This is the appeal response` in the `Describe the document` field
    And within the `Add any additional evidence here` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Add any additional evidence here` collection's first item, I should see `This is the evidence` in the `Describe the document` field
    And I click the `Cancel` button

    #    Home Office LART
    When I switch to be a `Home Office LART`
    Then I should see the option `Upload the appeal response` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field
    And I select the `Upload the appeal response` Next step
    Then I am on the `Upload the appeal response` page

    When I upload `{@AppealResponse.pdf}` for the `Upload the appeal response` field
    And I type `This is the appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponse.pdf` in the `Upload the appeal response` field
    And I should see `This is the appeal response` in the `Describe the document` field
    And within the `Add any additional evidence here` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Add any additional evidence here` collection's first item, I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the appeal response`
    Then I should see the text `What happens next`
    Then I should see the text `Providing there are no issues, the response will be shared with the appellant.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # CO
    And I switch to be a `Case Officer`
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Legal Rep
    And I switch to be a `Legal Rep`
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Home Office APC
    And I switch to be a `Home Office APC`
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Home Office POU
    And I switch to be a `Home Office POU`
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `AppealResponse.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    #  Home Office appeal response amend request and upload amended documents.
    #    Home Office LART
    When I switch to be a `Home Office LART`
    Then I should see the option `Upload the appeal response` for the `Next step` field
    And I should see the option `Upload additional evidence` for the `Next step` field
    And I select the `Upload the appeal response` Next step
    Then I am on the `Upload the appeal response` page

    When I upload `{@AppealResponseUpdated.pdf}` for the `Upload the appeal response` field
    And I type `This is the updated appeal response` for the `Describe the document (Optional)` field
    And I add an item to the `Add any additional evidence here (Optional)` collection
    And within the `Add any additional evidence here (Optional)` collection's first item, I upload `{@AppealResponseEvidenceUpdated.pdf}` for the `Document (Optional)` field
    And within the `Add any additional evidence here (Optional)` collection's first item, I type `This is the updated evidence` for the `Describe the document (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `AppealResponseUpdated.pdf` in the `Upload the appeal response` field
    And I should see `This is the updated appeal response` in the `Describe the document` field
    And within the `Add any additional evidence here` collection's first item, I should see `AppealResponseEvidenceUpdated.pdf` for the `Document` field
    And within the `Add any additional evidence here` collection's first item, I should see `This is the updated evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the appeal response`
    Then I should see the text `What happens next`
    Then I should see the text `Providing there are no issues, the response will be shared with the appellant.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `AppealResponseUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated appeal response` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Respondent documents` collection's second item, I should see `AppealResponseEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @regression @add-home-office-pre-upload-response-link @RIA-1714
  Scenario Outline: add the Home Office's response from overview tab

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image
    And I should see the text `Do this next`
    And I should see the text `The respondent is reviewing the case, you'll be notified when their response has been uploaded.`

    # ho APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Appeal Skeleton Argument is ready to view in the documents tab.`

    # ho POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Appeal Skeleton Argument is ready to view in the documents tab.`


    # ho - apc & generic
    When I switch to be a <homeOfficeLartAndGeneric>
    And I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `Review the documents and add the Home Office's response, or contact the Tribunal for withdrawal of the decision.`
    And I upload the appeal response

    And I click the `Overview` tab
    Then I should only see the `homeOffice_appealResponseUploaded` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the Home Office response complies with the Procedure Rules and Practice Direction`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`




    Examples:
      | homeOfficeLartAndGeneric   |
      | Home Office LART     |
      | Home Office Generic  |


  @regression @add-home-office-post-upload-response-link @RIA-1803
  Scenario Outline: add the Home Office's response from overview tab

    When I switch to be a `Case Officer`
    And I click the `Overview` tab
    Then I should only see the `caseOfficer_respondentReviewStarted` case progress image
    And I should see the text `Do this next`
    And I should see the text `The respondent is reviewing the case, you'll be notified when their response has been uploaded.`

    # ho APC
    When I switch to be a `Home Office APC`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Appeal Skeleton Argument is ready to view in the documents tab.`

    # ho POU
    When I switch to be a `Home Office POU`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Appeal Skeleton Argument is ready to view in the documents tab.`


    # ho - apc & generic
    When I switch to be a `Home Office Generic`
    And I click the `Overview` tab
    Then I should only see the `homeOffice_respondentReview` case progress image
    And I should see the text `Do this next`

    And I should see the text `Review the documents and add the Home Office's response, or contact the Tribunal for withdrawal of the decision.`
    And I upload the appeal response

    When I switch to be a <homeOfficeLartApcPOU>
    And I click the `Overview` tab
    Then I should only see the `homeOffice_appealResponseUploaded` case progress image
    And I should see the text `Do this next`
    And I should see the text `The Tribunal will:`
    And I should see the text `check that the Home Office response complies with the Procedure Rules and Practice Direction`
    And I should see the text `inform you of any issues`
    And I should see the text `Providing there are no issues, the response will be shared with the appellant.`
    And I should see the text `All parties will be notified when the Hearing Notice is ready.`


    Examples:
      | homeOfficeLartApcPOU   |
      | Home Office LART     |
      | Home Office APC      |
      | Home Office POU      |

