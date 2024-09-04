#!/bin/sh

run_kubectl=false

while getopts ":n": opt; do
    case $opt in
        nc)
            run_kubectl=true
            ;;
        /?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

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

echo "----------"
echo "Below is your server key. Pass the output into the rke2-worker-install.sh script as the second argument.
echo "$(cat /var/lib/rancher/rke2/server/node-token)"
echo "The key can also be found at /var/lib/rancher/rke2/server/node-token"
echo "----------"

if $run_kubectl; then
    kubectl get node -o wide
fi

