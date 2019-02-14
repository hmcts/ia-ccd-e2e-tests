Feature: Appeal tab

  @send-direction @RIA-832
  Scenario: Appeal tab

    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `CaseArgument.pdf` in the `Appeal skeleton argument` field
    And I should see `This is the case argument` in the `Description` field
    And within the `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I switch to be a `Case Officer`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `CaseArgument.pdf` in the `Appeal skeleton argument` field
    And I should see `This is the case argument` in the `Description` field
    And within the `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I request respondent review
    And I add the appeal response
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `AppealResponse.pdf` in the `Response document` field
    And I should see `This is the appeal response` in the first `Description` field
    And within the first `Evidence` collection's first item, I should see `AppealResponseEvidence.pdf` in the `Document` field
    And within the first `Evidence` collection's first item, I should see `This is the appeal response evidence` in the `Describe the document` field
    And I should see `This is the case argument` in the second `Description` field
    And within the second `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the second `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field

    When I switch to be a `Legal Rep`
    And I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `AppealResponse.pdf` in the `Response document` field
    And I should see `This is the appeal response` in the first `Description` field
    And within the first `Evidence` collection's first item, I should see `AppealResponseEvidence.pdf` in the `Document` field
    And within the first `Evidence` collection's first item, I should see `This is the appeal response evidence` in the `Describe the document` field
    And I should see `This is the case argument` in the second `Description` field
    And within the second `Evidence` collection's first item, I should see `CaseArgumentEvidence.pdf` in the `Document` field
    And within the second `Evidence` collection's first item, I should see `The is the case argument evidence` in the `Describe the document` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` in the `Grounds of appeal` field
    And I should see `The refusal of a protection claim` in the `Type of appeal` field
