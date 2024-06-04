FROM gitpod/workspace-full

RUN curl -fsSL https://tailscale.com/install.sh | sh \
     && sudo apt-get update -q \
     && sudo apt-get install -yq tailscale jq \
     && sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-nft