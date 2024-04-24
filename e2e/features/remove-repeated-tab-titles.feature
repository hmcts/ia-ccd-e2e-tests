Feature: Remove repeated tab titles

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence

  @RIA-4119
  Scenario: Remove repeated tab titles

    When I click the `Overview` tab
    And I should see the text `The Home Office will prepare their bundle.`

    When I click the `Appeal` tab
    Then I should see the appeal details

    When I click the `Appellant` tab
    Then I should see the appellant's details
    And I should see the legal representative's details

    When I click the `Documents` tab
    Then I should see the `Legal representative documents` field

    When I click the `Directions` tab
    Then within the `Directions` collection's first item, I should see `A notice of appeal has been lodged against this decision.` in the `Explanation` field

    When I click the `Overview` tab
    Then I should see the case details
    And I should see the legal representative details

    When I select the `Add case note` Next step
    Then I am on the `Add case note` page
    And I should see the text `Add your case note below`
    And the `Continue` button is disabled

    When I type `some case note subject` for the `Subject` field
    Then the `Continue` button is disabled

    When I type `some case note description` for the `Case note` field
    Then the `Continue` button is enabled

    When I upload `{@test.doc}` for the `Upload a document (Optional)` field
    And I wait for 10 seconds
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `some case note subject` in the `Subject` field
    And I should see `some case note description` in the `Case note` field
    And I should see `test.doc` in the `Upload a document` field

    When I click the `Save note` button
    Then I should see the text `You have added a case note`
    Then I should see the text `What happens next`
    Then I should see the text `You can review this note in the case notes tab.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    Then I should see an alert confirming the case `has been updated with event: Add case note`

    When I click the `Case notes` tab
    Then I should see the `Case notes` field
    And within the `Case notes` collection's first item, I should see `some case note subject` for the `Subject` field
    And within the `Case notes` collection's first item, I should see `some case note description` for the `Case note` field
    And within the `Case notes` collection's first item, I should see `test.doc` for the `Document` field


    When I switch to be a `Legal Rep`
    And I click the `Applications` tab
    Then I select the `Make an application` Next step
    And I should see the `Make an application` page
    And I should see the option `Update appeal details` for the `Type of application` field
    And I should see the option `Withdraw` for the `Type of application` field
    And I should see the option `Link/unlink appeals` for the `Type of application` field
    And I should see the option `Judge's review of Legal Officer decision` for the `Type of application` field
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
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
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

    When I click the `Case history` tab
    And I should see the `Add case note` link
