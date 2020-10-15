Feature: Pay now and Submit feature

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @Pay-now-and-submit-event-with-hearing-fee-EA @Pay-now-and-submit-event-with-hearing-fee @RIA-3237 @RIA-3014
  Scenario: Select pay and submit event EA appeal type with hearing fee

    When I save my initial EA appeal type with no remission and with hearing fee

    And I click the `Overview` tab
    And  I select the `Submit your appeal` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `The Submit your appeal option is not available. Select Pay and submit to submit the appeal`

    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` answer

  @Pay-now-and-submit-event-with-hearing-fee-HU @Pay-now-and-submit-event-with-hearing-fee @RIA-3237 @RIA-3014
  Scenario: Select pay and submit event HU appeal type with hearing fee

    When I save my initial HU appeal type with no remission and with hearing fee

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` answer
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` answer

  @Pay-now-and-submit-event-with-hearing-fee-PA @Pay-now-and-submit-event-with-hearing-fee @RIA-3237 @RIA-3014
  Scenario: Select pay and submit event PA appeal type with hearing fee

    When I save my initial PA appeal type with no remission and with hearing fee

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal with a hearing is £140`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` answer


  @Pay-now-and-submit-event-without-hearing-fee-EA @Pay-now-and-submit-event-without-hearing-fee @RIA-3237 @RIA-3014
  Scenario: Select pay and submit event EA appeal type without hearing fee

    When I save my initial EA appeal type with no remission and without hearing fee

    And I click the `Overview` tab
    And  I select the `Submit your appeal` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `The Submit your appeal option is not available. Select Pay and submit to submit the appeal`

    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal without a hearing is £80`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of application under the EEA regulations` for the `Type of appeal` field
    And I should see `The decision breaches the appellant's rights under the EEA regulations` for the `Grounds of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` answer

  @Pay-now-and-submit-event-without-hearing-fee-HU @Pay-now-and-submit-event-without-hearing-fee @RIA-3237 @RIA-3014
  Scenario: Select pay and submit event HU appeal type without hearing fee

    When I save my initial HU appeal type with no remission and without hearing fee

    And I click the `Overview` tab
    And  I select the `Submit your appeal` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `The Submit your appeal option is not available. Select Pay and submit to submit the appeal`

    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal without a hearing is £80`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of a human rights claim` for the `Type of appeal` answer
    And I should see `Removing the appellant from the UK would be unlawful under section 6 of the Human Rights Act 1998` for the `Grounds of appeal` answer
    And I should see `Yes` for the `Are there any new reasons your client wishes to remain in the UK or any new grounds on which they should be permitted to stay?` answer
    And I should see `Birth of a child` for the `Explain these new matters and their relevance to the appeal` answer
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` answer

  @Pay-now-and-submit-event-without-hearing-fee-PA @Pay-now-and-submit-event-without-hearing-fee @RIA-3237 @RIA-3014
  Scenario: Select pay and submit event PA appeal type without hearing fee

    When I save my initial PA appeal type with no remission and without hearing fee

    And I click the `Overview` tab
    And I select the `Pay and submit` Next step
    And I should see the text `The fee for an appeal without a hearing is £80`
    And I should see the text `Can’t see your Payment by Account number?`
    And I should see the `MyHMCTSsupport@justice.gov.uk` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button

    And I click the `I the representative am giving notice of appeal in accordance with the appellant's instructions and the appellant has confirmed to me they believe that the facts stated in this appeal form are true.` label
    And I click the `Continue` button

    When I click the `Pay and submit now` button
    And I click the `Close and Return to case details` button
    And I should see an alert confirming the case `has been updated with event: Pay and submit`

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `Decision without a hearing. The fee for this type of appeal is £80` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` answer

  @save-pa-appeal-type-payNow-submit-check @RIA-3498
  Scenario: Decide pay and submit for PA appeal type with hearing fee

    When I save my initial PA appeal type with no remission and with hearing fee

    Then I should not see the `Submit your appeal` link
    And  I select the `Submit your appeal` Next step
    And I should see the text `Unable to proceed because there are one or more callback Errors or Warnings`
    And I should see the text `The Submit your appeal option is not available. Select Pay and submit to submit the appeal`

    And I submit my appeal

    When I click the `Overview` tab
    Then I should only see the `legalRep_appealSubmitted` case progress image
    And I should see the text `Do this next`
    And I should see the text `You have submitted your appeal. A Tribunal Caseworker will now review your appeal.`

    And I should see the text `Case details`
    And I should see the text `Refusal of protection claim`
    And I should see the legal representative details

    When I click the `Appeal` tab
    Then I should see the `Appeal` page
    And I should see `Refusal of protection claim` for the `Type of appeal` field
    And I should see `Removing the appellant from the UK would breach the UK's obligation under the Refugee Convention` for the `Grounds of appeal` field
    And I should see `I do not have this document` for the `Reason you cannot provide the Notice of Decision` field
    And I should see `Decision with a hearing. The fee for this type of appeal is £140` for the `How do you want the appeal to be decided?` field
    And I should see `Pay now using Payment by Account` for the `Payment method` field
