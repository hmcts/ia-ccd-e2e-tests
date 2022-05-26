Feature: Record the decision
  Background:
    Given I am signed in as a `Legal Org User Rep A`
    And I create a new bail application
    And I save my initial application as a `Legal Rep` for a Immigration removal centre detention with no financial condition supporters and with a Legal Representative
    And I submit my bail application as a `Legal Rep`
    And I switch to be a `Home Office Generic`
    And I upload the bail summary

  @record-the-decision @RIA-5757 @record-the-decision-refused @record-the-decision-no-ss-consent @record-the-decision-refused-no-ss-consent @bails
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
    Then I am on the `Reasons for refusal` page
    When I type `This is a reason for refusing the application.` for the `Enter the reasons for refusal` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `No` for the `Is Secretary of State consent needed?` field
    And I should see `Refused` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for refusing the application.` for the `Enter the reasons for refusal` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Refused` for the `Decision` field
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    And I should see the text `If you want to make another bail application, you must return to this page to make the new application.`
    And I should see the text `If you make a new application within 28 days of this decision, you won't get another hearing unless the applicant's situation has changed materially.`

  @record-the-decision @RIA-5757 @record-the-decision-refused @record-the-decision-yes-ss-consent @record-the-decision-refused-yes-ss-consent @bails
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
    Then I am on the `Reasons for refusal` page
    When I type `This is a reason for refusing the application.` for the `Enter the reasons for refusal` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `Yes` for the `Is Secretary of State consent needed?` field
    And I should see `Refused` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for refusing the application.` for the `Enter the reasons for refusal` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Refused` for the `Decision` field
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    And I should see the text `If you want to make another bail application, you must return to this page to make the new application.`
    And I should see the text `If you make a new application within 28 days of this decision, you won't get another hearing unless the applicant's situation has changed materially.`

  @record-the-decision @RIA-5757 @record-the-decision-refused @record-the-decision-yes-ss-consent @record-the-decision-refused-yes-ss-consent-minded-to-grant @bails
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
    Then I am on the `Reasons for decision` page
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
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    And I should see the text `If you want to make another bail application, you must return to this page to make the new application.`
    And I should see the text `If you make a new application within 28 days of this decision, you won't get another hearing unless the applicant's situation has changed materially.`

  @record-the-decision @RIA-5757 @record-the-decision-granted @record-the-decision-no-ss-consent @record-the-decision-granted-no-ss-consent @bails
  Scenario: Granted case - SS consent No
    When I switch to be a `Admin Officer`
    And I select the `Record the decision` Next step
    Then I am on the `Judge details` page
    When I type `Mr Judge Judgerson` for the `Judge name` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent` page
    When I select `No` for the `Is Secretary of State consent needed?` field
    And I click the `Continue` button
    Then I am on the `Decision` page
    When I select `Granted` for the `What is the Tribunal's decision?` field
    And I click the `Continue` button
    Then I am on the `Release Status` page
    When I select `Yes` for the `Will the applicant be released with immediate effect?` field
    And I click the `Continue` button
    Then I am on the `Conditions` page
    When I click the `Appearance (where bail is going to be transferred to the Home Office)` label
    And I click the `Activities` label
    And I click the `Residence` label
    And I click the `Reporting (where bail is NOT going to be transferred to the Home Office)` label
    And I click the `Electronic Monitoring` label
    And I click the `Other` label
    And I type `The applicant is to appear before an Immigration Officer at Big Ben between 11am and 1pm on 1st January 2023 or any other place and on any other date and time that may be required by the Home Office or an Immigration Officer.  -OR-  The Applicant must appear before an Immigration Officer on a date and time and by such means as may be notified to him by the Home Office in writing.` for the `Enter the appearance conditions the applicant will be subject to` field
    And I type `The Applicant shall not undertake the activities listed below while on immigration bail without further order:  The Applicant is not allowed to work` for the `Enter the activities conditions the applicant will be subject to` field
    And I type `The applicant must reside at 123 Fake Street.  Where an Immigration Judge makes a conditional grant with deferred commencement:  The applicant will reside at an address approved by the probation/offender manager.  By virtue of para 3(8) of schedule 10 of The Immigration Act 2016 this grant of bail will not commence until such address has been approved by probation.  The approval of a residence address will be reviewed by the Tribunal on the first available date after [ ] days unless the Tribunal is notified prior to that date that accommodation has been approved and bail commenced in which case the matter will be dealt with administratively.  In the event that the applicant has not been released then at least 2 clear days before the bail review hearing, the Secretary of State is to update the Tribunal in writing as to the progress made in relation to sourcing and/or approving accommodation for the applicant.` for the `Enter the residence conditions the applicant will be subject to` field
    And I type `The Applicant must report to an Immigration Officer at Big Ben at 12pm on the 1st of every month.` for the `Enter the reporting conditions the applicant will be subject to` field
    And I type `Note: Where the Tribunal has directed that the Applicant should be subject to an electronic monitoring condition there may be a delay of release of up to 72 hours pending arrangements for the electronic monitoring device.  Bail is granted conditional upon: the applicant being compliant with the fitting of an electronic monitoring device at the point of release from detention; and  the Secretary of State promptly arranging the fitting of the electronic monitoring device at the place of the Applicant's detention. If the secretary of State does not complete the fitting of the electronic monitoring device within 72 hours then this grant of bail will commence and the applicant is to be released subject to the other conditions of this grant of bail. In such an event the Secretary of State will make arrangements for the fitting of the electronic monitoring device post release.` for the `Enter the electronic monitoring conditions the applicant will be subject to` field
    And I type `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I click the `Continue` button
    Then I am on the `Financial condition` page
    When I select `Yes` for the `Will the applicant be subject to a financial condition?` field
    And I click the `Continue` button
    Then I am on the `Financial condition details` page
    When I select `No` for the `Is the financial condition amount correct?` field
    And I click the `Continue` button
    Then I am on the `Confirm financial condition amount` page
    When I type `500` for the `Amount (£)` field
    And I click the `Continue` button
    Then I am on the `Financial condition supporter 1` page
    When I select `Yes` for the `Did the judge agree to accept financial condition supporter 1?` field
    And I click the `Continue` button
    Then I am on the `Financial condition supporter 1 details` page
    When I type `250` for the `Amount (£)` field
    And I click the `Continue` button
    Then I am on the `Bail transfer` page
    When I select `Yes` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `No` for the `Is Secretary of State consent needed?` field
    And I should see `Granted` for the `What is the Tribunal's decision?` field
    And I should see `Yes` for the `Will the applicant be released with immediate effect?` field
    And I should see `The applicant is to appear before an Immigration Officer at Big Ben between 11am and 1pm on 1st January 2023 or any other place and on any other date and time that may be required by the Home Office or an Immigration Officer.  -OR-  The Applicant must appear before an Immigration Officer on a date and time and by such means as may be notified to him by the Home Office in writing.` for the `Enter the appearance conditions the applicant will be subject to` field
    And I should see `The Applicant shall not undertake the activities listed below while on immigration bail without further order:  The Applicant is not allowed to work` for the `Enter the activities conditions the applicant will be subject to` field
    And I should see `The applicant must reside at 123 Fake Street.  Where an Immigration Judge makes a conditional grant with deferred commencement:  The applicant will reside at an address approved by the probation/offender manager.  By virtue of para 3(8) of schedule 10 of The Immigration Act 2016 this grant of bail will not commence until such address has been approved by probation.  The approval of a residence address will be reviewed by the Tribunal on the first available date after [ ] days unless the Tribunal is notified prior to that date that accommodation has been approved and bail commenced in which case the matter will be dealt with administratively.  In the event that the applicant has not been released then at least 2 clear days before the bail review hearing, the Secretary of State is to update the Tribunal in writing as to the progress made in relation to sourcing and/or approving accommodation for the applicant.` for the `Enter the residence conditions the applicant will be subject to` field
    And I should see `The Applicant must report to an Immigration Officer at Big Ben at 12pm on the 1st of every month.` for the `Enter the reporting conditions the applicant will be subject to` field
    And I should see `Note: Where the Tribunal has directed that the Applicant should be subject to an electronic monitoring condition there may be a delay of release of up to 72 hours pending arrangements for the electronic monitoring device.  Bail is granted conditional upon: the applicant being compliant with the fitting of an electronic monitoring device at the point of release from detention; and  the Secretary of State promptly arranging the fitting of the electronic monitoring device at the place of the Applicant's detention. If the secretary of State does not complete the fitting of the electronic monitoring device within 72 hours then this grant of bail will commence and the applicant is to be released subject to the other conditions of this grant of bail. In such an event the Secretary of State will make arrangements for the fitting of the electronic monitoring device post release.` for the `Enter the electronic monitoring conditions the applicant will be subject to` field
    And I should see `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I should see `Yes` for the `Will the applicant be subject to a financial condition?` field
    And I should see `No` for the `Is the financial condition amount correct?` field
    And I should see `500` for the first `Amount (£)` field
    And I should see `Yes` for the `Did the judge agree to accept financial condition supporter 1?` field
    And I should see `250` for the second `Amount (£)` field
    And I should see `Yes` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Granted` for the `Decision` field
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`

  @record-the-decision @RIA-5757 @record-the-decision-granted @record-the-decision-yes-ss-consent @record-the-decision-granted-yes-ss-consent @bails
  Scenario: Granted case - SS consent Yes
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
    Then I am on the `Reasons for decision` page
    When I type `This is a reason for minding to grant.  This is another reason to grant.` for the `Enter the reasons the judge is minded to grant bail` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent decision` page
    When I select `Yes` for the `Does the Secretary of State give consent to grant bail?` field
    And I click the `Continue` button
    Then I am on the `Release Status` page
    When I select `Yes` for the `Will the applicant be released with immediate effect?` field
    And I click the `Continue` button
    Then I am on the `Conditions` page
    When I click the `Other` label
    When I type `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I click the `Continue` button
    Then I am on the `Financial condition` page
    When I select `No` for the `Will the applicant be subject to a financial condition?` field
    And I click the `Continue` button
    Then I am on the `Bail transfer` page
    When I select `No` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `Yes` for the `Is Secretary of State consent needed?` field
    And I should see `Minded to grant` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for minding to grant.  This is another reason to grant.` for the `Enter the reasons the judge is minded to grant bail` field
    And I should see `Yes` for the `Does the Secretary of State give consent to grant bail?` field
    And I should see `Yes` for the `Will the applicant be released with immediate effect?` field
    And I should see `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I should see `No` for the `Will the applicant be subject to a financial condition?` field
    And I should see `No` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    And I should see `Granted` for the `Decision` field
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`

  @record-the-decision @RIA-5757 @record-the-decision-conditional-grant @record-the-decision-no-ss-consent @record-the-decision-conditional-grant-no-ss-consent @bails
  Scenario: Conditional grant case - SS consent No
    When I switch to be a `Admin Officer`
    And I select the `Record the decision` Next step
    Then I am on the `Judge details` page
    When I type `Mr Judge Judgerson` for the `Judge name` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent` page
    When I select `No` for the `Is Secretary of State consent needed?` field
    And I click the `Continue` button
    Then I am on the `Decision` page
    When I select `Granted` for the `What is the Tribunal's decision?` field
    And I click the `Continue` button
    Then I am on the `Release Status` page
    When I select `No` for the `Will the applicant be released with immediate effect?` field
    And I click the `Continue` button
    Then I am on the `Conditions` page
    When I click the `Appearance (where bail is going to be transferred to the Home Office)` label
    And I click the `Activities` label
    And I click the `Residence` label
    And I click the `Reporting (where bail is NOT going to be transferred to the Home Office)` label
    And I click the `Electronic Monitoring` label
    And I click the `Other` label
    And I type `The applicant is to appear before an Immigration Officer at Big Ben between 11am and 1pm on 1st January 2023 or any other place and on any other date and time that may be required by the Home Office or an Immigration Officer.  -OR-  The Applicant must appear before an Immigration Officer on a date and time and by such means as may be notified to him by the Home Office in writing.` for the `Enter the appearance conditions the applicant will be subject to` field
    And I type `The Applicant shall not undertake the activities listed below while on immigration bail without further order:  The Applicant is not allowed to work` for the `Enter the activities conditions the applicant will be subject to` field
    And I type `The applicant must reside at 123 Fake Street.  Where an Immigration Judge makes a conditional grant with deferred commencement:  The applicant will reside at an address approved by the probation/offender manager.  By virtue of para 3(8) of schedule 10 of The Immigration Act 2016 this grant of bail will not commence until such address has been approved by probation.  The approval of a residence address will be reviewed by the Tribunal on the first available date after [ ] days unless the Tribunal is notified prior to that date that accommodation has been approved and bail commenced in which case the matter will be dealt with administratively.  In the event that the applicant has not been released then at least 2 clear days before the bail review hearing, the Secretary of State is to update the Tribunal in writing as to the progress made in relation to sourcing and/or approving accommodation for the applicant.` for the `Enter the residence conditions the applicant will be subject to` field
    And I type `The Applicant must report to an Immigration Officer at Big Ben at 12pm on the 1st of every month.` for the `Enter the reporting conditions the applicant will be subject to` field
    And I type `Note: Where the Tribunal has directed that the Applicant should be subject to an electronic monitoring condition there may be a delay of release of up to 72 hours pending arrangements for the electronic monitoring device.  Bail is granted conditional upon: the applicant being compliant with the fitting of an electronic monitoring device at the point of release from detention; and  the Secretary of State promptly arranging the fitting of the electronic monitoring device at the place of the Applicant's detention. If the secretary of State does not complete the fitting of the electronic monitoring device within 72 hours then this grant of bail will commence and the applicant is to be released subject to the other conditions of this grant of bail. In such an event the Secretary of State will make arrangements for the fitting of the electronic monitoring device post release.` for the `Enter the electronic monitoring conditions the applicant will be subject to` field
    And I type `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I click the `Continue` button
    Then I am on the `Financial condition` page
    When I select `Yes` for the `Will the applicant be subject to a financial condition?` field
    And I click the `Continue` button
    Then I am on the `Financial condition details` page
    When I select `No` for the `Is the financial condition amount correct?` field
    And I click the `Continue` button
    Then I am on the `Confirm financial condition amount` page
    When I type `500` for the `Amount (£)` field
    And I click the `Continue` button
    Then I am on the `Financial condition supporter 1` page
    When I select `Yes` for the `Did the judge agree to accept financial condition supporter 1?` field
    And I click the `Continue` button
    Then I am on the `Financial condition supporter 1 details` page
    When I type `250` for the `Amount (£)` field
    And I click the `Continue` button
    Then I am on the `Bail transfer` page
    When I select `Yes` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `No` for the `Is Secretary of State consent needed?` field
    And I should see `Granted` for the `What is the Tribunal's decision?` field
    And I should see `No` for the `Will the applicant be released with immediate effect?` field
    And I should see `The applicant is to appear before an Immigration Officer at Big Ben between 11am and 1pm on 1st January 2023 or any other place and on any other date and time that may be required by the Home Office or an Immigration Officer.  -OR-  The Applicant must appear before an Immigration Officer on a date and time and by such means as may be notified to him by the Home Office in writing.` for the `Enter the appearance conditions the applicant will be subject to` field
    And I should see `The Applicant shall not undertake the activities listed below while on immigration bail without further order:  The Applicant is not allowed to work` for the `Enter the activities conditions the applicant will be subject to` field
    And I should see `The applicant must reside at 123 Fake Street.  Where an Immigration Judge makes a conditional grant with deferred commencement:  The applicant will reside at an address approved by the probation/offender manager.  By virtue of para 3(8) of schedule 10 of The Immigration Act 2016 this grant of bail will not commence until such address has been approved by probation.  The approval of a residence address will be reviewed by the Tribunal on the first available date after [ ] days unless the Tribunal is notified prior to that date that accommodation has been approved and bail commenced in which case the matter will be dealt with administratively.  In the event that the applicant has not been released then at least 2 clear days before the bail review hearing, the Secretary of State is to update the Tribunal in writing as to the progress made in relation to sourcing and/or approving accommodation for the applicant.` for the `Enter the residence conditions the applicant will be subject to` field
    And I should see `The Applicant must report to an Immigration Officer at Big Ben at 12pm on the 1st of every month.` for the `Enter the reporting conditions the applicant will be subject to` field
    And I should see `Note: Where the Tribunal has directed that the Applicant should be subject to an electronic monitoring condition there may be a delay of release of up to 72 hours pending arrangements for the electronic monitoring device.  Bail is granted conditional upon: the applicant being compliant with the fitting of an electronic monitoring device at the point of release from detention; and  the Secretary of State promptly arranging the fitting of the electronic monitoring device at the place of the Applicant's detention. If the secretary of State does not complete the fitting of the electronic monitoring device within 72 hours then this grant of bail will commence and the applicant is to be released subject to the other conditions of this grant of bail. In such an event the Secretary of State will make arrangements for the fitting of the electronic monitoring device post release.` for the `Enter the electronic monitoring conditions the applicant will be subject to` field
    And I should see `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I should see `Yes` for the `Will the applicant be subject to a financial condition?` field
    And I should see `No` for the `Is the financial condition amount correct?` field
    And I should see `500` for the first `Amount (£)` field
    And I should see `Yes` for the `Did the judge agree to accept financial condition supporter 1?` field
    And I should see `250` for the second `Amount (£)` field
    And I should see `Yes` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    Then I should see the text `Depending on the circumstance of the application, you can:`
    Then I should see the text `Relist the case`
    Then I should see the text `Send a direction`
    And I should see `Conditional grant` for the `Decision` field
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`

  @record-the-decision @RIA-5757 @record-the-decision-conditional-grant @record-the-decision-yes-ss-consent @record-the-decision-conditional-grant-yes-ss-consent @bails
  Scenario: Conditional grant case - SS consent Yes
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
    Then I am on the `Reasons for decision` page
    When I type `This is a reason for minding to grant.  This is another reason to grant.` for the `Enter the reasons the judge is minded to grant bail` field
    And I click the `Continue` button
    Then I am on the `Secretary of State consent decision` page
    When I select `Yes` for the `Does the Secretary of State give consent to grant bail?` field
    And I click the `Continue` button
    Then I am on the `Release Status` page
    When I select `No` for the `Will the applicant be released with immediate effect?` field
    And I click the `Continue` button
    Then I am on the `Conditions` page
    When I click the `Other` label
    When I type `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I click the `Continue` button
    Then I am on the `Financial condition` page
    When I select `No` for the `Will the applicant be subject to a financial condition?` field
    And I click the `Continue` button
    Then I am on the `Bail transfer` page
    When I select `No` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    And I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Mr Judge Judgerson` for the `Judge name` field
    And I should see `Yes` for the `Is Secretary of State consent needed?` field
    And I should see `Minded to grant` for the `What is the Tribunal's decision?` field
    And I should see `This is a reason for minding to grant.  This is another reason to grant.` for the `Enter the reasons the judge is minded to grant bail` field
    And I should see `Yes` for the `Does the Secretary of State give consent to grant bail?` field
    And I should see `No` for the `Will the applicant be released with immediate effect?` field
    And I should see `This other new condition.` for the `Enter the other conditions the applicant will be subject to` field
    And I should see `No` for the `Will the applicant be subject to a financial condition?` field
    And I should see `No` for the `Will the future management of bail for this applicant transfer to the Secretary of State?` field
    When I click the `Record decision` button
    Then I should see the text `You have recorded the decision`
    When I click the `Close and Return to case details` button
    Then I should see the text `The application has been decided. Download the decision notice from the documents tab and distribute to anyone who needs to sign it. Upload the signed decision notice when it is ready.`
    Then I should see the text `Depending on the circumstance of the application, you can:`
    Then I should see the text `Relist the case`
    Then I should see the text `Send a direction`
    And I should see `Conditional grant` for the `Decision` field
    And I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Tribunal document` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Decision date` field
    When I click the `Documents` tab
    Then within the `Tribunal document` collection's first item, I should see `Pugh-decision-notice-UNSIGNED.PDF` for the `Document` field
    And within the `Tribunal document` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
    When I switch to be a `Home Office Generic`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Judge`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
    When I switch to be a `Legal Org User Rep A`
    Then I should see the text `The application has been decided. The decision notice is available in the documents tab.`
