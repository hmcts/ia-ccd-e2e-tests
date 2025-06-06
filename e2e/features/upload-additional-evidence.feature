Feature: Submit case

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

  @regression @upload-additional-evidence @RIA-706
  Scenario: Upload additional evidence to the case

    ### link in Documents tab to Upload additional evidence not visible yet

    #Given I see the open case
    And I click the `Documents` tab

    Then I should not see the `Upload additional evidence` link

    ### upload single document in caseUnderReview state

    Given I submit my case
    When I click the `Documents` tab

    When I click the `Upload additional evidence` link
    Then I am on the `Upload additional evidence` page
    And I see the text `Additional evidence is anything submitted after the appeal skeleton argument.`
    And I see the text `Advice on uploads`
    And the `Continue` button is disabled

    When I add an item to the `Upload documents` collection
    And within the `Upload documents` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` document field
    And within the `Upload documents` collection's first item, I type `This is the additional evidence` for the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    And within the `Upload documents` collection's first item, I should see `Evidence1.pdf` for the `Document` field
    And within the `Upload documents` collection's first item, I should see `This is the additional evidence` in the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded a document`
    Then I should see the text `What happens next`
    Then I should see the text `The document is now available in the documents tab.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    #And I see the open case
    And I click the `Documents` tab

    And within the `Additional evidence from appellant` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Additional evidence from appellant` collection's first item, I should see `This is the additional evidence` in the `Description` field
    And within the `Additional evidence from appellant` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ### link in Documents tab to Upload additional evidence not visible to Case Officer

    Given I switch to be a `Case Officer`
    #And I see the open case
    When I click the `Documents` tab

    And I should not see the `Upload additional evidence` link

    ### upload multiple documents, of different types, in respondentReview state

    When I request respondent review
    And I switch to be a `Legal Rep`

    When I click the `Documents` tab

    When I click the `Upload additional evidence` link
    Then I am on the `Upload additional evidence` page
    And I see the text `Additional evidence is anything submitted after the appeal skeleton argument.`
    And I see the text `Advice on uploads`
    And the `Continue` button is disabled

    When I add an item to the `Upload documents` collection
    And within the `Upload documents` collection's first item, I upload `{@test.doc}` for the `Document` document field
    And within the `Upload documents` collection's first item, I type `This is an older Word document` for the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I add an item to the `Upload documents` collection
    And within the `Upload documents` collection's second item, I upload `{@test.docx}` for the `Document` document field
    And within the `Upload documents` collection's second item, I type `This is a newer Word document` for the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I add an item to the `Upload documents` collection
    And within the `Upload documents` collection's third item, I upload `{@test.png}` for the `Document` document field
    And within the `Upload documents` collection's third item, I type `This is a PNG file` for the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I add an item to the `Upload documents` collection
    And within the `Upload documents` collection's fourth item, I upload `{@test.jpg}` for the `Document` document field
    And within the `Upload documents` collection's fourth item, I type `This is a JPEG file` for the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page

    And within the `Upload documents` collection's first item, I should see `test.doc` for the `Document` field
    And within the `Upload documents` collection's first item, I should see `This is an older Word document` in the `Explain why you are submitting this evidence after the appeal skeleton argument.` field
    And within the `Upload documents` collection's second item, I should see `test.docx` for the `Document` field
    And within the `Upload documents` collection's second item, I should see `This is a newer Word document` in the `Explain why you are submitting this evidence after the appeal skeleton argument.` field
    And within the `Upload documents` collection's third item, I should see `test.png` for the `Document` field
    And within the `Upload documents` collection's third item, I should see `This is a PNG file` in the `Explain why you are submitting this evidence after the appeal skeleton argument.` field
    And within the `Upload documents` collection's fourth item, I should see `test.jpg` for the `Document` field
    And within the `Upload documents` collection's fourth item, I should see `This is a JPEG file` in the `Explain why you are submitting this evidence after the appeal skeleton argument.` field

    When I click the `Upload` button
    Then I should see the text `You have uploaded a document`
    Then I should see the text `What happens next`
    Then I should see the text `The document is now available in the documents tab.`

    ### additional evidence is visible to Legal Rep

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    #And I see the open case
    And I click the `Documents` tab

    And I should see the `Upload additional evidence` link
    And within the `Additional evidence from appellant` collection's first item, I should see `test.doc` in the `Document` field
    And within the `Additional evidence from appellant` collection's first item, I should see `This is an older Word document` in the `Description` field
    And within the `Additional evidence from appellant` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's second item, I should see `test.docx` in the `Document` field
    And within the `Additional evidence from appellant` collection's second item, I should see `This is a newer Word document` in the `Description` field
    And within the `Additional evidence from appellant` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's third item, I should see `test.png` in the `Document` field
    And within the `Additional evidence from appellant` collection's third item, I should see `This is a PNG file` in the `Description` field
    And within the `Additional evidence from appellant` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's fourth item, I should see `test.jpg` in the `Document` field
    And within the `Additional evidence from appellant` collection's fourth item, I should see `This is a JPEG file` in the `Description` field
    And within the `Additional evidence from appellant` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's fifth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Additional evidence from appellant` collection's fifth item, I should see `This is the additional evidence` in the `Description` field
    And within the `Additional evidence from appellant` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ### additional evidence is visible to Case Officer

    When I switch to be a `Case Officer`
    #And I see the open case
    When I click the `Documents` tab

    And I should not see the `Upload additional evidence` link
    And within the `Additional evidence from appellant` collection's first item, I should see `test.doc` in the `Document` field
    And within the `Additional evidence from appellant` collection's first item, I should see `This is an older Word document` in the `Description` field
    And within the `Additional evidence from appellant` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's second item, I should see `test.docx` in the `Document` field
    And within the `Additional evidence from appellant` collection's second item, I should see `This is a newer Word document` in the `Description` field
    And within the `Additional evidence from appellant` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's third item, I should see `test.png` in the `Document` field
    And within the `Additional evidence from appellant` collection's third item, I should see `This is a PNG file` in the `Description` field
    And within the `Additional evidence from appellant` collection's third item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's fourth item, I should see `test.jpg` in the `Document` field
    And within the `Additional evidence from appellant` collection's fourth item, I should see `This is a JPEG file` in the `Description` field
    And within the `Additional evidence from appellant` collection's fourth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    And within the `Additional evidence from appellant` collection's fifth item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Additional evidence from appellant` collection's fifth item, I should see `This is the additional evidence` in the `Description` field
    And within the `Additional evidence from appellant` collection's fifth item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
