#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'oh-my-posh' feature with a specific version.

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# Check if bash configuration exists
check "bash configuration exists" grep -q "oh-my-posh init bash" ~/.bashrc

# Report result
reportResults
