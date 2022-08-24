Feature: Upload additional evidence Home Office

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 30 seconds
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    And I click the `Close and Return to case details` button
    Then I should see the text `You still need to submit your appeal.`
    And I pay for and submit my appeal by PBA
    And I wait for 5 seconds
    And I switch to be a `Case Officer`
    And I wait for 2 seconds
#    And I request home office data
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I wait for 5 seconds
    And I build my case

  @regression @upload-additional-evidence-home-office @RIA-1278 @nightly-test
  Scenario: Upload additional evidence Home Office to the case

    When I switch to be a `Home Office APC`
    #And I click the `Documents` tab


    # When I click the `Upload additional evidence` link
    When I select the `Upload additional evidence` Next step
    Then I am on the `Upload additional evidence` page
    And I see the text `Files should be:`
    And I see the text `You’ll need to explain why this evidence is being submitted late.`

    When I add an item to the `Additional evidence` collection
    And within the `Additional evidence` collection's first item, I upload `{@HomeOfficeEvidence.pdf}` for the `Document` field
    And within the `Additional evidence` collection's first item, I type `This is the additional Home Office evidence` for the `Why it was late` field
    And I wait for 2 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And within the `Additional evidence` collection's first item, I should see `HomeOfficeEvidence.pdf` for the `Document` field
    And within the `Additional evidence` collection's first item, I should see `This is the additional Home Office evidence` in the `Why it was late` field
    And I wait for 1 seconds
    When I click the `Upload` button
    Then I should see the text `What happens next`
    And I should see the text `The evidence is now available in the documents tab.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `HomeOfficeEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the additional Home Office evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ### additional evidence is visible to Legal Rep
    When I switch to be a `Legal Org User Rep A`
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `HomeOfficeEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the additional Home Office evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    ### additional evidence is visible to Case Officer
    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    And within the `Respondent documents` collection's first item, I should see `HomeOfficeEvidence.pdf` in the `Document` field
    And within the `Respondent documents` collection's first item, I should see `This is the additional Home Office evidence` in the `Description` field
    And within the `Respondent documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Examples:
    #   | homeOfficeUser        |
    #   | Home Office APC       |
    #   | Home Office LART      |
      # | Home Office POU       |
      # | Home Office Generic   |
