#!/bin/bash

DIR=$(dirname "$0")

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Removing existing files"
rm -rf docs/*

echo "Generating site"
hugo 2>&1 >/dev/null

echo "Publishing site"
git add --all 2>&1 >/dev/null
git commit -m "Publishing latest changes (publish.sh)" 2>&1 >/dev/null
git push -q origin master 2>&1 >/dev/null
