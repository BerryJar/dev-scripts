#!/bin/bash

if [ -z "$IDEADIR" ]; then
    echo "Error: IDEADIR environment variable is not set."
    exit 1
fi

cd "$IDEADIR" || { echo "Error: Unable to change directory to $IDEADIR"; exit 1;}

# Check if the lock file exists
if [ -f ".lock" ]; then
    # Attempt to remove the lock file
    rm -f .lock
    
    # Check if the removal was successful
    if [ -f ".lock" ]; then
        echo "Delete failed: Unable to remove .lock file."
    else
        echo "Delete succeeded: .lock file has been removed."
    fi
else
    echo "No .lock file found. There is no file to delete."
fi

