# Immigration & Asylum CCD End2End Journey Tests


## Purpose

This service is to help people to run End2End Journey Tests for Immigration & Asylum.


## Getting Started

### Prerequisites

Running the application requires the following tools to be installed in your environment:

  * [Node.js](https://nodejs.org/) v7.2.0 or later
  * [yarn](https://yarnpkg.com/)

### Install dependencies

Install dependencies by executing the following command:

 ```bash
$ yarn install
 ```

### Running the tests

 ```bash
$ yarn e2e
 ```

## Running the tests locally using docker

Tests can be executed against an instance of CCD running locally using docker.

Follow the instructions here to get CCD running locally:

https://github.com/hmcts/ccd-docker

Once all of the docker containers are running, add the following user roles to the IDAM database:

```
psql -h 127.0.0.1 -p 5000 -U postgres -d idam -c \
  "INSERT INTO role (name, display_name) VALUES
     ('caseworker-ia', 'IA Case Worker'),
     ('caseworker-ia-caseofficer', 'IA Case Officer'),
     ('caseworker-ia-judiciary', 'IA Judiciary'),
     ('caseworker-ia-legalrep-solicitor', 'IA Legal Rep'),
     ('caseworker-ia-system', 'IA System')
     ON CONFLICT DO NOTHING"
```

Then, create IDAM users *matching those in the latest CCD Definition*:

Examples (these are not real users):

```

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"ia-caseofficer@example.com",
       "forename":"Case",
       "surname":"Officer",
       "password":"password",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-caseofficer"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"ia-judiciary@example.com",
       "forename":"Tribunal",
       "surname":"Judge",
       "password":"password",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-judiciary"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"ia-law-firm-a@example.com",
       "forename":"LawFirm",
       "surname":"A",
       "password":"password",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-legalrep-solicitor"],
       "userGroup": {"code": "caseworker"}
      }'

curl \
  http://localhost:4501/testing-support/accounts \
  -H "Content-Type: application/json" \
  -d '{"email":"ia-law-firm-b@example.com",
       "forename":"LawFirm",
       "surname":"B",
       "password":"password",
       "levelOfAccess":1,
       "roles":["caseworker-ia", "caseworker-ia-legalrep-solicitor"],
       "userGroup": {"code": "caseworker"}
      }'
```

Add the roles into CCD:

Examples (these are not real classifications):

```
export userToken="$($CCD_DOCKER_PATH/bin/idam-user-token.sh)"
export serviceToken="$($CCD_DOCKER_PATH/bin/idam-service-token.sh)"

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${userToken}" \
  -H "ServiceAuthorization: Bearer ${serviceToken}" \
  -H "Content-Type: application/json" \
  -d '{"role":"'caseworker-ia-caseofficer'","security_classification":"'PUBLIC'"}'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${userToken}" \
  -H "ServiceAuthorization: Bearer ${serviceToken}" \
  -H "Content-Type: application/json" \
  -d '{"role":"'caseworker-ia-judiciary'","security_classification":"'PUBLIC'"}'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${userToken}" \
  -H "ServiceAuthorization: Bearer ${serviceToken}" \
  -H "Content-Type: application/json" \
  -d '{"role":"'caseworker-ia-legalrep-solicitor'","security_classification":"'PUBLIC'"}'

curl --silent -XPUT \
  http://localhost:4451/api/user-role \
  -H "Authorization: Bearer ${userToken}" \
  -H "ServiceAuthorization: Bearer ${serviceToken}" \
  -H "Content-Type: application/json" \
  -d '{"role":"'caseworker-ia-system'","security_classification":"'PUBLIC'"}'

```

Import a CCD definition spreadsheet:

```
curl --silent \
  http://127.0.0.1:4451/import \
  -H "Authorization: Bearer ${userToken}" \
  -H "ServiceAuthorization: Bearer ${serviceToken}" \
  -F file="@/path/to/definition/spreadsheet"
```

Configure the following environment variables so that the tests run against the docker containers:

Examples (these are not real users):

```
export TEST_E2E_URL_GATEWAY=http://localhost:3453
export TEST_E2E_URL_WEB=http://localhost:3451
export TEST_E2E_USE_PROXY=false

export TEST_CASEOFFICER_USERNAME=ia-caseofficer@example.com
export TEST_CASEOFFICER_PASSWORD=password

export TEST_JUDICIARY_USERNAME=ia-judiciary@example.com
export TEST_JUDICIARY_PASSWORD=password

export TEST_LAW_FIRM_A_USERNAME=ia-legal-rep-a@example.com
export TEST_LAW_FIRM_A_PASSWORD=password

export TEST_LAW_FIRM_B_USERNAME=ia-legal-rep-b@example.com
export TEST_LAW_FIRM_B_PASSWORD=password
```

## Other tasks

To ensure your code is clean (i.e. linting):

 ```bash
$ yarn lint
 ```

To perform NSP dependency checks:

 ```bash
$ yarn test:nsp
 ```
