#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# Check if bash configuration exists with URL theme
check "bash configuration with theme URL exists" grep -q "oh-my-posh init bash" ~/.bashrc
check "theme URL configuration exists" grep -q "https://raw.githubusercontent.com" ~/.bashrc

# Report result
reportResults
