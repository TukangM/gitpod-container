FROM gitpod/workspace-full

RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.gpg | apt-key add - \
    && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.list | sudo tee /etc/apt/sources.list.d/tailscale.list

RUN apt-get update -q \
    && apt-get install -y tailscale neofetch make cmake gcc
#RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.gpg | sudo apt-key add - \
#     && sudo curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
#     && sudo apt-get update -q \
#     && sudo apt install tailscale \
RUN if [ -n "${TAILSCALE_STATE_MYPROJECT}" ]; then
      sudo mkdir -p /var/lib/tailscale
      echo "${TAILSCALE_STATE_MYPROJECT}" | sudo tee /var/lib/tailscale/tailscaled.state > /dev/null
    fi
    sudo tailscaled

RUN if [ -n "${TAILSCALE_STATE_MYPROJECT}" ]; then
      sudo -E tailscale up
    else
      sudo -E tailscale up --hostname "gitpod-${GITPOD_GIT_USER_NAME// /-}-$(echo ${GITPOD_WORKSPACE_CONTEXT} | jq -r .repository.name)"
      # store the tailscale state into gitpod user
      gp env TAILSCALE_STATE_MYPROJECT="$(sudo cat /var/lib/tailscale/tailscaled.state)"
    fi 