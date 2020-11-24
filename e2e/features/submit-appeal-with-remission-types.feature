Feature: Submit appeal with asylum support remission

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page
    And I complete the `Home Office details` page
    And I complete the `Upload the Notice of Decision` page
    And I complete the `Basic details` page
    And I complete the `Tell us about your client's nationality` page
    And I complete the `Your client's address` page
    And I complete the `The appellant's contact preference` page
    And I complete the `EA appeal type` page
    And I complete the `EA appeal grounds` page
    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I complete the `Has your client appealed against any other UK immigration decisions?` page
    And I complete the `Legal representative details` page

  @submit-appeal-with-asylum-support-remission  @RIA-3685
  Scenario: Submit appeal with asylum support remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remissions` page
    And I select `My client has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I should see the text `More about Help with Fees`
    And I should see the text `Your client can apply for Help with Fees (opens in new tab). They will be sent a reference number immediately after applying.`
    And I should see the text `More about Exceptional Circumstances Remissions`
    And I should see the text `Read the Tribunal Fees guidance (opens in a new tab) for more information on Exceptional Circumstances Remissions.`
    And I click the `Continue` button

    Then I am on the `Fee remissions` page
    And I select `My client is being provided with Asylum Support Funding under sections 95 or 98 of the Immigration and Asylum Act 1999` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Asylum support` page
    And I should see the text `Enter the Asylum Support reference number. You can find this on the Asylum Support confirmation letter your client received from the Home Office.`
    And I type `20/02/1234` for the `Asylum Support reference number` field
    And I upload `{@Evidence1.pdf}` for the `Asylum Support confirmation letter (Optional)` field
    And I wait for 2 seconds
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `My client has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `20/02/1234` for the `Asylum Support reference number` answer
    And I should see `Evidence1.pdf` in the `Asylum Support confirmation letter` field

    When I click the `Save and continue` button
    Then I should see the text `Your appeal details have been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit your appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button

    When I select the `Submit your appeal` Next step
    And I am on the `Submit your appeal` page

    When I agree to the declaration
    And I click the `Continue` button
    And I click the `Submit` button

    Then I should see the text `Your appeal has been submitted`
    And I should see the text `What happens next`
    And I should see the text `You have submitted an appeal with a remission application.`
    And I should see the text `Your remission details will be reviewed and you may be asked to provide more information.`
    And I should see the text `Once the review is complete you will be notified if there is any fee to pay.`
    And I click the `Close and Return to case details` button

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field
