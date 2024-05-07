# Immigration & Asylum CCD End2End Journey Tests

## Purpose

This service is to help people to run End2End Journey Tests for Immigration & Asylum.

## Getting Started

### Prerequisites

Running the application requires the following tools to be installed in your environment:

- [Node.js](https://nodejs.org/) v7.2.0 or later
- [yarn](https://yarnpkg.com/)

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

### To run scenarios or features in parallel browser sessions:

```bash
TEST_E2E_NUM_BROWSERS=2 TEST_E2E_HEADLESS=false yarn run localTestParallelScenarios "--cucumberOpts.tags=@share-a-case or @RIA-585"

TEST_E2E_NUM_BROWSERS=2 TEST_E2E_HEADLESS=false yarn run localTestParallelFeatures "--cucumberOpts.tags=@share-a-case or @RIA-585"
```

## Running the tests locally using docker

Tests can be executed against an instance of CCD running locally using docker.

### Prerequisites

Running the tests locally requires the following tools to be installed in your environment:

- docker
- curl
- psql (postgresql client)

Setup environment variables. In ia-docker there is a .local-env file which will setup the environment variables you
need. **Either source this in your profile or make sure you have these variables setup.**

Follow the _Quick start_ instructions here to get CCD running locally:

https://github.com/hmcts/ccd-docker#quick-start

Configure CCD with the users exported to your environment (do this once when you first run ccd-docker):

`./bin/create-users.sh`

Import the CCD Definition spreadsheet:

`./bin/import-definition.sh /path/to/definition/spreadsheet`

## Other tasks

To ensure your code is clean (i.e. linting):

```bash
$ yarn lint
```

To perform NSP dependency checks:

```bash
$ yarn test:nsp
```
