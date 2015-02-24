#!/usr/bin/env sh

if [ $# -lt 2 ]
  then
    echo "No arguments supplied"
    echo "Usage: single-submitter.sh <url to POST to> <file to submit>"
    exit 1
fi

echo "POSTing to $1"
echo "Using file $2"

echo "POSTing $2"
FILE_CONTENTS="$(cat "$2")"
response=$(curl --write-out '%{http_code}' --silent --output /dev/null "$1" -H 'Content-Type: application/json' --data-binary "$FILE_CONTENTS")
if [ "$response" -ne 200 ]
    then
        echo "#### FAIL ####"
        echo "FILENAME: $2"
        echo "#### FILE CONTENTS ####"
        echo "$FILE_CONTENTS"
fi
echo

