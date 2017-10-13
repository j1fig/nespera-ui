#!/bin/sh

DIR=$(dirname "$0")

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Removing existing files"
rm -rf docs/*

echo "Generating site"
hugo

echo "Publishing site"
git add --all
git commit -m "Publishing latest changes (publish.sh)"
git push origin master
