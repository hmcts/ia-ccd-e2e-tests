Feature: Case officer or Judge make an application

  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new case
    And I save my initial EA appeal type without remission and with hearing fee and pay now
    And I click the `Close and Return to case details` button if present
    Then I should be on the overview page
    And I pay for and submit my appeal by Card

  @Case-officer-decide-an-application @RIA-3451-case-officer-decide-an-application @RIA-3451 @appeal-nightly-test-deprecated
  Scenario: Case officer decide an application

    Then I make an application for `Update appeal details` type

    And I switch to be a `Case Officer`

    And I goto the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    When I select the `Decide an application` Next step
    # And I click the `Decide an application` link
    # And I should see the option `Legal representative : Application 1` for the `Application` field

    And I click the `Continue` button
    And I should see the text `Update appeal details`
    And I should see the text `A reason to update appeal details`
    And I select `Application granted` for the `Decision` field
    And I type `A reason for the decision` for the `Reasons for decision` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Legal representative : Application 1` in the `Application` field
    And I should see `Application granted` for the `Decision` field
    And I should see `A reason for the decision` for the `Reasons for decision` field

    And I click the `Record decision` button
    Then I should see the text `You have decided an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is now available in the applications tab. You must now update the appeal details`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I wait for 5 seconds

    When I goto the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

    And I switch to be a `Legal Org User Rep A`
    Then I goto the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

    When I switch to be a `Admin Officer`
    Then I goto the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

  # When I switch to be a `Home Office APC`
  # Then I goto the `Applications` tab
  # And I should see the `Application` field
  # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
  # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
  # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
  # And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
  # And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
  # And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

  # When I switch to be a `Home Office LART`
  # Then I click the `Applications` tab
  # And I should see the `Application` field
  # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
  # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
  # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
  # And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
  # And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
  # And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

  # When I switch to be a `Home Office POU`
  # Then I click the `Applications` tab
  # And I should see the `Application` field
  # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
  # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
  # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
  # And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
  # And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
  # And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

  # When I switch to be a `Home Office Generic`
  # Then I click the `Applications` tab
  # And I should see the `Application` field
  # And within the `Application` collection's first item, I should see `Legal representative` in the `Applicant` field
  # And within the `Application` collection's first item, I should see `Update appeal details` in the `Type of application` field
  # And within the `Application` collection's first item, I should see `A reason to update appeal details` in the `Application details` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
  # And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
  # And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
  # And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
  # And within the `Application` collection's first item, I should see `Legal Officer` in the `Decision maker` field

  @Judge-decide-an-application @RIA-3451-judge-decide-an-application @RIA-3451
  Scenario: Judge decide an application

    And I switch to be a `Case Officer`
    And I request respondent evidence

    And I switch to be a `Home Office APC`
    Then I make an application for `Time extension` type

    And I switch to be a `Judge`

    And I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Pending` in the `Decision` field

    And I click the `Decide an application` link
    And I should see the option `Respondent : Application 1` for the `Application` field

    And I click the `Continue` button
    And I should see the text `Time extension`
    And I should see the text `A reason for time extension`
    And I select `Application granted` for the `Decision` field
    And I type `A reason for the decision` for the `Reasons for decision` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Respondent : Application 1` for the `Application` field
    And I should see `Application granted` for the `Decision` field
    And I should see `A reason for the decision` for the `Reasons for decision` field

    And I click the `Record decision` button
    Then I should see the text `You have decided an application`
    And I should see the text `What happens next`
    And I should see the text `The application decision has been recorded and is now available in the applications tab. You must now change the direction's due date`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    When I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field

    When I switch to be a `Legal Rep`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field

    When I switch to be a `Admin Officer`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field

    When I switch to be a `Home Office APC`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field

    When I switch to be a `Home Office LART`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field

    When I switch to be a `Home Office POU`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field

    When I switch to be a `Home Office Generic`
    Then I click the `Applications` tab
    And I should see the `Application` field
    And within the `Application` collection's first item, I should see `Respondent` in the `Applicant` field
    And within the `Application` collection's first item, I should see `Time extension` in the `Type of application` field
    And within the `Application` collection's first item, I should see `A reason for time extension` in the `Application details` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date application was made` field
    And within the `Application` collection's first item, I should see `Granted` in the `Decision` field
    And within the `Application` collection's first item, I should see `A reason for the decision` in the `Reasons for decision` field
    And within the `Application` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date of decision` field
    And within the `Application` collection's first item, I should see `Judge` in the `Decision maker` field
