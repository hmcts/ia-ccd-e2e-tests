Feature: Upload Home Office bundle


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @RIA-1308 @upload-home-office-bundle @RIA-1799
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
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Document` field
    And I should see `This is the evidence` in the `Describe the document` field
    And I click the `Cancel` link

    #    Home Office APC
    When I switch to be a `Home Office APC`
    Then I should see the option `Upload Home Office bundle` for the `Next step` field
    And I select the `Upload Home Office bundle` Next step
    Then I am on the `Upload Home Office bundle` page

    When I add an item to the `Upload Home Office bundle` collection
    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidence.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidence.pdf` in the `Document` field
    And I should see `This is the evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    #  Home Office bundle amend request and upload amended documents.
    #    Home Office APC
    When I switch to be a `Home Office APC`
    Then I should see the option `Upload Home Office bundle` for the `Next step` field
    And I select the `Upload Home Office bundle` Next step
    Then I am on the `Upload Home Office bundle` page

    And within the `Upload Home Office bundle` collection's first item, I upload `{@RespondentEvidenceUpdated.pdf}` for the `Document` field
    And within the `Upload Home Office bundle` collection's first item, I type `This is the updated evidence` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And I should see `This is the updated evidence` in the `Describe the document` field

    When I click the `Upload` button
    Then I should see the text `You've uploaded the Home Office bundle`
    And I should see the text `What happens next`
    And I should see the text `The Home Office will be notified when the Appeal Skeleton Argument is ready to review.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Respondent documents` collection's first item, I should see `RespondentEvidenceUpdated.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the updated evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    And within the `Respondent documents` collection's second item, I should see `RespondentEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's second item, I should see `This is the evidence` in the `Description` field
    And within the `Respondent documents` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
