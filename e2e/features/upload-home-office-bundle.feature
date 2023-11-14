Feature: Upload Home Office bundle


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @regression @RIA-1308 @upload-home-office-bundle @RIA-1799 @RIA-2034 @RIA-3591
  Scenario: Only Home Office Generic and APC users can see and upload the Home Office bundle

    #    Home Office LART
    When I switch to be a `Home Office LART`
    Then I should not see the `Next step` field

    #    Home Office POU
    When I switch to be a `Home Office POU`
    Then I should not see the `Next step` field

    #    Home Office Generic
    When I switch to be a `Home Office Generic`
    Then I should see the option `Upload Home Office bundle` for the `Next step` field
    And I select the `Upload Home Office bundle` Next step
    Then I am on the `Upload Home Office bundle` page

    When I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Upload a file` field
    And I should see `This is the evidence` in the `Describe the document` field
    And I click the `Cancel` link

    #    Home Office APC
    When I switch to be a `Home Office APC`
    Then I should see the option `Upload Home Office bundle` for the `Next step` field

    And I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `An appeal against the Home Office decision in this case has been submitted. You can view the appeal form in the documents tab`
    And I should see the text `If you accept that there is a right of appeal you should upload the Home Office bundle`
    And I should see the text `If you consider the appeal is not valid, you should contact the Tribunal and the appellant with your reasons`

    When I click the `upload the Home Office bundle` link
    Then I am on the `Upload Home Office bundle` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- None`

    When I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Upload a file` field
    And I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

        # CO - notify Respondent to amend the HO bundle

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should see the text `If it complies with the procedure rules and practice directions, direct the legal representative to build their case.`
    Then I should see the text `If it does not comply, direct the respondent to make the appropriate changes.`

    And I click the `direct the respondent to make the appropriate changes` link
    Then I am on the `Send direction` page
    When I type `Amend the evidence` for the `Explain the direction you are issuing` field
    And I select `Respondent` for the `Who are you giving the direction to?` field
    And I type `31-12-2019` for the `By what date must they comply?` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Amend the evidence` for the `Explain the direction you are issuing` answer
    And I should see `Respondent` for the `Who are you giving the direction to?` answer
    And I should see `31 Dec 2019` for the `By what date must they comply?` answer

    When I click the `Send direction` button
    Then I should see the text `You have sent a direction`
    Then I should see the text `What happens next`
    Then I should see the text `You can see the status of the direction in the directions tab`


    #  Home Office bundle amend request and upload amended documents.
    #    Home Office APC
    When I switch to be a `Home Office APC`
    Then I should see the option `Upload Home Office bundle` for the `Next step` field
    And I select the `Upload Home Office bundle` Next step
    Then I am on the `Upload Home Office bundle` page

    And I should see the text `Already uploaded files:`
    And I should see the text `- RespondentEvidence.pdf`
    When I click the `Add new` button
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidenceUpdated.pdf}` for the `Upload a file` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the updated evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidenceUpdated.pdf` in the `Upload a file` field
    And I should see `This is the updated evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Respondent documents` collection's second item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And I select the `Upload Home Office bundle` Next step
    Then I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    Then I should see the text `You cannot upload more documents until the evidence bundle has been reviewed`

    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Respondent documents` collection's second item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I select the `Upload respondent evidence` Next step
    Then I am on the `Upload respondent evidence` page
    And I should see the text `Already uploaded files:`
    And I should see the text `- RespondentEvidence.pdf`
    And I should see the text `- RespondentEvidenceUpdated.pdf`
    And I click the `Cancel` link
