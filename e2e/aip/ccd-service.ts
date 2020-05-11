const rp = require('request-promise');
const iaConfig = require('../ia.conf');

const ccdApiUrl = iaConfig.CcdApiUrl;
const jurisdictionId = 'IA';
const caseType = 'Asylum';

const Events = {
  EDIT_APPEAL: { id: 'editAppeal', summary: 'Update appeal case AIP', description: 'Update appeal case AIP' },
  SUBMIT_APPEAL: { id: 'submitAppeal', summary: 'Submit Appeal case AIP', description: 'Submit Appeal case AIP' },
  SUBMIT_REASONS_FOR_APPEAL: { id: 'submitReasonsForAppeal', summary: 'Submits Reasons for appeal case AIP', description: 'Submits Reasons for appeal case AIP' },
  SUBMIT_TIME_EXTENSION: { id: 'submitTimeExtension', summary: 'Submit time extension AIP', description: 'Submit time extensions for case AIP' },
  SUBMIT_CLARIFYING_QUESTION_ANSWERS: { id: 'submitClarifyingQuestionAnswers', summary: 'Submit clarifying question answers', description: 'Submit clarifying question answers' }
};

interface SecurityHeaders {
  serviceToken: String;
  userToken: String;
}

interface CaseData {
  journeyType: string;
  appealType: string | string[];
  homeOfficeReferenceNumber: string;
  homeOfficeDecisionDate: string;
  appellantGivenNames: string;
  appellantFamilyName: string;
  appellantDateOfBirth: string;
  appellantNationalities: Nationality[];
  appellantAddress: CCDAddress;
  appellantHasFixedAddress: 'Yes' | 'No';
  subscriptions: SubscriptionCollection[];
  submissionOutOfTime: 'Yes' | 'No';
  applicationOutOfTimeExplanation: string;
  reasonsForAppealDecision: string;
  timeExtensions: TimeExtensionCollection[];
  reviewTimeExtensionRequired?: 'Yes' | 'No';
  clarifyingQuestionsAnswers?: ClarifyingQuestion[];
}

interface Nationality {
  id?: string;
  value: {
    code: string;
  };
}

interface CCDAddress {
  AddressLine1: string;
  AddressLine2: string;
  PostTown: string;
  County: string;
  PostCode: string;
  Country: string;
}

interface SubscriptionCollection {
  id: number;
  value: Subscription;
}

interface Subscription {
  subscriber: string;
  wantsEmail: 'Yes' | 'No';
  email: string;
  wantsSms: 'Yes' | 'No';
  mobileNumber: string;
}

interface CcdCaseDetails {
  id: string;
  case_data: CaseData;
}

interface StartEventResponse {
  event_id: string;
  token: string;
}

interface Event {
  id: string;
  summary: string;
  description: string;
}

interface SubmitEventData {
  event: Event;
  data: Partial<CaseData>;
  event_token: string;
  ignore_warning: boolean;
}

interface TimeExtensionCollection {
  id?: number;
  value: TimeExtension;
}

interface TimeExtension {
  reason: string;
  evidence?: SupportingEvidenceCollection[];
  status: string;
  state: string;
  requestedDate?: string;
}

interface SupportingEvidenceCollection {
  id?: number;
  value: SupportingDocument;
}

interface SupportingDocument {
  document_url: string;
  document_filename: string;
  document_binary_url: string;
}

interface ClarifyingQuestion {
  id: string;
  value: {
    question: string;
    answer?: string;
  }
}

class CcdService {
  private createOptions(userId: string, headers: SecurityHeaders, uri) {
    return {
      uri: uri,
      headers: {
        Authorization: headers.userToken,
        ServiceAuthorization: headers.serviceToken,
        'content-type': 'application/json'
      },
      json: true
    };
  }

  startCreateCase(userId: string, headers: SecurityHeaders): Promise<StartEventResponse> {
    return rp.get(this.createOptions(
      userId,
      headers,
      `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/event-triggers/startAppeal/token`
    ));
  }

  submitCreateCase(userId: string, headers: SecurityHeaders, startEvent: SubmitEventData): Promise<CcdCaseDetails> {
    const options: any = this.createOptions(
      userId,
      headers,
      `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases?ignore-warning=true`);
    options.body = startEvent;

    return rp.post(options);
  }

  async createCase(userId: string, headers: SecurityHeaders): Promise<CcdCaseDetails> {
    const startEventResponse = await this.startCreateCase(userId, headers);

    const caseData = {
      journeyType: 'aip',
      appealType: 'protection',
      homeOfficeReferenceNumber: 'a1234567',
      homeOfficeDecisionDate: isoDate(new Date()),
      appellantGivenNames: 'given name',
      appellantFamilyName: 'family name',
      appellantDateOfBirth: isoDate(new Date('1950-01-01')),
      appellantNationalities: [{
        value: {
          code: 'AF'
        }
      }],
      appellantAddress: {
        AddressLine1: 'Address line 1',
        AddressLine2: 'Address line 2',
        PostTown: 'Post town',
        County: 'county',
        PostCode: 'ab11 1aa',
        Country: 'UK'
      },
      appellantHasFixedAddress: 'No',
      subscriptions: [],
      submissionOutOfTime: 'No',
      applicationOutOfTimeExplanation: null
    } as CaseData;

    const createdCase = await this.submitCreateCase(userId, headers, {
      event: {
        id: startEventResponse.event_id,
        summary: 'Create case AIP',
        description: 'Create case AIP'
      },
      data: caseData,
      event_token: startEventResponse.token,
      ignore_warning: true
    });

    return createdCase;
  }

  startUpdateAppeal(userId: string, caseId: string, eventId: string, headers: SecurityHeaders): Promise<StartEventResponse> {
    return rp.get(this.createOptions(
      userId,
      headers,
      `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases/${caseId}/event-triggers/${eventId}/token`
    ));
  }

  submitUpdateAppeal(userId: string, caseId: string, headers: SecurityHeaders, event: SubmitEventData): Promise<CcdCaseDetails> {
    const options: any = this.createOptions(
      userId,
      headers,
      `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases/${caseId}/events`);
    options.body = event;

    return rp.post(options);
  }

  loadCasesForUser(userId: string, headers: SecurityHeaders): Promise<CcdCaseDetails[]> {
    return rp.get(this.createOptions(
      userId,
      headers,
      `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases`)
    );
  }

  async updateAppeal(event, userId: string, updatedCase: CcdCaseDetails, headers: SecurityHeaders): Promise<CcdCaseDetails> {
    const updateEventResponse = await this.startUpdateAppeal(userId, updatedCase.id, event.id, headers);

    return this.submitUpdateAppeal(userId, updatedCase.id, headers, {
      event: {
        id: updateEventResponse.event_id,
        summary: event.summary,
        description: event.summary
      },
      data: updatedCase.case_data,
      event_token: updateEventResponse.token,
      ignore_warning: true
    });
  }
}

function isoDate(date) {
  const dateLetterSentIso = date.toISOString().split('T')[0];
  return dateLetterSentIso;
}

export {
  CcdService,
  CcdCaseDetails,
  Events
};
