#!/bin/bash

if [ -z "${GITLAB_CI}" ]; then
  echo "Not running during GitLab CI, exiting."
  exit 1
fi

cat << EOF > ~/.python-gitlab.cfg
[global]
default = current-ci-server

[current-ci-server]
url = ${CI_SERVER_URL}
private_token = $1
api_version = 4
EOF