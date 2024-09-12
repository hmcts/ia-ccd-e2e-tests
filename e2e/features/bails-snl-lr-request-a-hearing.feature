Feature: Bails SNL Hearing request as as Legal Rep
  Background:
    Given I am signed in as a `Legal Org User Rep A Bails`
    When I create a new bail application
   Then I save my initial application as a `Legal Rep` for a Immigration removal centre detention with two financial condition supporters and with a Legal Representative with no files uploaded

  @submit-bail-application @RIA-5661 @submit-bail-application-legal-rep @bails-full @bails-regression @nightly-test 
  Scenario: Bails Hearing request as Legal rep
    When I select the `Submit the application` Next step
    Then I am on the `Submit the application` page
    And The page is accessible
    When I click the `The applicant has confirmed that the facts stated in this application are true.` label
    And I click the `Submit` button
    Then I should see the text `You have submitted this application`
    When I click the `Close and Return to case details` button if present
    And I wait for 10 seconds
    And I switch to be a `Admin Officer Bails`
   And I wait for 5 seconds

    #  Then I should see the text `The Tribunal will list the case. You will be notified when this happens and the Notice of Hearing will be available in the documents tab.`
    When I select the `Create Flag` Next step
    And I have created a `Urgent case` Flag in `Case level`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Language Interpreter` Flag in `Harri Pugh` and language name is `Korean`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Reasonable adjustment` Flag in `Harri Pugh` and signlanguage name is `British Sign Language (BSL)`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Language Interpreter` Flag in `John Smith` and language name is `Telugu`
    And I wait for 10 seconds
    When I select the `Create Flag` Next step
    And I wait for 10 seconds
    And I have created a `Reasonable adjustment` Flag in `John Smith` and signlanguage name is `British Sign Language (BSL)`
    And I wait for 10 seconds
