#!/bin/bash
set -e

echo "Activating feature 'oh-my-posh'"

# Get options
VERSION=${VERSION:-latest}
THEME=${THEME:-""}
INSTALL_FOR_BASH=${INSTALLFORBASH:-true}
INSTALL_FOR_ZSH=${INSTALLFORZSH:-false}

echo "Installing Oh My Posh version: $VERSION"
echo "Theme: ${THEME:-none}"
echo "Install for bash: $INSTALL_FOR_BASH"
echo "Install for zsh: $INSTALL_FOR_ZSH"

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64)
        ARCH="amd64"
        ;;
    aarch64|arm64)
        ARCH="arm64"
        ;;
    armv7l)
        ARCH="arm"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# Install Oh My Posh
echo "Installing Oh My Posh for $ARCH..."
if [ "$VERSION" = "latest" ]; then
    curl -s https://ohmyposh.dev/install.sh | bash -s
else
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -v $VERSION
fi

# Ensure oh-my-posh is in PATH
export PATH=$PATH:/usr/local/bin

# Configure theme if provided
THEME_CONFIG=""
if [ -n "$THEME" ]; then
    echo "Configuring theme: $THEME"
    
    # Check if theme is a URL
    if [[ "$THEME" =~ ^https?:// ]]; then
        echo "Theme is a URL, will use directly"
        THEME_CONFIG="--config '$THEME'"
    # Check if theme is a file path
    elif [[ "$THEME" =~ ^[./~] ]] || [[ "$THEME" =~ ^/ ]]; then
        echo "Theme is a file path, will use directly"
        THEME_CONFIG="--config '$THEME'"
    else
        # Assume it's a built-in theme name
        echo "Theme is a built-in theme name"
        THEME_CONFIG="--config \$(oh-my-posh cache path)/themes/${THEME}.omp.json"
    fi
fi

# Configure for bash
if [ "$INSTALL_FOR_BASH" = "true" ]; then
    echo "Configuring Oh My Posh for bash..."
    
    BASH_RC="${_REMOTE_USER_HOME}/.bashrc"
    if [ "$_REMOTE_USER" != "root" ]; then
        BASH_RC="${_REMOTE_USER_HOME}/.bashrc"
    fi
    
    # Add Oh My Posh initialization to bashrc
    cat >> "$BASH_RC" << 'EOF'

# Oh My Posh configuration
EOF
    
    if [ -n "$THEME_CONFIG" ]; then
        echo "eval \"\$(oh-my-posh init bash $THEME_CONFIG)\"" >> "$BASH_RC"
    else
        echo "eval \"\$(oh-my-posh init bash)\"" >> "$BASH_RC"
    fi
    
    # Set proper ownership
    if [ "$_REMOTE_USER" != "root" ]; then
        chown $_REMOTE_USER:$_REMOTE_USER "$BASH_RC"
    fi
    
    echo "Oh My Posh configured for bash"
fi

# Configure for zsh
if [ "$INSTALL_FOR_ZSH" = "true" ]; then
    echo "Configuring Oh My Posh for zsh..."
    
    ZSH_RC="${_REMOTE_USER_HOME}/.zshrc"
    if [ "$_REMOTE_USER" != "root" ]; then
        ZSH_RC="${_REMOTE_USER_HOME}/.zshrc"
    fi
    
    # Create .zshrc if it doesn't exist
    touch "$ZSH_RC"
    
    # Add Oh My Posh initialization to zshrc
    cat >> "$ZSH_RC" << 'EOF'

# Oh My Posh configuration
EOF
    
    if [ -n "$THEME_CONFIG" ]; then
        echo "eval \"\$(oh-my-posh init zsh $THEME_CONFIG)\"" >> "$ZSH_RC"
    else
        echo "eval \"\$(oh-my-posh init zsh)\"" >> "$ZSH_RC"
    fi
    
    # Set proper ownership
    if [ "$_REMOTE_USER" != "root" ]; then
        chown $_REMOTE_USER:$_REMOTE_USER "$ZSH_RC"
    fi
    
    echo "Oh My Posh configured for zsh"
fi

echo "Oh My Posh installation complete!"
echo "Note: You may need to reload your shell or restart the container for changes to take effect"
