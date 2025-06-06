Feature: Submit appeal with asylum support remission

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

  @submit-appeal-with-asylum-support-remission  @RIA-3685
  Scenario: Submit appeal with asylum support remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I select `The appellant is being provided with Asylum Support Funding under sections 95 or 98 of the Immigration and Asylum Act 1999` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I should see the text `Enter the Asylum Support reference number. You can find this on the Asylum Support confirmation letter your client received from the Home Office.`
    And I type `20/02/1234` for the `Asylum Support reference number` field
    And I upload `{@Evidence1.pdf}` for the `Asylum Support confirmation letter (Optional)` document field
    And I wait for 10 seconds
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `20/02/1234` for the `Asylum Support reference number` answer
    And I should see `Evidence1.pdf` in the `Asylum Support confirmation letter` field

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

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Asylum support` for the `Fee remission type` field
    And I should see `20/02/1234` for the `Asylum Support reference number` field
    And I should see `Evidence1.pdf` for the `Asylum Support confirmation letter` field

  @submit-appeal-with-legal-aid-remission  @RIA-2113
  Scenario: Submit EA appeal type with legal aid remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I select `The appellant receives Legal Aid` for the `Choose one of the following statements` field
    And I click the `Continue` button
    And I type `1A234B` for the `Legal Aid account number` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `1A234B` for the `Legal Aid account number` answer

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    Then I select the `Submit your appeal` Next step

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

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field
    And I should see `1A234B` for the `Legal Aid account number` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Legal Aid` for the `Fee remission type` field


  @submit-appeal-with-section17-remission  @RIA-3686-section17-remission @RIA-3686
  Scenario: Submit appeal with Section 17 remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I select `The appellant receives (or has parental responsibility for a person who receives) benefit services or accommodation provided by a local authority under section 17 of the Children Act 1989, section 22 of the Children (Scotland) Act 1995, article 18 of the Children (Northern Ireland) Order 1995 or section 37 of the Social Services and Well-being (Wales) Act 2014` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Section 17` page
    And I should see the text `You need to provide a copy of a letter from the local authority confirming your client's benefit or accommodation support.`
    And I upload `{@Evidence1.pdf}` for the `Local authority letter` document field
    And I wait for 10 seconds
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `Evidence1.pdf` in the `Local authority letter` field

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    Then I select the `Submit your appeal` Next step

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

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 17` for the `Fee remission type` field

  @submit-appeal-with-section20-remission  @RIA-3686-section20-remission @RIA-3686
  Scenario: Submit appeal with Section 20 remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I select `The appellant's accommodation is being provided by a local authority under section 20 of the Children Act 1989, section 25 of the Children (Scotland) Act 1995, article 21 of the Children (Northern Ireland) Order 1995 or section 76 of the Social Services and Well-being (Wales) Act 2014` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Section 20` page
    And I should see the text `You need to provide a copy of a letter from the local authority confirming your client's benefit or accommodation support.`
    And I upload `{@Evidence1.pdf}` for the `Local authority letter` document field
    And I wait for 10 seconds
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `Evidence1.pdf` in the `Local authority letter` field

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    Then I select the `Submit your appeal` Next step

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

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Local authority letter` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Section 20` for the `Fee remission type` field

  @submit-appeal-with-hoWaiver-remission  @RIA-3686-hoWaiver-remission @RIA-3686
  Scenario: Submit appeal with Home Office waiver remission

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` field
    And I click the `Continue` button

    And I select `The Home Office waived the fee for the application this appeal relates to because it came under exceptions 4.5 or 9.4 of the Immigration and Nationality (Fees) Regulations 2016` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Home Office Waiver` page
    And I should see the text `You need to provide a copy of the Home Office fee waiver letter to validate this fee remission.`
    And I upload `{@Evidence1.pdf}` for the `Home Office fee waiver letter (Optional)` document field
    And I wait for 10 seconds
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has a remission, e.g. Asylum support, Legal Aid, Home Office waiver, Section 17/20` for the `Choose one of the following statements` answer
    And I should see `Evidence1.pdf` in the `Home Office fee waiver letter` field

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Home Office fee waiver letter` field

    Then I select the `Submit your appeal` Next step

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

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Home Office fee waiver letter` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Home Office fee waiver letter` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Home Office fee waiver letter` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field
    And I should see `Evidence1.pdf` for the `Home Office fee waiver letter` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Home Office fee waiver` for the `Fee remission type` field

  @submit-appeal-with-help-with-fees  @RIA-3084
  Scenario: Submit EA appeal type with help with fees

    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant has applied for help with fees` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Help with Fees` page
    And I type `HWF-A1B-23` for the `Help with Fees reference number` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    Then I should see `01234567` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant has applied for help with fees` for the `Choose one of the following statements` answer
    And I should see `HWF-A1B-23` for the `Help with Fees reference number` answer

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field
    And I should see `HWF-A1B-23` for the `Help with Fees reference number` field

    Then I select the `Submit your appeal` Next step

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

    When I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. Your remission details will be reviewed and you may be asked to provide more information. Once the review is complete, you will be notified if there is any fee to pay.`

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field
    And I should see `HWF-A1B-23` for the `Help with Fees reference number` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field
    And I should see `HWF-A1B-23` for the `Help with Fees reference number` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field
    And I should see `HWF-A1B-23` for the `Help with Fees reference number` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field
    And I should see `HWF-A1B-23` for the `Help with Fees reference number` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Help with Fees` for the `Fee remission type` field

  @submit-appeal-with-exceptional-circumstances-remission  @RIA-3085
  Scenario: Submit appeal with Exceptional circumstances remission
    Then I select `Decision with a hearing. The fee for this type of appeal is £140` for the `How does the appellant want the appeal to be decided?` field
    And I click the `Continue` button

    Given I am on the `Fee remission` page
    And I select `The appellant wants to apply for an Exceptional Circumstances Remission` for the `Choose one of the following statements` field
    And I click the `Continue` button

    Then I am on the `Exceptional Circumstances Remission` page
    And I type `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
    And I click the `Add new` button
    And within the `Supporting evidence` collection's first item, I upload `{@Evidence1.pdf}` for the document field without a label
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `012345678` for the `Home Office Reference/Case ID` answer
    And I should see `Mr` for the `Title` answer
    And I should see `José` for the `Given names` answer
    And I should see `González` for the `Family name` answer
    And I should see `The appellant wants to apply for an Exceptional Circumstances Remission` for the `Choose one of the following statements` answer
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` answer
    And I should see `Evidence1.pdf` in the `Supporting evidence` field

    When I click the `Save and continue` button
    Then I should see the text `The appeal has been saved`
    And I should see the text `You still need to submit it`
    And I should see the text `If you're ready to proceed submit the appeal.`
    And I should see the text `Not ready to submit yet?`
    And I should see the text `You can return to the case details to make changes.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
    And I should see `Evidence1.pdf` in the `Supporting evidence` field

    Then I select the `Submit your appeal` Next step

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

    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
    And I should see `Evidence1.pdf` in the `Supporting evidence` field

    When I switch to be a `Case Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
    And I should see `Evidence1.pdf` in the `Supporting evidence` field

    When I switch to be a `Admin Officer`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
    And I should see `Evidence1.pdf` in the `Supporting evidence` field

    When I switch to be a `Judge`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
    And I should see `Evidence1.pdf` in the `Supporting evidence` field

    When I switch to be a `Home Office APC`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field

    When I switch to be a `Home Office LART`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field

    When I switch to be a `Home Office POU`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field

    When I switch to be a `Home Office Generic`
    Then I click the `Appeal` tab
    And I should see the `Appeal details` page
    And I should see `Exceptional circumstances` for the `Fee remission type` field
    And I should see `Test data for exceptional circumstances` for the `Explain the exceptional circumstances which justify remission of the fee` field
