#!/usr/bin/env bash

set -o nounset

if [[ -z "${CCD_DOCKER_PATH}" ]]; then
    echo "ERROR: CCD_DOCKER_PATH must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_CASEOFFICER_USERNAME}" ]]; then
    echo "ERROR: TEST_CASEOFFICER_USERNAME must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_CASEOFFICER_PASSWORD}" ]]; then
    echo "ERROR: TEST_CASEOFFICER_PASSWORD must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_JUDICIARY_USERNAME}" ]]; then
    echo "ERROR: TEST_JUDICIARY_USERNAME must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_JUDICIARY_PASSWORD}" ]]; then
    echo "ERROR: TEST_JUDICIARY_PASSWORD must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_LAW_FIRM_A_USERNAME}" ]]; then
    echo "ERROR: TEST_LAW_FIRM_A_USERNAME must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_LAW_FIRM_A_PASSWORD}" ]]; then
    echo "ERROR: TEST_LAW_FIRM_A_PASSWORD must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_LAW_FIRM_B_USERNAME}" ]]; then
    echo "ERROR: TEST_LAW_FIRM_B_USERNAME must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${TEST_LAW_FIRM_B_PASSWORD}" ]]; then
    echo "ERROR: TEST_LAW_FIRM_B_PASSWORD must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${IA_SYSTEM_USERNAME}" ]]; then
    echo "ERROR: IA_SYSTEM_USERNAME must be defined in the environment" 1>&2
    exit 1
fi

if [[ -z "${IA_SYSTEM_PASSWORD}" ]]; then
    echo "ERROR: IA_SYSTEM_PASSWORD must be defined in the environment" 1>&2
    exit 1
fi

CCD_DEFINITION_STORE_API_IS_RUNNING=false
(exec 6<>/dev/tcp/127.0.0.1/4451) &>/dev/null && CCD_DEFINITION_STORE_API_IS_RUNNING=true || echo "ERROR: CCD Definition Store API is not running" 1>&2
exec 6>&- # close output connection
exec 6<&- # close input connection

CCD_SHARED_DATABASE_IS_RUNNING=false
(exec 6<>/dev/tcp/127.0.0.1/5000) &>/dev/null && CCD_SHARED_DATABASE_IS_RUNNING=true || echo "ERROR: CCD shared database docker container is not running" 1>&2
exec 6>&- # close output connection
exec 6<&- # close input connection

IDAM_API_IS_RUNNING=false
(exec 6<>/dev/tcp/127.0.0.1/4501) &>/dev/null && IDAM_API_IS_RUNNING=true || echo "ERROR: IDAM API docker container is not running" 1>&2
exec 6>&- # close output connection
exec 6<&- # close input connection

${CCD_SHARED_DATABASE_IS_RUNNING} || exit 1
${IDAM_API_IS_RUNNING} || exit 1
${CCD_DEFINITION_STORE_API_IS_RUNNING} || exit 1

USER_TOKEN="$(${CCD_DOCKER_PATH}/bin/idam-user-token.sh)"
SERVICE_TOKEN="$(${CCD_DOCKER_PATH}/bin/idam-service-token.sh)"

psql -h 127.0.0.1 -p 5000 -U postgres -d idam -c \
  "INSERT INTO role (name, display_name) VALUES
     ('caseworker-ia', 'IA Case Worker'),
     ('caseworker-ia-caseofficer', 'IA Case Officer'),
     ('caseworker-ia-judiciary', 'IA Judiciary'),
     ('caseworker-ia-legalrep-solicitor', 'IA Legal Rep'),
     ('caseworker-ia-system', 'IA System')
     ON CONFLICT DO NOTHING"

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"'"${IA_SYSTEM_USERNAME}"'",
       "forename":"System",
       "surname":"user",
       "password":"'"${IA_SYSTEM_PASSWORD}"'",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-system"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"'"${TEST_CASEOFFICER_USERNAME}"'",
       "forename":"Case",
       "surname":"Officer",
       "password":"'"${TEST_CASEOFFICER_PASSWORD}"'",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-caseofficer"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"'"${TEST_JUDICIARY_USERNAME}"'",
       "forename":"Tribunal",
       "surname":"Judge",
       "password":"'"${TEST_JUDICIARY_PASSWORD}"'",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-judiciary"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"'"${TEST_LAW_FIRM_A_USERNAME}"'",
       "forename":"A",
       "surname":"Legal Rep",
       "password":"'"${TEST_LAW_FIRM_A_PASSWORD}"'",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-legalrep-solicitor"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"'"${TEST_LAW_FIRM_B_USERNAME}"'",
       "forename":"B",
       "surname":"Legal Rep",
       "password":"'"${TEST_LAW_FIRM_B_PASSWORD}"'",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-legalrep-solicitor"],
       "userGroup": {"code": "caseworker"}
      }'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${USER_TOKEN}" \
  -H "ServiceAuthorization: Bearer ${SERVICE_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"role":"caseworker-ia-caseofficer","security_classification":"PUBLIC"}'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${USER_TOKEN}" \
  -H "ServiceAuthorization: Bearer ${SERVICE_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"role":"caseworker-ia-judiciary","security_classification":"PUBLIC"}'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${USER_TOKEN}" \
  -H "ServiceAuthorization: Bearer ${SERVICE_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"role":"caseworker-ia-legalrep-solicitor","security_classification":"PUBLIC"}'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${USER_TOKEN}" \
  -H "ServiceAuthorization: Bearer ${SERVICE_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"role":"caseworker-ia-system","security_classification":"PUBLIC"}'
