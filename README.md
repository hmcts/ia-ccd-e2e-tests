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
### start the docker container:
$ docker-compose build
$ docker-compose up -d

### tests run inside the docker container:
$ docker-compose exec ia-ccd-e2e-tests bash
$ yarn install
$ yarn e2e
 ```

## Running the tests locally using docker

Tests can be executed against an instance of CCD running locally using docker.

### Prerequisites

Running the tests locally requires the following tools to be installed in your environment:

  * docker
  * curl
  * psql (postgresql client)

Follow the *Quick start* instructions here to get CCD running locally:

https://github.com/hmcts/ccd-docker#quick-start

Once all of the docker containers are running, configure the environment variables shown below so that the tests run against the docker containers.

Examples (the values below are not real, replace them with values *matching those in the latest CCD Definition spreadsheet*):

```
export CCD_DOCKER_PATH=/path/to/ccd-docker

export TEST_E2E_URL_GATEWAY=http://localhost:3453
export TEST_E2E_URL_WEB=http://localhost:3451
export TEST_E2E_USE_PROXY=false

export TEST_CASEOFFICER_USERNAME=ia-caseofficer@example.com
export TEST_CASEOFFICER_PASSWORD=password

export TEST_ADMINOFFICER_USERNAME=ia-adminofficer@example.com
export TEST_ADMINOFFICER_PASSWORD=password

export TEST_HOMEOFFICE_APC_USERNAME=ia-respondentapc@example.com
export TEST_HOMEOFFICE_APC_PASSWORD=password

export TEST_HOMEOFFICE_LART_USERNAME=ia-respondentlart@example.com
export TEST_HOMEOFFICE_LART_PASSWORD=password

export TEST_HOMEOFFICE_POU_USERNAME=ia-respondentpou@example.com
export TEST_HOMEOFFICE_POU_PASSWORD=password

export TEST_HOMEOFFICE_GENERIC_USERNAME=ia-respondentgen@example.com
export TEST_HOMEOFFICE_GENERIC_PASSWORD=password

export TEST_JUDICIARY_USERNAME=ia-judiciary@example.com
export TEST_JUDICIARY_PASSWORD=password

export TEST_LAW_FIRM_A_USERNAME=ia-legal-rep-a@example.com
export TEST_LAW_FIRM_A_PASSWORD=password

export TEST_LAW_FIRM_B_USERNAME=ia-legal-rep-b@example.com
export TEST_LAW_FIRM_B_PASSWORD=password

export IA_SYSTEM_USERNAME=system-user
export IA_SYSTEM_PASSWORD=system-password
```

Configure CCD with the users exported to your environment (do this once when you first run ccd-docker):

```./bin/create-users.sh```

Import the CCD Definition spreadsheet:

```./bin/import-definition.sh /path/to/definition/spreadsheet```

## Other tasks

To ensure your code is clean (i.e. linting):

 ```bash
$ yarn lint
 ```

To perform NSP dependency checks:

 ```bash
$ yarn test:nsp
 ```
