FROM avaplatform/subnet-evm_avalanchego:v0.8.0-fuji_v1.14.0-fuji

# Create config directories
RUN mkdir -p /root/.avalanchego/configs/chains/Xw6RyupcvTsiJdnwc88U2rxt9RkacGbw2wHRJJD4H1sBu2z1H
RUN mkdir -p /root/.avalanchego/configs/vms

# Node config - track the Fandomly Chain subnet
COPY node.json /root/.avalanchego/configs/node.json

# Chain config
COPY chain-config.json /root/.avalanchego/configs/chains/Xw6RyupcvTsiJdnwc88U2rxt9RkacGbw2wHRJJD4H1sBu2z1H/config.json

# Expose P2P and RPC ports
EXPOSE 9650 9651

# Explicitly pass config file so avalanchego picks up fuji network-id
# Binary lives at /avalanchego/build/avalanchego (base image WORKDIR)
CMD ["./avalanchego", "--config-file=/root/.avalanchego/configs/node.json"]
