blog.tobyg.net
==============

A Sculpin based blog containing random thoughts on ethics, the environment and web development.

Powered by [Sculpin](http://sculpin.io). =)


Setting Up
----------

To get up and running, see the [Sculpin Getting Started Guide](https://sculpin.io/getstarted/)


Branches
--------

The branches are used as follows…

### master

Completely detached from the other branches, this is the branch that contains the published website files.  You should prepare site files as described below before switching to this branch to commit the files.


### publish

This branch contains all the files ready for publishing. You should branch from this branch to create articles, and then merge them back in once they're ready for publishing.
You should also merge the develop branch into this branch with changes to the site structure & functionality, once ready for publishing, then publish them as detailed below.


### develop

Use this branch to manage changes to the site structure or functionality. Create branches for each change, make the change & then merge them back into develop. Once ready to publish, merge the branch back into the publish branch before publishing, as detailed below.


### article/\<article-slug>

Create individual article branches when writing new articles, and merge them back into the publish branch when ready to publish (as detailed below)


Publishing
----------

When you're ready to publish the blog, run the `./prepare.sh` script.  This will prepare the production site files and 
stage then in git, ready for committing.

Once prepared, you should check the git status to ensure no unexpected files are going to be published. If all is ready, simply git commit the files to the `master` branch, and push to the GitHub repo, whereupon the live site will be updated. Alternatively, use the `./publish.sh` script which should all do this for you.