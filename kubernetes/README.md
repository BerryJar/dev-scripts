# Usage Guide

### Control Node

1. Clone the repo to the control node.
2. Set executable with `chmod +x rke2-control-install.sh`.
3. Run with `./rke2-control-install.sh`.
4. Allow the script to run. When the script is finished, you will see a print-out containing your token.
5. Grab the control node IP address and the token to use for the next script.

### Worker Node

1. Clone the repo to each worker node you'd like to add.
2. Set executable with `chmod +x rke2-worker-install.sh.`
3. Run with `./rke2-worker-install.sh "control-node-ip" "server-token"`. The arguments must be passed in quotations. The `control-node-ip` can be either an IP address or a fully-qualified domain name.

Your cluster should now be up and running. Just run the `rke2-worker-install.sh` script on each worker node you'd like to add. You will also need to re-enable the firewall before you bring the cluster to production.

