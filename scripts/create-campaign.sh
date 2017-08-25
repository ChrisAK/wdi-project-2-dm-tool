#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/campaigns"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "campaign": {
      "name": "'"${NAME}"'",
      "scheduled_day": "'"${DAY}"'",
      "user_id": "'"${USER}"'"
    }
  }'

echo
