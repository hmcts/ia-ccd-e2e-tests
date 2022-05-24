Feature: Record the decision
 Background:
   Given I am signed in as a `Legal Org User Rep A`
   And I create a new bail application
   And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
   And I submit my bail application as a `Legal Rep`
   And I upload the bail summary

  @record-the-decision @RIA-5757 @record-the-decision-refused @record-the-decision-no-ss-consent @record-the-decision-refused-no-ss-consent @bails-nightly
  Scenario: Refused case - SS consent No
    When I switch to be a `Admin Officer`
    And I select the `Record the decision` Next step
    Then I am on the `Judge details` page
    When I type `Mr Judge Judgerson` for the `Judge name` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent` page
    When I select `No` for the `Is Secretary of State consent needed?` field
    And I click the `Continue` button
    Then I am on the `Decision` page
    When I select `Refused` for the `What is the Tribunal's decision?` field
    And I click the `Continue` button
    Then I am on the `Reason for refusal` page
    When I type `This is a reason for refusing the application.` for the `Enter the reason for refusal` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `No` for the `Is Secretary of State consent needed?` field
    And I should see `Refused` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for refusing the application.` for the `Enter the reason for refusal` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Refused` for the `Decision` field
    And I should see `UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `UNSIGNED.PDF` for the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    And I should see the text `If you want to make another bail application, you must return to this page to make the new application.`
    And I should see the text `If you make a new application within 28 days of this decision, you won't get another hearing unless the applicant's situation has changed materially.`

  @record-the-decision @RIA-5757 @record-the-decision-refused @record-the-decision-yes-ss-consent @record-the-decision-refused-yes-ss-consent @bails-nightly
  Scenario: Refused case - SS consent Yes
    When I switch to be a `Admin Officer`
    And I select the `Record the decision` Next step
    Then I am on the `Judge details` page
    When I type `Mr Judge Judgerson` for the `Judge name` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent` page
    When I select `Yes` for the `Is Secretary of State consent needed?` field
    And I click the `Continue` button
    Then I am on the `Decision` page
    When I select `Refused` for the `What is the Tribunal's decision?` field
    And I click the `Continue` button
    Then I am on the `Reason for refusal` page
    When I type `This is a reason for refusing the application.` for the `Enter the reason for refusal` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `Yes` for the `Is Secretary of State consent needed?` field
    And I should see `Refused` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for refusing the application.` for the `Enter the reason for refusal` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Refused` for the `Decision` field
    And I should see `UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `UNSIGNED.PDF` for the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    And I should see the text `If you want to make another bail application, you must return to this page to make the new application.`
    And I should see the text `If you make a new application within 28 days of this decision, you won't get another hearing unless the applicant's situation has changed materially.`

  @record-the-decision @RIA-5757 @record-the-decision-refused @record-the-decision-yes-ss-consent @record-the-decision-refused-yes-ss-consent-minded-to-grant @bails-nightly
  Scenario: Refused case - SS consent Yes - Minded to grant
    When I switch to be a `Admin Officer`
    And I select the `Record the decision` Next step
    Then I am on the `Judge details` page
    When I type `Mr Judge Judgerson` for the `Judge name` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent` page
    When I select `Yes` for the `Is Secretary of State consent needed?` field
    And I click the `Continue` button
    Then I am on the `Decision` page
    When I select `Minded to grant` for the `What is the Tribunal's decision?` field
    And I click the `Continue` button
    Then I am on the `Reason for Decision` page
    When I type `This is a reason for minding to grant bail.` for the `Enter the reasons the judge is minded to grant bail` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent decision` page
    When I select `No` for the `Does the Secretary of State give consent to grant bail?` field
    And I click the `Continue` button
    Then I am on the `Reasons for refusal` page
    When I should see `The Tribunal was minded to grant bail for the reasons given. The Home Office have refused to consent to the grant of bail so in accordance with paragraph 3(4) of Schedule 10 Immigration Act 2016 bail is refused.` for the `Enter the reasons for refusal` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `Yes` for the `Is Secretary of State consent needed?` field
    And I should see `Minded to grant` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for minding to grant bail.` for the `Enter the reasons the judge is minded to grant bail` field
    And I should see `No` for the `Does the Secretary of State give consent to grant bail?` field
    And I should see `The Tribunal was minded to grant bail for the reasons given. The Home Office have refused to consent to the grant of bail so in accordance with paragraph 3(4) of Schedule 10 Immigration Act 2016 bail is refused.` for the `Enter the reasons for refusal` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Refused` for the `Decision` field
    And I should see `UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `UNSIGNED.PDF` for the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    And I should see the text `If you want to make another bail application, you must return to this page to make the new application.`
    And I should see the text `If you make a new application within 28 days of this decision, you won't get another hearing unless the applicant's situation has changed materially.`
