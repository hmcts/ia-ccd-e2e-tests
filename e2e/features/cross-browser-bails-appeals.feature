Feature: Cross-browser submit a bails application then an appeal application
 Background:
   Given I am signed in as a `Legal Org User Rep A Bails`
   Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative with no files uploaded
   And I go to the overview page for the stored case
   Then I should be on the overview page

  @xbrowser
  Scenario: Submit a bails application then an appeal application
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And The page is accessible
    When I click the `The applicant has confirmed that the facts stated in this application are true.` label
    And I click the `Submit` button
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds
    And I wait for 5 seconds
    Then I should see the text `The Tribunal will list the case. You will be notified when this happens and the Notice of Hearing will be available in the documents tab.`

    When I save my initial EA appeal type without remission and with hearing fee and pay now
    And I go to the overview page for the stored case
    Then I should be on the overview page
    And I select the `Submit your appeal` Next step
    And I wait for 5 seconds
    Then I should see the `Declaration` page
    And I agree to the declaration
    When I click the `Submit` button
    Then I should see the text `Your appeal has been submitted`
    When I click the `Close and Return to case details` button if present
    Then I should see the text `Case record`
