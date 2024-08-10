#!/bin/bash

# Change directory to the dev scripts folder and run start_fws_db.sh
cd /home/z00d/Documents/Development/Minecraft/dev\ scripts
bash ./start_fws_db.sh
echo "Started database"

# Change directory to MultiMC folder and run the MultiMC executable
cd /home/z00d/Documents/Development/Minecraft/fws\ dev/MultiMC
./MultiMC &
echo "Started MultiMC"

# Change directory to fws dev folder and run star.sh
cd /home/z00d/Documents/Development/Minecraft/fws\ dev
./start.sh &
echo "Started dev server"
