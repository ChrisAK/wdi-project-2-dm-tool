#!/bin/bash

API="${API_ORIGIN:-https://dm-tool-api.herokuapp.com/}"
URL_PATH="/campaigns"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "campaign": {
      "name": "'"${NAME}"'",
      "scheduled_day": "'"${DAY}"'",
      "user_id": "'"${USER}"'"
    }
  }'

echo
