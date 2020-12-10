Feature: Apply for a late remission

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial `EA` appeal type with `a remission` and `with` hearing fee
    And I submit my nonpayment appeal

  @request-fee-remission @RIA-3218
  Scenario: Legal rep apply for a late remission

    And I switch to be a `Admin Officer`
    And I record remission decision as partially approved
    And I mark the appeal as paid

    When I switch to be a `Legal Rep`
    Then I select the `Request a fee remission` Next step
    And I am on the `Fee remissions` page
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
    And I should see `My client has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `20/02/1234` for the `Asylum Support reference number` answer
    And I should see `Evidence1.pdf` in the `Asylum Support confirmation letter` field
    And I click the `Submit` button

    Then I should see the text `Your remission request has been submitted`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will review the remission request. The decision details will be available to`
    And I should see the text `view in the appeal tab when a decision has been made.`
    When I click the `Close and Return to case details` button

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field
    And I should see the `Previous remissions` field
    And within the `Previous remissions` collection's first item, I should see `Legal Aid` for the `Fee remission type` field
    And within the `Previous remissions` collection's first item, I should see `1A234B` for the `Legal Aid account number` field
    And within the `Previous remissions` collection's first item, I should see `Partially approved` for the `Decision` field
    And within the `Previous remissions` collection's first item, I should see `£140.00` for the `Fee` field
    And within the `Previous remissions` collection's first item, I should see `£100.00` for the `Amount remitted` field
    And within the `Previous remissions` collection's first item, I should see `£40.00` for the `Amount left to pay` field
    And within the `Previous remissions` collection's first item, I should see `This remission is partially approved` for the `Reason for decision` field


  @request-fee-remission-error @RIA-3218
  Scenario: Legal rep apply for a late remission error if previous remission not decided

    When I switch to be a `Legal Rep`
    Then I select the `Request a fee remission` Next step
    And I should see the text `You cannot request a fee remission at this time because another fee remission request for this appeal has yet to be decided.`



