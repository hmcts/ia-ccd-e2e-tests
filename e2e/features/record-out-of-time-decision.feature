Feature: Record out of time decision feature

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal with out of time decision letter
    And I submit my appeal


  @record-out-of-time-decision-in-time @RIA-4042-in-time @RIA-4042
  Scenario: Case officer record out of time decision

    Then I switch to be a `Case Officer`
    And I should see the text `This appeal has been submitted out of time.`
    And I should see the text `Review the out of time details in the appeal tab. You must then record an out of time decision.`
    And I click the `record an out of time decision` link

    Then I select `Appeal is in time` for the `Decision` field
    And I upload `{@Evidence1.pdf}` for the `Upload decision notice` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Appeal is in time` for the `Decision` field
    And I should see `Evidence1.pdf` in the `Upload decision notice` field
    And I click the `Submit` button

    Then I should see the text `You have recorded an out of time decision`
    And I should see the text `What happens next`
    And I should see the text `This appeal will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Appeal is in time` for the `Decision` field
    And I should see `Tribunal Caseworker` for the `Decision maker` field
    And I should see `Evidence1.pdf` for the `Upload decision notice` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Appeal is in time` for the `Decision` field
    And I should see `Tribunal Caseworker` for the `Decision maker` field
    And I should see `Evidence1.pdf` for the `Upload decision notice` field

  @record-out-of-time-decision-approved @RIA-4042-approved @RIA-4042
  Scenario: Case officer record out of time decision

    Then I switch to be a `Case Officer`
    And I should see the text `This appeal has been submitted out of time.`
    And I should see the text `Review the out of time details in the appeal tab. You must then record an out of time decision.`
    And I click the `record an out of time decision` link

    Then I select `Appeal is out of time but can proceed` for the `Decision` field
    And I upload `{@Evidence1.pdf}` for the `Upload decision notice` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Appeal is out of time but can proceed` for the `Decision` field
    And I should see `Evidence1.pdf` in the `Upload decision notice` field
    And I click the `Submit` button

    Then I should see the text `You have recorded an out of time decision`
    And I should see the text `What happens next`
    And I should see the text `This appeal will proceed as usual.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Appeal is out of time but can proceed` for the `Decision` field
    And I should see `Tribunal Caseworker` for the `Decision maker` field
    And I should see `Evidence1.pdf` for the `Upload decision notice` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Appeal is out of time but can proceed` for the `Decision` field
    And I should see `Tribunal Caseworker` for the `Decision maker` field
    And I should see `Evidence1.pdf` for the `Upload decision notice` field

  @record-out-of-time-decision-rejected @RIA-4042-rejected @RIA-4042
  Scenario: Case officer record out of time decision

    Then I switch to be a `Case Officer`
    And I should see the text `This appeal has been submitted out of time.`
    And I should see the text `Review the out of time details in the appeal tab. You must then record an out of time decision.`
    And I click the `record an out of time decision` link

    Then I select `Appeal is out of time and cannot proceed` for the `Decision` field
    And I upload `{@Evidence1.pdf}` for the `Upload decision notice` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Appeal is out of time and cannot proceed` for the `Decision` field
    And I should see `Evidence1.pdf` in the `Upload decision notice` field
    And I click the `Submit` button

    Then I should see the text `You have recorded that the appeal is out of time and cannot proceed`
    And I should see the text `Do this next`
    And I should see the text `This appeal is out time and cannot proceed. You must end the appeal.`

    When I click the `Close and Return to case details` button if present
    And I wait for 2 seconds

    Then I click the `Overview` tab
    And I should see the text `Do this next`
    And I should see the text `This appeal is out of time and cannot proceed. You must end the appeal.`

    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Appeal is out of time and cannot proceed` for the `Decision` field
    And I should see `Tribunal Caseworker` for the `Decision maker` field
    And I should see `Evidence1.pdf` for the `Upload decision notice` field

    When I switch to be a `Legal Rep`
    Then I click the `Appeal` tab
    And I should see the `Appeal` page
    And I should see `Appeal is out of time and cannot proceed` for the `Decision` field
    And I should see `Tribunal Caseworker` for the `Decision maker` field
    And I should see `Evidence1.pdf` for the `Upload decision notice` field




