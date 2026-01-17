# Oh My Posh (oh-my-posh)

Installs [Oh My Posh](https://ohmyposh.dev/) - a prompt theme engine for any shell that can be configured to display useful information in your terminal prompt.

## Example Usage

```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of Oh My Posh to install | string | latest |
| theme | Theme to use - can be a built-in theme name, URL, or file path | string | "" |
| installForBash | Configure Oh My Posh for bash shell | boolean | true |
| installForZsh | Configure Oh My Posh for zsh shell | boolean | false |

## Theme Configuration

The `theme` option is flexible and accepts three types of values:

### 1. Built-in Theme Name
Use any of the [official Oh My Posh themes](https://ohmyposh.dev/docs/themes):
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "jandedobbeleer"
    }
}
```

### 2. Theme URL
Provide a direct URL to a theme configuration file:
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json"
    }
}
```

### 3. File Path
Reference a theme file in your repository:
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "/workspaces/myproject/.devcontainer/my-theme.omp.json"
    }
}
```

## Examples

### Basic Installation (Default Theme)
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {}
}
```

### With Built-in Theme
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "atomic"
    }
}
```

### With Custom Theme URL
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/night-owl.omp.json"
    }
}
```

### For Both Bash and Zsh
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "jandedobbeleer",
        "installForBash": true,
        "installForZsh": true
    }
}
```

### Specific Version
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "version": "latest",
        "theme": "paradox"
    }
}
```

## Notes

- After installation, you may need to reload your shell or restart the container for changes to take effect
- The feature automatically detects your system architecture (amd64, arm64, arm)
- Built-in themes are cached locally for faster loading
- Custom themes via URL or file path are loaded directly

## Resources

- [Oh My Posh Documentation](https://ohmyposh.dev/docs)
- [Oh My Posh Themes](https://ohmyposh.dev/docs/themes)
- [Creating Custom Themes](https://ohmyposh.dev/docs/configuration/overview)
