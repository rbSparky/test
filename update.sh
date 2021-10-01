#!/bin/bash

current_version="v0.0"
new_version=$(git -c 'versionsort.suffix=-' \
    ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/swig/swig/ '*.*.*' \
    | tail --lines=1 \
		| cut --delimiter='/' --fields=3)
		
if [ $new_version == $current_version ]; then
	echo "Up to date with $current_version"	
else
	echo "Update to $new_version"
	gh auth login 
	gh pr create --title "$new_version" --body ""	
	#gh pr create --project "test"
fi


