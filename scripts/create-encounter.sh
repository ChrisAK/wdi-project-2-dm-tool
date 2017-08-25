#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/encounters"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
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
