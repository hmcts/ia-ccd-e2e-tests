Feature: Other Appeal Numbers are validated

    ###############################################################
    ############### THIS FEATURE DOES NOT WORK ####################
    ###############################################################

    ###############################################################
    ### This is a bug logged in ServiceNow: Incident INC0484123 ###
    ###############################################################

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
    And I complete the `Type of appeal` page
    And I complete the `The grounds of your appeal` page
    And I complete the `Deportation order` page
    And I complete the `New matters` page
    And I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I select `Yes` for the `Other appeals` field
    And I click the `Continue` button

  @start-appeal @alternate @RIA-635 @migrate-to-unit-tests
  Scenario: Invalid other appeal references

#    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
#    And I add an item to the `Appeal number` collection
#    When within the `Appeal number` collection's first item, I type `RT/12345/2014` for the field without a label
#    And I click the `Continue` button
#    Then I should see an error saying `The data entered is not valid for this type of field, please delete and re-enter using only valid data`
#
#    When within the `Appeal number` collection's first item, I type `PA/1234x/2014` for the field without a label
#    And I click the `Continue` button
#    Then I should see an error saying `The data entered is not valid for this type of field, please delete and re-enter using only valid data`
#
#    When within the `Appeal number` collection's first item, I type `PA/123456/2014` for the field without a label
#    And I click the `Continue` button
#    Then I should see an error saying `The data entered is not valid for this type of field, please delete and re-enter using only valid data`
#
#    When within the `Appeal number` collection's first item, I type `PA/123456/201` for the field without a label
#    And I click the `Continue` button
#    Then I should see an error saying `The data entered is not valid for this type of field, please delete and re-enter using only valid data`
#
#    When within the `Appeal number` collection's first item, I type `PA/123456/20143` for the field without a label
#    Then I should see an error saying `The data entered is not valid for this type of field, please delete and re-enter using only valid data`


  @start-appeal @alternate @RIA-635 @migrate-to-unit-tests
  Scenario: Valid appeal references

    Given I am on the `Has your client appealed against any other UK immigration decisions?` page
    And I add an item to the `Appeal number` collection
    When within the `Appeal number` collection's first item, I type `AA/12345/2012` for the field without a label
    And I add another item to the `Appeal number` collection
    When within the `Appeal number` collection's second item, I type `IA/12345/2012` for the field without a label
    And I add another item to the `Appeal number` collection
    When within the `Appeal number` collection's third item, I type `OA/12345/2012` for the field without a label
    And I add another item to the `Appeal number` collection
    When within the `Appeal number` collection's fourth item, I type `VA/12345/2012` for the field without a label
    And I click the `Continue` button
    Then I am on the `Legal representative details` page

    Given I click the `Previous` button
    And I am on the `Has your client appealed against any other UK immigration decisions?` page
    When within the `Appeal number` collection's first item, I type `EA/12345/2016` for the field without a label
    And within the `Appeal number` collection's second item, I type `HU/12345/2016` for the field without a label
    And within the `Appeal number` collection's third item, I type `DC/12345/2016` for the field without a label
    And within the `Appeal number` collection's fourth item, I type `DA/12345/2016` for the field without a label
    And I click the `Continue` button
    Then I am on the `Legal representative details` page
