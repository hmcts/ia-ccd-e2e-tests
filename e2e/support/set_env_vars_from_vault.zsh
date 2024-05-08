#!/bin/zsh

# Function to retrieve secret value from Azure Key Vault
get_secret_value() {
    local secret_name=$1
    local vault_name=$2
    local json_output=$(az keyvault secret show --name $secret_name --vault-name $vault_name)
    local secret_value=$(echo $json_output | jq -r '.value')
    echo $secret_value
}

# Main script
main() {
    # Define list of secret names and environment variable names
    local -a secrets=(
        "TEST_E2E_HEADLESS:false"
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

    local vault_name="$1"

    # Loop through each entry in the secrets list
    for entry in "${secrets[@]}"; do
        local env_var_name=$(echo $entry | cut -d ':' -f 1)
        local secret_name=$(echo $entry | cut -d ':' -f 2)

        # Retrieve secret value
        local secret_value=$(get_secret_value $secret_name $vault_name)

        # Check if secret value is not empty
        if [ -n "$secret_value" ]; then
            # Set environment variable
            export $env_var_name="$secret_value"
            echo "Environment variable $env_var_name set to: $secret_value"
        else
            echo "Failed to retrieve secret value for $secret_name from Azure Key Vault."
        fi
    done
}

# Execute main function
main "$@"
