Feature: Legal representative make an application

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I wait for 3 seconds
    And I create a new case
    And I save my initial PA appeal type without remission and with hearing fee and pay now
    And I wait for 5 seconds
    When I click the `pay for and submit your appeal` link
    And I select `PBA0087535` for the `Select a Payment by Account number from the list` field
    And I click the `Continue` button
    And I agree to the declaration
    And I click the `Continue` button
    When I click the `Pay and submit now` button
    Then I should see the text `Your appeal has been paid for and submitted`
    And I click the `Close and Return to case details` button


  @Make-an-application-at-appeal-submitted @RIA-3457-make-an-application-at-appeal-submitted @RIA-3457 @nightly-test
  Scenario: Make an application in appeal submitted state

    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Update appeal details` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field
    And I select `Update appeal details` for the `Type of application` field
    And I click the `Continue` button

    Then I should see the text `Update appeal details`
    And the `Continue` button is disabled
    And I type `A reason to update appeal details` for the `Tell us which appeal details you want to update and explain why the changes are necessary.` field
    And I add an item to the `Supporting evidence (Optional)` collection
    And within the `Supporting evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the field without a label
    And I wait for 3 seconds

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Update appeal details` in the `Type of application` field
    And I should see `A reason to update appeal details` in the `Tell us which appeal details you want to update and explain why the changes are necessary.` field
    And I should see `Evidence1.pdf` for the `Supporting evidence` field

    When I click the `Submit` button
    Then I should see the text `You've made an application`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will consider your application as soon as possible. All parties will be notified when a decision has been made. you can review any applications you've made in the application tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make an application`

    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    When I switch to be a `Case Officer`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    When I switch to be a `Admin Officer`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    When I switch to be a `Admin Officer`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    When I switch to be a `Home Office APC`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    # When I switch to be a `Home Office LART`
    # Then I click the `Applications` tab
    # And I should see the `Application` field
    # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    # And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    # And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    # When I switch to be a `Home Office POU`
    # Then I click the `Applications` tab
    # And I should see the `Application` field
    # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    # And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    # And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    # When I switch to be a `Home Office Generic`
    # Then I click the `Applications` tab
    # And I should see the `Application` field
    # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    # And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    # And within the `Application` collection's first item, I should see `Pending` in the `Decision` field


  @Make-an-application-at-respondent-review @RIA-3457-make-an-application-at-respondent-review @RIA-3457
  Scenario: Make an application in respondent review state

    And I switch to be a `Case Officer`
    And I request respondent evidence

    When I switch to be a `Home Office POU`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Time extension` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Home Office APC`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Time extension` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Home Office LART`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Time extension` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Home Office Generic`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Time extension` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Legal Org User Rep A`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Time extension` for the `Type of application` field
    And I should see the option `Update appeal details` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field
    And I select `Update appeal details` for the `Type of application` field
    And I click the `Continue` button

    Then I should see the text `Update appeal details`
    And the `Continue` button is disabled
    And I type `A reason to update appeal details` for the `Tell us which appeal details you want to update and explain why the changes are necessary.` field
    And I add an item to the `Supporting evidence (Optional)` collection
    And within the `Supporting evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the field without a label
    And I wait for 3 seconds

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Update appeal details` in the `Type of application` field
    And I should see `A reason to update appeal details` in the `Tell us which appeal details you want to update and explain why the changes are necessary.` field
    And I should see `Evidence1.pdf` for the `Supporting evidence` field

    When I click the `Submit` button
    Then I should see the text `You've made an application`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will consider your application as soon as possible. All parties will be notified when a decision has been made. you can review any applications you've made in the application tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make an application`

    When I switch to be a `Home Office APC`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Time extension` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field
    And I select `Time extension` for the `Type of application` field
    And I click the `Continue` button

    Then I should see the text `Time extension`
    And the `Continue` button is disabled
    And I type `A reason for time extension` for the `Tell us which task you need more time to complete, explain why you need more time and include how much more time you will need.` field
    And I add an item to the `Supporting evidence (Optional)` collection
    And within the `Supporting evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the field without a label
    And I wait for 3 seconds

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Time extension` in the `Type of application` field
    And I should see `A reason for time extension` in the `Tell us which task you need more time to complete, explain why you need more time and include how much more time you will need.` field
    And I should see `Evidence1.pdf` for the `Supporting evidence` field

    When I click the `Submit` button
    Then I should see the text `You've made an application`
    And I should see the text `What happens next`
    And I should see the text `The Tribunal will consider your application as soon as possible. All parties will be notified when a decision has been made. you can review any applications you've made in the application tab.`
    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Make an application`

    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field
    And within the `Application` collection's second item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's second item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's second item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's second item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's second item, I should see `Pending` in the `Decision` field


    When I switch to be a `Home Office LART`
    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field
    And within the `Application` collection's second item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's second item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's second item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's second item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's second item, I should see `Pending` in the `Decision` field

    When I switch to be a `Home Office POU`
    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    When I switch to be a `Case Officer`
    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field
    And within the `Application` collection's second item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's second item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's second item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's second item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's second item, I should see `Pending` in the `Decision` field

    When I switch to be a `Judge`
    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field
    And within the `Application` collection's second item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's second item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's second item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's second item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's second item, I should see `Pending` in the `Decision` field

    When I switch to be a `Legal Org User Rep A`
    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field
    And within the `Application` collection's second item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's second item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's second item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's second item, I should see `Evidence1.pdf` in the `Documents supporting application` field
    And within the `Application` collection's second item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's second item, I should see `Pending` in the `Decision` field

  @Make-an-application-at-ended @RIA-3457-make-an-appeal-at-ended @RIA-3457
  Scenario: Make an application in appeal ended state

    And I switch to be a `Case Officer`
    And I end the appeal
    Then I should only see the `caseOfficer_appealEnded` case progress image
    And I should see the text `What happens next`
    And I should see the text `No further action required, unless either party asks for the decision to be reviewed by a judge.`

    When I switch to be a `Legal Org User Rep A`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Reinstate an ended appeal` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    Then I select `Reinstate an ended appeal` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Reinstate an ended appeal`
    And I type `A reason to reinstate` for the `Explain why you believe the Tribunal should reinstate this appeal.` field
    And I click the `Cancel` link

    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    Then I select `Judge's review of application decision` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Judge's review of application decision`
    And I type `A reason for Judge's review` for the `Tell us which application decision you want to be reviewed by a Judge and explain why you think the original decision was wrong.` field
    And I click the `Cancel` link

    When I switch to be a `Home Office APC`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Reinstate an ended appeal` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    Then I select `Reinstate an ended appeal` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Reinstate an ended appeal`
    And I type `A reason to reinstate` for the `Explain why you believe the Tribunal should reinstate this appeal.` field
    And I click the `Cancel` link

    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    Then I select `Judge's review of application decision` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Judge's review of application decision`
    And I type `A reason for Judge's review` for the `Tell us which application decision you want to be reviewed by a Judge and explain why you think the original decision was wrong.` field
    And I click the `Cancel` link

    When I switch to be a `Home Office LART`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Reinstate an ended appeal` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    When I switch to be a `Home Office POU`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Reinstate an ended appeal` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    When I switch to be a `Home Office Generic`
    When I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Reinstate an ended appeal` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field


  @Make-an-application-at-listing @RIA-3457-make-an-application-at-listing @RIA-3457
  Scenario: Make an application in listing state

    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Update appeal details` for the `Type of application` field
    And I should see the option `Update hearing requirements` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    When I switch to be a `Home Office APC`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    When I switch to be a `Home Office LART`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    When I switch to be a `Home Office POU`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

    When I switch to be a `Home Office Generic`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field

  @Make-an-application-at-prepare-for-hearing @RIA-3457-make-an-application-at-prepare-for-hearing @RIA-3457
  Scenario: Make an application in prepare for hearing state

    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Org User Rep A`
    And I build my case
    And I submit my case
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Org User Rep A`
    And I submit hearing requirements with all yes when in country
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case

    When I switch to be a `Legal Org User Rep A`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Adjourn` for the `Type of application` field
    And I should see the option `Expedite` for the `Type of application` field
    And I should see the option `Transfer` for the `Type of application` field
    And I should see the option `Update appeal details` for the `Type of application` field
    And I should see the option `Update hearing requirements` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    Then I select `Adjourn` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Adjourn`
    And I type `A reason to adjourn` for the `Explain why you need an adjournment and for how long you need it.` field
    And I click the `Previous` button

    Then I select `Expedite` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Expedite`
    And I type `A reason to expedite` for the `Explain why you need to expedite the appeal. Include the latest date you would like the appeal to be decided by and state if you are willing for the appeal to be decided without a hearing.` field
    And I click the `Previous` button

    Then I select `Transfer` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Transfer`
    And I type `A reason to Transfer` for the `Tell us which hearing centre you want to transfer the appeal to and why.` field
    And I click the `Previous` button

    Then I select `Link/unlink appeals` for the `Type of application` field
    And I click the `Continue` button
    And I type `A reason to link or unlink` for the `Explain why you want to link or unlink this appeal. You must include the appellant name and HMCTS appeal reference of each appeal you want to link to or unlink from.` field
    And I click the `Previous` button

    Then I select `Judge's review of application decision` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Judge's review of application decision`
    And I type `A reason for Judge's review` for the `Tell us which application decision you want to be reviewed by a Judge and explain why you think the original decision was wrong.` field
    And I click the `Previous` button

    Then I select `Other` for the `Type of application` field
    And I click the `Continue` button
    And I should see the text `Other`
    And I type `A reason to other application` for the `Describe the application you are making and explain the reasons for the application.` field

    When I switch to be a `Home Office APC`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Adjourn` for the `Type of application` field
    And I should see the option `Expedite` for the `Type of application` field
    And I should see the option `Transfer` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Home Office LART`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Adjourn` for the `Type of application` field
    And I should see the option `Expedite` for the `Type of application` field
    And I should see the option `Transfer` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Home Office POU`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Adjourn` for the `Type of application` field
    And I should see the option `Expedite` for the `Type of application` field
    And I should see the option `Transfer` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

    When I switch to be a `Home Office Generic`
    Then I click the `Applications` tab
    And I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Adjourn` for the `Type of application` field
    And I should see the option `Expedite` for the `Type of application` field
    And I should see the option `Transfer` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of application decision` for the `Type of application` field
    And I should see the option `Other` for the `Type of application` field

