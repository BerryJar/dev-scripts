#!/bin/bash

# Change directory to the dev scripts folder and run start_fws_db.sh
cd "$DEVSCRIPTSDIR"
bash ./start_fws_db.sh
echo "Started database"

# Change directory to MultiMC folder and run the MultiMC executable
cd "$MULTIMCDIR"
./MultiMC &
echo "Started MultiMC"

# Change directory to fws dev folder and run star.sh
cd "$DEVSERVERDIR"
./start.sh &
echo "Started dev server"
