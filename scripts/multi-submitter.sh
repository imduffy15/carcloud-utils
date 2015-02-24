#!/usr/bin/env sh

if [ $# -lt 2 ]
  then
    echo "No arguments supplied"
    echo "Usage: multi-submitter.sh <url to POST to> <folder containing processed files>"
    exit 1
fi

echo "POSTing to $1"
echo "Using files within $2"

for file in $2/*
do
    echo "POSTing $file"
    FILE_CONTENTS="$(cat "$file")"
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null "$1" -H 'Content-Type: application/json' --data-binary "$FILE_CONTENTS")
    if [ "$response" -ne 200 ]
        then
            echo "#### FAIL ####"
            echo "FILENAME: $file"
            echo "#### FILE CONTENTS ####"
            echo "$FILE_CONTENTS"
    fi
    echo
done

