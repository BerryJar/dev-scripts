#!/bin/bash

if (( $EUID != 0)); then
    echo "You must run this script as root."
fi

FQDN="$1"
TOKEN="$2"

echo "IP entered: $FQDN"
echo "Token entered: $TOKEN"

systemctl disable --now ufw
apt update
apt install nfs-common -y open-iscsi
apt upgrade -y
apt autoremove -y

curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=agent sh -
mkdir -p /etc/rancher/rke2/
echo "server: https://$FQDN:9345" >> /etc/rancher/rke2/config.yaml
echo "token: $TOKEN" >> /etc/rancher/rke2/config.yaml
systemctl enable rke2-agent.service
systemctl start rke2-agent.service
systemctl status rke2-agent.service


