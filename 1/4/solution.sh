#!/bin/bash

# first terminal
docker run -it ubuntu
sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'

# second terminal
docker exec d2341eafa603
apt-get update
apt-get -y install curl