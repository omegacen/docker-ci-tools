#!/bin/sh

# Propagate GitLab CI variables to Git.
if [ -n "${GITLAB_USER_EMAIL}" ]; then
    git config --global user.email "${GITLAB_USER_EMAIL}"
fi
if [ -n "${GITLAB_USER_NAME}" ]; then
    git config --global user.name "${GITLAB_USER_NAME}"
fi

# Set python-gitlab configuration.
if [ -n "${GITLAB_CI}" ]; then
  cat << EOF > ~/.python-gitlab.cfg
[global]
default = current-ci-server

[current-ci-server]
url = ${CI_SERVER_URL}
job_token = ${CI_JOB_TOKEN}
api_version = 4
EOF
fi

# Run whatever the user wants to.
exec "$@"