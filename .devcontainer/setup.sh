#!/bin/bash
set -x

# Docker takes a moment to come up inside the codespace, wait for it.
for i in $(seq 1 30); do
  docker info >/dev/null 2>&1 && break
  sleep 2
done

sudo apt-get update
sudo apt-get install -y nano tree htop

curl -sL -o /tmp/fastfetch.deb https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb
if sudo apt-get install -y /tmp/fastfetch.deb; then
  echo "fastfetch installed"
else
  sudo apt-get install -y neofetch
fi

docker pull hello-world || true
docker pull nginx:alpine || true
