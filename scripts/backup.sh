#!/bin/bash

BACKUP_DIR="/home/steam/palworld-server/backups"
mkdir -p $BACKUP_DIR

while true; do
    player_count=$(echo "ShowPlayers" | nc localhost ${RCON_PORT} | grep -c "PlayerUID")
    
    if [ "$player_count" -eq 0 ]; then
        timestamp=$(date +%Y%m%d_%H%M%S)
        tar -czf "$BACKUP_DIR/palworld_backup_$timestamp.tar.gz" -C /home/steam/palworld-server Saved/
        
        # Keep only last 5 backups
        ls -t $BACKUP_DIR/palworld_backup_*.tar.gz | tail -n +6 | xargs -r rm
    fi
    
    sleep 7200  # Backup check every 2 hours
done
