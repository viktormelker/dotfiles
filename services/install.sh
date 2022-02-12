#!/usr/bin/env bash

sudo cp ath11k-resume.service /etc/systemd/system
sudo cp ath11k-suspend.service /etc/systemd/system
sudo systemctl enable ath11k-resume.service
sudo systemctl enable ath11k-suspend.service

sudo cp gcloud-auth.service /etc/systemd/system
sudo cp gcloud-auth.sh /usr/local/bin/
sudo systemctl enable gcloud-auth.service
