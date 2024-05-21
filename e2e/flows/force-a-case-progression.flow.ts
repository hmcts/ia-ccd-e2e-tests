import { CcdFormPage } from "../pages/ccd-form.page";

export class ForceACaseProgressionFlow {
  private ccdFormPage = new CcdFormPage();

  async forceRequestToCaseBuilding(clickContinue = false) {
    await this.ccdFormPage.selectNextStep("Force request case building");
    await this.ccdFormPage.click("Go");
    await this.ccdFormPage.headingContains("Force request case building");
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.setFieldValue(
      "Reasons to force the case progression",
      "some reasons to force the case progression"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("Send direction");

    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async forceRequestToCaseUnderReview(clickContinue = false) {
    await this.ccdFormPage.selectNextStep("Force case - case under review");
    await this.ccdFormPage.click("Go");
    await this.ccdFormPage.headingContains("Force case - case under review");
    await this.ccdFormPage.setFieldValue(
      "Reasons to force the case progression",
      "some reasons to force the case progression - case under review"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("Submit");
    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }

  async forceCaseToHearingRequirments(clickContinue = false) {
    await this.ccdFormPage.selectNextStep("Force case - hearing reqs");
    await this.ccdFormPage.click("Go");
    await this.ccdFormPage.headingContains("Force case - hearing reqs");
    await this.ccdFormPage.setFieldValue(
      "Reasons to force the case progression",
      "some reasons to force the case progression - case hear req"
    );
    await this.ccdFormPage.click("Continue");
    await this.ccdFormPage.click("Submit");
    if (clickContinue) {
      await this.ccdFormPage.click("Close and Return to case details");
    }
  }
}
