#!/bin/bash

if [ -z "${DEVSCRIPTSDIR}" ] || [ -z "${MULTIMCDIR}" ] || [ -z "${DEVSERVERDIR}" ]; then
    echo "Error: One or more required environment variables are not set."
    [ -z "${DEVSCRIPTSDIR}" ] && echo "DEVSCRIPTSDIR is not set."
    [ -z "${MULTIMCDIR}" ] && echo "MULTIMCDIR is not set."
    [ -z "${DEVSERVERDIR}" ] && echo "DEVSERVERDIR is not set."
    exit 1
fi

# Change directory to the dev scripts folder and run start_fws_db.sh
cd "$DEVSCRIPTSDIR"
bash ./start_fws_db.sh
echo "Started database."

# Change directory to MultiMC folder and run the MultiMC executable
cd "$MULTIMCDIR"
./MultiMC &
echo "Started MultiMC."

# Change directory to fws dev folder and run start.sh
cd "$DEVSERVERDIR"
./start.sh &
echo "Started dev server."
