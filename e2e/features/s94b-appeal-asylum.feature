Feature: s94b appeal

    Background:
        Given I am signed in as a `Legal Org User Rep A`

    @regression @caseflag @appeal-nightly-test
    Scenario: S94B appeal for PA Case
        And I save my initial PA appeal type without remission and with hearing fee and pay now
        And I go to the overview page for the stored case
        Then I should be on the overview page
        And I pay for and submit my appeal by Card
        And I switch to be a `Case Officer`
        And I check the case has been paid for
        When I select the `Update s94b status` Next step
        Then I am on the `Update s94b status` page
        And I will update s94b flag
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Admin Officer`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Judge`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field

    @regression @caseflag @appeal-nightly-test
    Scenario: S94B appeal for RP Case
        And I save my initial EA appeal type without remission and with hearing fee and pay now
        And I go to the overview page for the stored case
        Then I should be on the overview page
        And I pay for and submit my appeal by Card
        And I switch to be a `Case Officer`
        And I check the case has been paid for
        When I select the `Update s94b status` Next step
        Then I am on the `Update s94b status` page
        # And I will update s94b flag
        When I select `Yes` for the `Mark appeal as s94b?` field
        And I click the `Continue` button
        Then I am on the `Check your answers` page
        And I should see `Yes` in the `Mark appeal as s94b?` field
        And I click the `Submit` button
        And I wait for 5 seconds
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Admin Officer`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
        And I switch to be a `Judge`
        And I should see the image `journey_type_legally_represented_s94b.svg`
        When I goto the `Appeal` tab
        And I should see `Yes` in the `S94B appeal` field
