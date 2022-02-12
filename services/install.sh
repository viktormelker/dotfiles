#!/usr/bin/env bash

sudo cp gcloud-auth.service /etc/systemd/system
sudo cp gcloud-auth.sh /usr/local/bin/

sudo systemctl enable gcloud-auth.service
