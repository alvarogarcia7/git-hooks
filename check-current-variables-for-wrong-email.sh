#!/bin/bash

set -euf -o pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 forbidden_email"
    exit 126 # 126 = Command invoked cannot execute
fi

set +e
wrong_properties=$(echo "$GIT_COMMITTER_EMAIL $GIT_AUTHOR_EMAIL"|grep "$1"|wc -l)
if [ $wrong_properties -gt 0 ]; then
  echo "there are wrong properties"
  exit 1
else
  echo "properties are OK"
  exit 0
fi
set -e
