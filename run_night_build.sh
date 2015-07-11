#!/bin/bash

_project='TatyanaLetschenok/mytestrep'
_branch='master'
_circle_token='7fae830c12b1b7349490b3dee8095ed311e409df'

trigger_build_url=https://circleci.com/api/v1/project/${_project}/tree/${_branch}?circle-token=${_circle_token}

post_data=$(cat <<EOF
{
  "build_parameters": {
    "RUN_NIGHTLY_BUILD": "true"
  }
}
EOF)

curl \
--header "Accept: application/json" \
--header "Content-Type: application/json" \
--data "${post_data}" \
--request POST ${trigger_build_url}
