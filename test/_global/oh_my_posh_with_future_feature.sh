#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'oh_my_posh_with_future_feature' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
#
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

echo -e "The result of the 'oh-my-posh' command will be:\n"
oh-my-posh version
echo -e "\n"

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "oh-my-posh is installed" which oh-my-posh
check "oh-my-posh version" oh-my-posh --version

# TODO: When you add more features, test them together here
# Example:
# echo -e "The result of the 'another-feature' command will be:\n"
# another-feature
# check "another-feature works with oh-my-posh" bash -c "some-command"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
