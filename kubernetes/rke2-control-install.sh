#!/bin/sh

if (( $EUID != 0 )); then
    echo "You must run this script as root."
fi

systemctl disable --now ufw

apt update
apt install nfs-common open-iscsi -y
apt upgrade -y
apt autoremove -y

curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=server sh -

systemctl enable rke2-server.service
systemctl start rke2-server.service

ln -s $(find /var/lib/rancher/rke2/data/ -name kubectl) /usr/local/bin/kubectl
export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
echo "export KUBECONFIG=/etc/rancher/rke2/rke2.yaml" | tee -a ~/.bashrc
source ~/.bashrc

echo "----------"
echo "Server has started."
echo "Below is your server key. Pass the output into the rke2-worker-install.sh script as the second argument."
echo "$(cat /var/lib/rancher/rke2/server/node-token)"
echo "The key can also be found at /var/lib/rancher/rke2/server/node-token"
echo "----------"


