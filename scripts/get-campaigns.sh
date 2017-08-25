#!/bin/bash

API="${API_ORIGIN:-https://dm-tool-api.herokuapp.com/}"
URL_PATH="/campaigns"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
