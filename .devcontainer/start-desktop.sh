#!/usr/bin/env bash
set -x

for i in $(seq 1 30); do
  docker info >/dev/null 2>&1 && break
  sleep 2
done

IMAGE="lscr.io/linuxserver/webtop:ubuntu-kde"

if [ "$(docker ps -q -f name=^ubuntu-desktop$)" ]; then
  :
elif [ "$(docker ps -aq -f name=^ubuntu-desktop$)" ]; then
  docker start ubuntu-desktop
else
  docker run -d --name ubuntu-desktop -p 3000:3000 -p 3001:3001 --shm-size=1gb --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC --restart unless-stopped "$IMAGE"
fi

echo "Ubuntu desktop is starting on port 3000. Open the Ports tab, find port 3000, and click the globe icon to open it in the browser."
