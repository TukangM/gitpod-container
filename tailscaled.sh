#!/bin/bash

# Task: tailscaled
if [ -n "${TAILSCALE_STATE_MYPROJECT}" ]; then
  # Restore the tailscale state from gitpod user's env vars
  sudo mkdir -p /var/lib/tailscale
  echo "${TAILSCALE_STATE_MYPROJECT}" | sudo tee /var/lib/tailscale/tailscaled.state > /dev/null
fi
sudo tailscaled

# Task: tailscale
if [ -n "${TAILSCALE_STATE_MYPROJECT}" ]; then
  sudo -E tailscale up
else
  sudo -E tailscale up --hostname "gitpod-${GITPOD_GIT_USER_NAME// /-}-$(echo ${GITPOD_WORKSPACE_CONTEXT} | jq -r .repository.name)"
  # Store the tailscale state into gitpod user
  gp env TAILSCALE_STATE_MYPROJECT="$(sudo cat /var/lib/tailscale/tailscaled.state)"
fi
