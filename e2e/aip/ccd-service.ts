import { getUserId, getUserToken, UserInfo } from "./idam-service";
import { getS2sToken } from "./s2s";
import axios from "axios";

const rp = require('request-promise');
const iaConfig = require('../ia.conf');

const ccdApiUrl = iaConfig.CcdApiUrl;
const jurisdictionId = 'IA';
const caseType = 'Asylum';

const Events = {
  EDIT_APPEAL: {
    id: 'editAppeal',
    summary: 'Update appeal case AIP',
    description: 'Update appeal case AIP',
  },
  SUBMIT_APPEAL: {
    id: 'submitAppeal',
    summary: 'Submit Appeal case AIP',
    description: 'Submit Appeal case AIP',
  },
  SUBMIT_REASONS_FOR_APPEAL: {
    id: 'submitReasonsForAppeal',
    summary: 'Submits Reasons for appeal case AIP',
    description: 'Submits Reasons for appeal case AIP',
  },
  SUBMIT_TIME_EXTENSION: {
    id: 'submitTimeExtension',
    summary: 'Submit time extension AIP',
    description: 'Submit time extensions for case AIP',
  },
  SUBMIT_CLARIFYING_QUESTION_ANSWERS: {
    id: 'submitClarifyingQuestionAnswers',
    summary: 'Submit clarifying question answers',
    description: 'Submit clarifying question answers',
  },
};

interface SecurityHeaders {
  serviceToken: string;
  userToken: string;
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
  state?: string;
  case_data: CaseData;
  created_date?: string;
  last_modified?: string;
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
  supplementary_data_request?: Record<string, Record<string, string>>;

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
  };
}

class CcdService {
  private createOptions(userId: string, headers: SecurityHeaders, uri) {
    return {
      uri: uri,
      headers: {
        Authorization: headers.userToken,
        ServiceAuthorization: headers.serviceToken,
        'content-type': 'application/json',
      },
      json: true,
    };
  }

  startCreateCase(userId: string, headers: SecurityHeaders): Promise<StartEventResponse> {
    return rp.get(this.createOptions(userId, headers, `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/event-triggers/startAppeal/token`));
  }

  submitCreateCase(userId: string, headers: SecurityHeaders, startEvent: SubmitEventData): Promise<CcdCaseDetails> {
    const options: any = this.createOptions(userId, headers, `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases?ignore-warning=true`);
    options.body = startEvent;

    return rp.post(options);
  }

  async createCase(userId: string, headers: SecurityHeaders): Promise<CcdCaseDetails> {
    const startEventResponse = await this.startCreateCase(userId, headers);

    const caseData = {
      journeyType: 'aip',
      appealType: 'protection',
      homeOfficeReferenceNumber: '01234567',
      homeOfficeDecisionDate: isoDate(new Date()),
      appellantGivenNames: 'given name',
      appellantFamilyName: 'family name',
      appellantDateOfBirth: isoDate(new Date('1950-01-01')),
      appellantNationalities: [
        {
          value: {
            code: 'AF',
          },
        },
      ],
      appellantAddress: {
        AddressLine1: 'Address line 1',
        AddressLine2: 'Address line 2',
        PostTown: 'Post town',
        County: 'county',
        PostCode: 'ab11 1aa',
        Country: 'UK',
      },
      appellantHasFixedAddress: 'No',
      subscriptions: [],
      submissionOutOfTime: 'No',
      applicationOutOfTimeExplanation: null,
    } as CaseData;

    const createdCase = await this.submitCreateCase(userId, headers, {
      event: {
        id: startEventResponse.event_id,
        summary: 'Create case AIP',
        description: 'Create case AIP',
      },
      data: caseData,
      event_token: startEventResponse.token,
      ignore_warning: true,
    });

    return createdCase;
  }

  startUpdateAppeal(userId: string, caseId: string, eventId: string, headers: SecurityHeaders): Promise<StartEventResponse> {
    return rp.get(this.createOptions(userId, headers, `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases/${caseId}/event-triggers/${eventId}/token`));
  }

  submitUpdateAppeal(userId: string, caseId: string, headers: SecurityHeaders, event: SubmitEventData): Promise<CcdCaseDetails> {
    const options: any = this.createOptions(userId, headers, `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases/${caseId}/events`);
    options.body = event;

    return rp.post(options);
  }

  loadCasesForUser(userId: string, headers: SecurityHeaders): Promise<CcdCaseDetails[]> {
    return rp.get(this.createOptions(userId, headers, `${ccdApiUrl}/citizens/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases`));
  }

  async updateAppeal(event, userId: string, updatedCase: CcdCaseDetails, headers: SecurityHeaders): Promise<CcdCaseDetails> {
    const updateEventResponse = await this.startUpdateAppeal(userId, updatedCase.id, event.id, headers);

    return this.submitUpdateAppeal(userId, updatedCase.id, headers, {
      event: {
        id: updateEventResponse.event_id,
        summary: event.summary,
        description: event.summary,
      },
      data: updatedCase.case_data,
      event_token: updateEventResponse.token,
      ignore_warning: true,
    });
  }
}

function isoDate(date) {
  const dateLetterSentIso = date.toISOString().split('T')[0];
  return dateLetterSentIso;
}

async function getSecurityHeaders(user: UserInfo): Promise<SecurityHeaders> {
  const userToken: string = await getUserToken(user);
  const serviceToken: string = await getS2sToken();
  return {userToken, serviceToken};
}

async function createCase(user: UserInfo, caseData: any): Promise<CcdCaseDetails> {
  const headers = await getSecurityHeaders(user);
  const userId = await getUserId(headers.userToken);
  const startEventResponse = await startCreateCase(userId, headers, true);
  const supplementaryDataRequest = generateSupplementaryId();
  return await submitCreateCase(userId, headers, {
    event: {
      id: startEventResponse.event_id,
      summary: 'Create case LR',
      description: 'Create case LR'
    },
    data: caseData,
    event_token: startEventResponse.token,
    ignore_warning: true,
    supplementary_data_request: supplementaryDataRequest
  }, true);
}

async function startCreateCase(userId: string, headers: SecurityHeaders, isLegalRep = false): Promise<StartEventResponse> {
  const url = `${ccdApiUrl}/${isLegalRep ? 'caseworkers' : 'citizens'}/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/event-triggers/startAppeal/token`;
  const response = await axios.get(url, createOptions(
    headers
  ));
  return response.data;
}

async function submitCreateCase(userId: string, headers: SecurityHeaders, startEvent: SubmitEventData, isLegalRep = false): Promise<CcdCaseDetails> {
  const url = `${ccdApiUrl}/${isLegalRep ? 'caseworkers' : 'citizens'}/${userId}/jurisdictions/${jurisdictionId}/case-types/${caseType}/cases?ignore-warning=true`;
  const options: any = createOptions(
    headers
  );
  const response = await axios.post(url, startEvent, options);
  return response.data;
}

function createOptions(headers: SecurityHeaders) {
  return {
    headers: {
      Authorization: headers.userToken,
      ServiceAuthorization: headers.serviceToken,
      'content-type': 'application/json'
    }
  };
}

function generateSupplementaryId(): Record<string, Record<string, string>> {
  let serviceId: Record<string, string> = {};
  serviceId['HMCTSServiceId'] = 'BFA1';
  let request: Record<string, Record<string, string>> = {};
  request['$set'] = serviceId;
  return request;
}

export { CcdService, CcdCaseDetails, Events, createCase };
