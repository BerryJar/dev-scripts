#!/bin/bash

# Check if at least one argument (port) is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <port> <container> [path]"
    exit 1
fi

PORT=$1
CONTAINER=${2:-"default_container_name"}

# Function to enable Tailscale serve
enable_tailscale_serve() {
    if [ -n "$3" ]; then
        tailscale serve --bg http=$1 $3
    else
        tailscale serve --bg http=$1 
    end
}

# Function to disable Tailscale serve
disable_tailscale_serve() {
    if [ -n "$2" ]; then
        tailscale serve --bg http=$1 $3 off
    else
        tailscale serve --bg http=$1 off
    end
}

# Disable Tailscale serve
echo "Disabling Tailscale serve on port $PORT"
tailscale serve --bg http=$PORT 

# Restart Docker container
echo "Restarting Docker container: $CONTAINER"
docker restart $CONTAINER

# Wait for container to be up (adjust sleep time as needed)
sleep 10

# Re-enable Tailscale serve
echo "Re-enabling Tailscale serve on port $PORT"
enable_tailscale_serve

echo "Operation completed successfully"
