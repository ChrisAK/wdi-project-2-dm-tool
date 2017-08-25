#!/bin/bash

API="${API_ORIGIN:-https://dm-tool-api.herokuapp.com/}"
URL_PATH="/encounters"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "encounter": {
      "name": "'"${NAME}"'",
      "CR": "'"${CR}"'",
      "books": "'"${BOOKS}"'",
      "description": "'"${DESCRIPTION}"'",
      "campaign_id": "'"${CAMPAIGN}"'"
    }
  }'

echo
