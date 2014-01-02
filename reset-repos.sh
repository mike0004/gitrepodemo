#!/bin/bash

#export BASE=~/temp/sandbox
#mkdir -p $BASE
#cd $BASE
rm -rf wd1 && mkdir wd1
rm -rf wd2 && mkdir wd2
rm -rf sandboxrepo


cp -r sandboxrepo-template sandboxrepo

cd sandboxrepo

git init
git config --local user.name root
git config --local user.email root
git add .
git commit -m "initial commit"

# create a branch
git checkout -b develop

# go back to master so workdirs can push to develop
git checkout master

# clone the repo
cd ..
git clone -b develop sandboxrepo wd1
git clone -b develop sandboxrepo wd2


# setup the usernames
cd wd1
git config --local user.name wd1
git config --local user.email wd1@wd1.com

cd ../wd2
git config --local user.name wd2
git config --local user.email wd2@wd2.com

# do something
#cd ../wd1
#echo `date` >> readme.md && git commit -am "wd1 updated readme `date`" && git push
