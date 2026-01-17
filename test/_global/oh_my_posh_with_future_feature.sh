#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the scenarios defined in the tests/_global/scenarios.json file.
#
# Scenarios are useful for testing specific options in a feature, or to test a
# combination of multiple features working together.
#
# This test can be run with the following command (from the root of this repo):
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

echo "Testing Oh My Posh feature..."

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# TODO: Add more tests here when combining multiple features
# Example:
# check "feature1 works with feature2" bash -c "some-command"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
