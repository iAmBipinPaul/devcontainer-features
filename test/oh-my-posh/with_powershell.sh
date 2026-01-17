#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'oh-my-posh' feature with PowerShell support.

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# Check if PowerShell is installed
check "PowerShell is installed" which pwsh

# Check if PowerShell profile exists with Oh My Posh configuration
PWSH_PROFILE="$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
check "PowerShell profile exists" test -f "$PWSH_PROFILE"
check "PowerShell profile has oh-my-posh" grep -q "oh-my-posh init pwsh" "$PWSH_PROFILE"

# Report result
reportResults
