#!/usr/bin/env sh

if [ $# -lt 2 ]
  then
    echo "No arguments supplied"
    echo "Usage: cleanse.sh <folder containing files to process> <folder to save output in>"
    exit 1
fi

echo "Processing files within $1"
echo "Saving output to $2"

mkdir -p "$2"

for file in $1/*
do
    echo "Processing $file"
    filename=$(basename "$file")
    echo "$filename"
    tac "$file" | egrep -m 1 . | python -m json.tool > "$2/$filename"
done

