#!/bin/bash

# Internal Field Separator
IFS=','

# The RSYNC_PATHS env variable should be a comma separated string
read -ra array <<< "$RSYNC_PATHS"

for element in "${array[@]}"; do
    echo "$element"
done

