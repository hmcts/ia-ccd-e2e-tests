# Immigration & Asylum CCD End2End Journey Tests

## Purpose

This service is to help people to run End2End Journey Tests for Immigration & Asylum.

### Getting Started

### Prerequisites

Running the application requires the following tools to be installed in your environment:

- [Node.js](https://nodejs.org/) v18.17.1 or later
- [yarn](https://yarnpkg.com/)
- Zsh - the scripts used are zsh scripts, so you will need to set up zsh scripting on your local machine.

### Install dependencies

Install dependencies by executing the following command:

```bash
yarn install
```

### Running the tests

Before running the tests for the first time, if you are testing against AAT or Preview environments, run

```bash
yarn setAatVaultEnvVariables;
```

If you are testing against Demo environment, run

```bash
yarn setDemoVaultEnvVariables;
```

Then to run the tests off your machine, if you are wanting to run tests for the tag `@this-new-test`, depending on your OS, in the `package.json` find one of the following:

```
test:macFullfunctional;
test:linuxFullfunctional;
test:windowsFullfunctional;
```

And replace the 2 instances of `@TAG_TO_CHANGE` with your tag (in this case `@this-new-test)`, so say we are on a Mac, then we would have

```
"test:macFullfunctional": "npx @puppeteer/browsers install chrome@123 --platform mac; npx @puppeteer/browsers install chromedriver@123 --platform mac; TESTS_FOR_ACCESSIBILITY='true'; NODE_OPTIONS='--max-old-space-size=8192'; node e2e/cucumberTagSearcher.js @this-new-test; protractor e2e/features.parallel.mac.conf.js --cucumberOpts.tags=@this-new-test --cucumberOpts.tags=~@OnlyIfSaveAndContinueIsEnabled",
```

Finally, in your terminal, run the command that matches your OS from the following:

```bash
yarn test:macFullfunctional;
yarn test:linuxFullfunctional;
yarn test:windowsFullfunctional;
```

## Adding new secrets

If you require new secrets pulled from the vault, be sure to add them to the secrets list found in `/e2e/support/set_env_vars_from_vault.zsh` in the format `"ENV_VARIABLE:azure_secret_name"` as well as adding them to the `Jenkinsfile_nightly` file

## Other tasks

To ensure your code is clean (i.e. linting):

```bash
$ yarn lint
```

To perform NSP dependency checks:

```bash
$ yarn test:nsp
```
