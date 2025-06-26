Feature: Set Aside Make an Appplication for rule 31 and 32

    @set-aside-dlrm @RIA-8228
    Scenario: Set Aside Make an Application for rule 31 and 32
        Given I am signed in as a `Legal Org User Rep A`
        When I go to the `Case List`
        And  I filter the cases by `Decided` state
        And I wait for 2 seconds
        And  I click case at row 1 and navigate to case view page
        When I click the `Applications` tab
        And I select the `Make an application` Next step
        Then I should see the `Type of application` page
        When I select `Application under rule 31 or rule 32` for the `Type of application` field
        And I click the `Continue` button
        Then I should see the `Explain your application` page
        And I should see the text `Application under rule 31 or rule 32`
        When I type `Test reason for  Application under rule 31 or rule 32` for the `Explain why the decision should be set aside or changed.` field
        And I add an item to the `Supporting evidence (Optional)` collection
        And within the `Supporting evidence (Optional)` collection's first item, I upload `{@Evidence1.pdf}` for the document field without a label
        And I wait for the spinner
        And I click the `Continue` button
        Then I am on the `Check your answers` page
        And I should see `Application under rule 31 or rule 32` in the `Type of application` field
        And I should see `Test reason for  Application under rule 31 or rule 32` in the `Explain why the decision should be set aside or changed.` field
        And I should see `Evidence1.pdf` for the `Supporting evidence` field
        When I click the `Submit` button
        Then I should see the text `You've made an application`
        And I should see the text `What happens next`
        And I should see the text `The Tribunal will consider your application as soon as possible. All parties will be notified when a decision has been made. you can review any applications you've made in the application tab.`
        When I click the `Close and Return to case details` button if present

        When I click the `Applications` tab
        Then I should see the `Application` field
        And within the `Application` collection's first item, I should see `Application under rule 31 or rule 32` in the `Type of application` field
        And within the `Application` collection's first item, I should see `Test reason for  Application under rule 31 or rule 32` in the `Application details` field
        And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
        And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
        And within the `Application` collection's first item, I should see `Pending` in the `Decision` field
        When I switch to be a `Admin Officer`
        And I wait for 3 seconds
        And I click the `Applications` tab
        Then I should see the `Application` field
        And within the `Application` collection's first item, I should see `Application under rule 31 or rule 32` in the `Type of application` field
        And within the `Application` collection's first item, I should see `Test reason for  Application under rule 31 or rule 32` in the `Application details` field
        And within the `Application` collection's first item, I should see `Evidence1.pdf` in the `Documents supporting application` field
        And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
        And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

