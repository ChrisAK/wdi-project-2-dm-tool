#!/bin/bash

API="${API_ORIGIN:-https://dm-tool-api.herokuapp.com/}"
URL_PATH="/users"
curl "${API}${URL_PATH}/$ID" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
