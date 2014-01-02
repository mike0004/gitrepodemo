#!/bin/bash -x

BASEDIR=$PWD

function graphlog() {
	echo
	echo $PWD
	git --no-pager log --graph --pretty=oneline --abbrev-commit --decorate --all -5;
}
function simplelog() {
	git --no-pager log --pretty=oneline --abbrev-commit --decorate --all -5;
}
function wd1() {
	cd $BASEDIR/wd1;
	echo $PWD
}
function wd2() {
	cd $BASEDIR/wd2;
	echo $PWD
}
function pushfile() {
	echo $PWD
	touch $1
	git add .
	git commit -m "$1 $2"
	git push
}

# reset repo
./reset-repos.sh

# start setup 
wd1
git pull
git checkout -b develop
git push -u origin develop


wd2
git checkout develop
git pull
git checkout -b topic
git push -u origin topic


# do stuff

#wd1 put a file, wd2 put a file
wd1; pushfile wd1f2 examplewd1f2
wd2; pushfile wd2 examplewd2

# wd2 merge with develop
#wd2; git pull origin develop; git push
