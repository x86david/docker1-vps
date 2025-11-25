#!/bin/bash
set -e

# Create runner folder
mkdir -p ~/actions-runner && cd ~/actions-runner

# Download runner package (v2.329.0)
curl -o actions-runner-linux-x64-2.329.0.tar.gz -L \
https://github.com/actions/runner/releases/download/v2.329.0/actions-runner-linux-x64-2.329.0.tar.gz

# Optional: validate hash
echo "194f1e1e4bd02f80b7e9633fc546084d8d4e19f3928a324d512ea53430102e1d  actions-runner-linux-x64-2.329.0.tar.gz" | shasum -a 256 -c

# Extract
tar xzf ./actions-runner-linux-x64-2.329.0.tar.gz

# Automatically install missing dependencies for .NET Core
sudo ./bin/installdependencies.sh

# Configure runner (replace URL and TOKEN with your own)
./config.sh --url https://github.com/x86david/docker1-vps \
            --token AVWZPXZSX4LWB7TH3QPJH4DJEWVYC \
            --labels docker1

# Install and start runner as a service
sudo ./svc.sh install
sudo ./svc.sh start

echo "✅ GitHub Actions runner installed and running with label 'docker1'."
echo "Target it in workflows using: runs-on: [self-hosted, docker1]"
