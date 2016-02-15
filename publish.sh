#!/bin/bash

# Script for publishing site to GitHub Pages
# Source: http://bit.ly/1KgQIKv

if [ $# -ne 1 ]; then
    echo "usage: ./publish.sh \"commit message\""
    exit 1;
fi

git stash
git checkout publish

sculpin generate --env=prod

git checkout --orphan master

# Remove everything but the published files
find . -maxdepth 1 -type f ! -iname "output_prod" --delete

cp -R output_prod/* .
rm -rf output_*

echo "blog.tobyg.net" > CNAME

git add *
git commit -m "$1"
git push -u origin master

git checkout publish
git stash pop