#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'oh-my-posh' feature with theme URL option.

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# Check if bash configuration exists with theme
check "bash configuration with theme exists" grep -q "oh-my-posh init bash" ~/.bashrc
check "theme configuration exists" grep -q "jandedobbeleer.omp.json" ~/.bashrc

# Report result
reportResults
