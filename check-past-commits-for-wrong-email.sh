#!/bin/bash

set -euf -o pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 forbidden_email"
    exit 126 # 126 = Command invoked cannot execute
fi

set +e
lines_with_wrong_email=$(git log --format="%aE %cE"|grep "$1"|wc -l)
set -e

if [ $lines_with_wrong_email -gt 0 ];then
    echo "there are [past] commits with wrong email"
    exit 1
else
    echo "no [past] commits with wrong email";
    exit 0
fi
