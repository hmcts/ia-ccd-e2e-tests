Feature: Submit appeal with has a remission

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `What is the appellant's nationality?` page
    And I complete the `Appellant's address` page
    And I complete the `The appellant's contact preference` page
    And I complete the `EA appeal type` page
    And I complete the `EA appeal grounds` page
    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I complete the `Other appeals` page
    And I complete the `Legal representative details` page

  @submit-appeal-with-remission  @RIA-3088
  Scenario: Submit appeal with a remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I select `The appellant receives Legal Aid` for the `Choose one of the following statements` field
    And I click the `Continue` button
    When I type `1A234B` for the `Legal Aid account number` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I select the `Submit your appeal` Next step


    When I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button

    Then I should see the text `Your appeal has been submitted`
    And I should see the text `What happens next`
    And I should see the text `You have submitted an appeal with a remission application.`
    And I should see the text `Your remission details will be reviewed and you may be asked to provide more information.`
    And I should see the text `Once the review is complete you will be notified if there is any fee to pay.`
    And I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
