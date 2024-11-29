#!/bin/bash

while true; do
    # Check for active players using RCON
    player_count=$(echo "ShowPlayers" | nc localhost ${RCON_PORT} | grep -c "PlayerUID")
    
    if [ "$player_count" -eq 0 ]; then
        echo "No players online, checking for updates..."
        /home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/palworld-server +login anonymous +app_update 2394010 +quit
    fi
    
    sleep 3600  # Check every hour
done
