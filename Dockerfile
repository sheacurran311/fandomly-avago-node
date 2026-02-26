FROM avaplatform/subnet-evm_avalanchego:v0.8.0-fuji_v1.14.0-fuji

# Create config directories
RUN mkdir -p /root/.avalanchego/configs/chains/hYf5BWtqT6MajJdGUCSYy5jxfWXR3iaci2fmoBx1JKE4hjJhV
RUN mkdir -p /root/.avalanchego/configs/vms

# Node config - track the Fandomly Testnet subnet
COPY node.json /root/.avalanchego/configs/node.json

# Chain config
COPY chain-config.json /root/.avalanchego/configs/chains/hYf5BWtqT6MajJdGUCSYy5jxfWXR3iaci2fmoBx1JKE4hjJhV/config.json

# Expose P2P and RPC ports
EXPOSE 9650 9651

# AvalancheGo starts automatically from the base image entrypoint
