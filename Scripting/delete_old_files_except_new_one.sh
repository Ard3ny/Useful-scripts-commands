#!/bin/bash

#Cleanup script that deletes all files that starts with year as a name and only leaves 2 newest ones
#script used for jira /org cleanup


# Set the directory path and the file name
dir="/dir/path"

# Get today's year
year=$(date +%Y)

# Set the file name using today's year
name="$year"

# Get the list of files in the directory with the specific name
files=($dir/$name*)

# Sort the list of files by modification time
sorted_files=($(ls -t "${files[@]}"))

# Delete all but the two newest files
for ((i=2; i<${#sorted_files[@]}; i++)); do
    rm "${sorted_files[i]}"
done
