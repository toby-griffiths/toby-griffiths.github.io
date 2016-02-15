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
git reset

echo "Do the rest manually"

exit 0;

# Remove everything but the published files
mv output_prod /tmp/output_prod
rm -rf *

mv -R /tmp/output_prod/* .
rm -rf /tmp/output_prod

echo "blog.tobyg.net" > CNAME

git add *
git commit -m "$1"
git push -u origin master

git checkout publish
git stash pop