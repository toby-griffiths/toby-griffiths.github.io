#!/bin/bash

# Script for preparing site for publishing to GitHub Pages
# Inspiration from: http://bit.ly/1KgQIKv

git stash
git checkout publish

sculpin generate --env=prod

git checkout master

cp -R output_prod/* .
rm -rf  output_prod

git add *

echo
echo "********************************************************************************"
echo "* Site prepared for publishing                                                 *"
echo "********************************************************************************"
echo "* You should now check the new site files for anything that shouldn't be there *"
echo "* and once ready, run the publish.sh script                                    *"
echo "********************************************************************************"
echo