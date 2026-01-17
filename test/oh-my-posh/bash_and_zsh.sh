#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# Check if bash configuration exists
check "bash configuration exists" grep -q "oh-my-posh init bash" ~/.bashrc

# Check if zsh configuration exists
check "zsh configuration exists" grep -q "oh-my-posh init zsh" ~/.zshrc

# Report result
reportResults
