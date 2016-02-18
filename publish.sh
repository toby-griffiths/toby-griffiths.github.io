#!/bin/bash

# Script for publishing site to GitHub Pages
# Inspiration from: http://bit.ly/1KgQIKv

if [ $# -ne 1 ]; then
    echo "usage: ./publish.sh \"commit message\""
    exit 1;
fi

git commit -m "$1"
git push -u origin master

git checkout publish
git stash pop