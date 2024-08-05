#!/bin/bash

source .env

# IGNORE_DIRS is a comma separated string which we convert into an array
IFS=',' read -ra ignore_dirs_arr <<< $IGNORE_DIRS

# use an associate array to list out directories to ignore
declare -A ignore_dirs
for dir in "${ignore_dirs_arr[@]}"; do
    ignore_dirs["$dir"]=1
done

for dir in $RCLONE_SOURCE_PATH*/; do
    # remove tailing backslash
    new_dir="${dir%*/}"

    # retrieve directory name after the final backslash
    dir_name="${new_dir##*/}"

    # only sync directories that aren't ignored
    if [[ ! -v ignore_dirs["$dir_name"] ]]; then
	source="$dir"
	dest="$RCLONE_DEST_PATH$dir_name"
	
	# TODO: set up dry run arg for script
	rclone sync -v --exclude ".**" $source $dest
    fi
done

