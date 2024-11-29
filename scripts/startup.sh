#!/bin/bash
# startup.sh

/home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/palworld-server +login anonymous +app_update 2394010 validate +quit

/scripts/backup.sh &
/scripts/update.sh &

cd /home/steam/palworld-server
./PalServer.sh -port=8211 -players=32 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -rcon -rconport=${RCON_PORT} -rconpassword=${RCON_PASSWORD}
