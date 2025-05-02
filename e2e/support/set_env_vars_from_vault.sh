#!/bin/bash

vault_name=${1}

display_usage() {
  clear
  echo "This script loads the environment variables and their associated values from the Azure vault into your current terminal session."
  echo "These variables are required to run automation tests against any of the following: PREVIEW, AAT and DEMO."
  echo ""
  echo "You will need to know the vault name you wish to retrieve the secrets from."
  echo "Currently there are only two vaults for IAC: ia-aat and ia-demo."
  echo ""
  echo "Example of running the script from it's containing folder:"
  echo ". ./set_env_vars_from_vault.sh <vault name>"
  echo ""
  echo "Example of running the script from the project folder:"
  echo ". ./e2e/support/set_env_vars_from_vault.sh <vault name>"
  echo ""
  echo "NOTE: the '. ' ie dot space at the beginning of the command. This is required for the environment variables to be set in you current terminal session."
  echo ""
  echo ""
}

display_example() {
  clear
  echo "The vault name to retrieve the required secrets is required."
  echo ""
  echo "Example: . ./set_env_vars_from_vault.sh ia-aat"
  echo "Where 'ia-aat' is the vault name."
  echo ""
  echo "NOTE: the '. ' ie dot space at the beginning of the command. This is required for the environment variables to be set in you current terminal session."
  echo ""
  echo ""
}

get_secret_value() {
    local secret_name=$1
    local vault_name=$2

    json_output=$(az keyvault secret show --name $secret_name --vault-name $vault_name)

    secret_value=$(echo $json_output | jq -r '.value')
}

clear
if [[ $vault_name = "-h" || $vault_name = "help" ]]; then
  display_usage
  return
elif [[ ${vault_name} != "ia-aat" && ${vault_name} != "ia-demo" ]]; then
  echo "Supported vault names are: ia-aat and ia-demo"
  display_example
  return
fi

echo "About to setup local environment variables..."
echo "Building list of secrets to retrieve"
secrets=(
        "TEST_CASEOFFICER_USERNAME:test-caseofficer-username"
        "TEST_CASEOFFICER_PASSWORD:test-caseofficer-password"
        "TEST_LAW_FIRM_A_USERNAME:test-law-firm-a-username"
        "TEST_LAW_FIRM_A_PASSWORD:test-law-firm-a-password"
        "TEST_LAW_FIRM_B_USERNAME:test-law-firm-b-username"
        "TEST_LAW_FIRM_B_PASSWORD:test-law-firm-b-password"
        "TEST_LAW_FIRM_C_USERNAME:test-law-firm-c-username"
        "TEST_LAW_FIRM_C_PASSWORD:test-law-firm-c-password"
        "TEST_ADMINOFFICER_USERNAME:test-adminofficer-username"
        "TEST_ADMINOFFICER_PASSWORD:test-adminofficer-password"
        "TEST_HOMEOFFICE_APC_USERNAME:test-homeoffice-apc-username"
        "TEST_HOMEOFFICE_APC_PASSWORD:test-homeoffice-apc-password"
        "TEST_HOMEOFFICE_LART_USERNAME:test-homeoffice-lart-username"
        "TEST_HOMEOFFICE_LART_PASSWORD:test-homeoffice-lart-password"
        "TEST_HOMEOFFICE_POU_USERNAME:test-homeoffice-pou-username"
        "TEST_HOMEOFFICE_POU_PASSWORD:test-homeoffice-pou-password"
        "TEST_HOMEOFFICE_GENERIC_USERNAME:test-homeoffice-generic-username"
        "TEST_HOMEOFFICE_GENERIC_PASSWORD:test-homeoffice-generic-password"
        "TEST_HOMEOFFICE_BAILS_USERNAME:test-homeoffice-bail-username"
        "TEST_HOMEOFFICE_BAILS_PASSWORD:test-homeoffice-bail-password"
        "TEST_LAW_FIRM_SHARE_CASE_A_USERNAME:test-law-firm-share-case-a-username"
        "TEST_LAW_FIRM_SHARE_CASE_B_PASSWORD:test-law-firm-share-case-b-password"
        "TEST_LAW_FIRM_SHARE_CASE_B_USERNAME:test-law-firm-share-case-b-username"
        "TEST_LAW_FIRM_SHARE_CASE_A_PASSWORD:test-law-firm-share-case-a-password"
        "TEST_LAW_FIRM_SHARE_CASE_C_USERNAME:test-law-firm-org-deleted-username"
        "TEST_LAW_FIRM_SHARE_CASE_C_PASSWORD:test-law-firm-org-deleted-password"
        "TEST_LAW_FIRM_ORG_SUCCESS_USERNAME:test-law-firm-org-success-username"
        "TEST_LAW_FIRM_ORG_SUCCESS_PASSWORD:test-law-firm-org-success-password"
        "TEST_JUDGE_X_USERNAME:test-judge-x-username"
        "TEST_JUDGE_X_PASSWORD:test-judge-x-password"
        "TEST_ADMINOFFICER_BAILS_USERNAME:test-adminofficer-bails-username"
        "TEST_ADMINOFFICER_BAILS_PASSWORD:test-adminofficer-bails-password"
        "TEST_JUDGE_X_BAILS_USERNAME:test-judge-bails-username"
        "TEST_JUDGE_X_BAILS_PASSWORD:test-judge-bails-password"
        "TEST_LAW_FIRM_SHARE_CASE_A_BAILS_USERNAME:test-law-firm-noc-a-bails-username"
        "TEST_LAW_FIRM_SHARE_CASE_A_BAILS_PASSWORD:test-law-firm-noc-a-bails-password"
        "TEST_LAW_FIRM_SHARE_CASE_B_BAILS_USERNAME:test-law-firm-noc-b-bails-username"
        "TEST_LAW_FIRM_SHARE_CASE_B_BAILS_PASSWORD:test-law-firm-noc-b-bails-password"
        # Add more entries as needed
    )

    echo "Retrieving the secrets from vault: ${vault_name}"
    for entry in "${secrets[@]}"; do
      env_var_name=$(echo $entry | cut -d ':' -f 1)
      secret_name=$(echo $entry | cut -d ':' -f 2)

      get_secret_value $secret_name $vault_name

      if [ -n "$secret_value" ]; then
        # Set environment variable
        export $env_var_name="${secret_value}"
        echo "Environment variable $env_var_name set to: $secret_value"
      else
        echo "ERROR: Either Secret: $secret_name does not exist in Azure Key Vault: ${vault_name} or it has no associated value."
      fi
    done