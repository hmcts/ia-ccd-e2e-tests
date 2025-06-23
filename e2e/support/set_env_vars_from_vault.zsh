#!/bin/zsh

if [ -z "$1" ]; then
  echo "Missing environment. Usage: $0 <environment>"
  exit 1
fi

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
    local vault_name="ia-$1"
    local jenkins_file="Jenkinsfile_nightly"

    # Extract lines containing secret(...) and loop through them
    grep -o "secret([^)]\+)" $jenkins_file | while read -r line; do
      # Extract secret name and env var name using pattern matching
      local unquoted=$(echo $line | sed -r 's/secret//' | sed -r 's/\(//' | sed -r 's/\)//' | sed -r 's/, /,/' | sed -r "s/[\'\"]//" | sed -r "s/[\'\"]//" | sed -r "s/[\'\"]//" | sed -r "s/[\'\"]//")
      local parts=("${(@s/,/)unquoted}")
      local secret_name=$parts[1]
      local env_var_name=$parts[2]

      echo "Fetching $env_var_name from Key Vault..."
      local secret_value=$(get_secret_value $secret_name $vault_name)

      if [[ -z "$secret_value" ]]; then
        echo "Warning: Could not fetch secret for $secret_name"
      else
        export $env_var_name="$secret_value"
        echo "Environment variable $env_var_name set to: $secret_value"
      fi
    done
  export TEST_E2E_URL_WEB="https://manage-case.$1.platform.hmcts.net"
  export RETRIES=0
  export TEST_E2E_URL_GATEWAY="https://gateway-ccd.$1.platform.hmcts.net"
  export TEST_E2E_NUM_BROWSERS=1
  export TEST_E2E_WAIT_FOR_ANGULAR=false
  export TEST_E2E_FAIL_FAST=false
  export TEST_E2E_HEADLESS=false
}

# Execute main function
main "$@"
