#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version
check "oh-my-posh can run" oh-my-posh version

# Check if bash configuration exists (default is true)
if [ "$INSTALLFORBASH" = "true" ]; then
    check "bash configuration exists" grep -q "oh-my-posh init bash" ~/.bashrc
fi

# Check if zsh configuration exists
if [ "$INSTALLFORZSH" = "true" ]; then
    check "zsh configuration exists" grep -q "oh-my-posh init zsh" ~/.zshrc
fi

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
