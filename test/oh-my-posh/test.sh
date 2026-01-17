#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'oh-my-posh' feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "oh-my-posh": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in
# the Feature's 'devcontainer-feature.json'.
# For the 'oh-my-posh' feature, that means the default version is 'latest',
# theme is empty, installForBash is 'true', and installForZsh is 'false'.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
#
# This test can be run with the following command:
#
#    devcontainer features test \
#               --features oh-my-posh \
#               --remote-user root \
#               --skip-scenarios \
#               --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#               /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version
check "oh-my-posh can execute" oh-my-posh version

# Check if bash configuration exists (default is true)
check "bash configuration exists" grep -q "oh-my-posh init bash" ~/.bashrc

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
