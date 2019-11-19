Feature: Submit appeal application

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal

  @regression @submit-appeal-new-appellant-tab @RIA-1771
  Scenario: Submit an appeal application (new overview, appeal and appellant tabs)

    ### appeal submitted

    # LR:

    When I click the `Overview` tab

    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal`
    And I should see the text `A case officer will now review your appeal`
    And I should see the text `You don't need to do anything else right now`

    And I should see the case details
    And I should see the legal representative details
    And I should not see the hearing details
    And I should not see the `Next step` field

    When I click the `Appeal` tab

    Then I should not see any case progress images
    And I should see the appeal details
    And I should see the submission details

    When I click the `Appellant` tab

    Then I should not see any case progress images
    And I should see the appellant's details
    And I should see the legal representative's details

    # CO:

    When I switch to be a `Case Officer`
    And I click the `Overview` tab

    Then I should only see the `caseOfficer_appealSubmitted` case progress image

    And I should see the text `Do this next`
    And I should see the text `You must review the appeal in the documents tab`
    And I should see the text `If the appeal looks valid, you must tell the respondent to supply their evidence`

    And I should see the case details
    And I should see the legal representative details
    And I should not see the hearing details

    And I should see the option `Send direction` for the `Next step` field
    And I should see the option `Change a direction due date` for the `Next step` field
    And I should see the option `Request respondent evidence` for the `Next step` field
    And I should see the option `Add case note` for the `Next step` field
    And I should see the option `Record an application` for the `Next step` field
    And I should see the option `End the appeal` for the `Next step` field

    When I click the `Appeal` tab

    Then I should not see any case progress images
    And I should see the appeal details
    And I should see the submission details

    When I click the `Appellant` tab

    Then I should not see any case progress images
    And I should see the appellant's details
    And I should see the legal representative's details