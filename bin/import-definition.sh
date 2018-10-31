#!/usr/bin/env bash

set -o nounset

if [[ -z "${CCD_DOCKER_PATH}" ]]; then
    echo "CCD_DOCKER_PATH must be defined in the environment" 1>&2
    exit 1
fi

if [ -z "${1}" ]
  then
    echo "Usage: import-definition.sh /path/to/definition/spreadsheet"
    exit 1
elif [ ! -f "$1" ]
  then
    echo "File not found: $1"
    exit 1
fi

CCD_DEFINITION_STORE_API_IS_RUNNING=false
(exec 6<>/dev/tcp/127.0.0.1/4451) &>/dev/null && CCD_DEFINITION_STORE_API_IS_RUNNING=true || echo "ERROR: CCD Definition Store API is not running" 1>&2
exec 6>&- # close output connection
exec 6<&- # close input connection

${CCD_DEFINITION_STORE_API_IS_RUNNING} || exit 1

USER_TOKEN="$(${CCD_DOCKER_PATH}/bin/idam-user-token.sh)"
SERVICE_TOKEN="$(${CCD_DOCKER_PATH}/bin/idam-service-token.sh)"

curl --silent \
  http://127.0.0.1:4451/import \
  -H "Authorization: Bearer ${USER_TOKEN}" \
  -H "ServiceAuthorization: Bearer ${SERVICE_TOKEN}" \
  -F file="@${1}"
