FROM gitpod/workspace-full

RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.gpg | sudo apt-key add - \
     && sudo curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
     && sudo apt-get update -q \
     && sudo apt install tailscale \
     