#!/bin/bash

# sync.sh
# Uses the "rsync sync" command to sync files in $RSYNC_PATHS

# Internal Field Separator
IFS=','

# The RSYNC_SOURCE_PATHS env variable should be a comma separated string
read -ra array <<< "$RSYNC_SOURCE_PATHS"

# TODO: set up "rsync sync"
for element in "${array[@]}"; do
    echo "$element"
done

