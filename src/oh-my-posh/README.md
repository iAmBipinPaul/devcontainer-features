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
| theme | Theme URL or file path (see https://ohmyposh.dev/docs/themes) | string | "" |
| installForBash | Configure Oh My Posh for bash shell | boolean | true |
| installForZsh | Configure Oh My Posh for zsh shell | boolean | true |
| installForPwsh | Configure Oh My Posh for PowerShell (auto-skips if not installed) | boolean | true |

## Theme Configuration

The `theme` option accepts two types of values:

### 1. Theme URL
Provide a direct URL to a theme configuration file from the [official themes](https://ohmyposh.dev/docs/themes):
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json"
    }
}
```

### 2. File Path
Reference a theme file in your repository:
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "/workspaces/myproject/.devcontainer/my-theme.omp.json"
    }
}
```

**Find theme URLs:** Visit [https://ohmyposh.dev/docs/themes](https://ohmyposh.dev/docs/themes) to browse all available themes and copy their JSON URLs.

## Examples

### Basic Installation (No Theme)
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {}
}
```

### With Theme URL
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json"
    }
}
```

### With Custom Theme File
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "/workspaces/project/.devcontainer/custom-theme.omp.json"
    }
}
```

### Bash Only
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/paradox.omp.json",
        "installForZsh": false
    }
}
```

### Specific Version
```json
"features": {
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "version": "latest",
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/night-owl.omp.json"
    }
}
```

### With PowerShell
```json
"features": {
    "ghcr.io/devcontainers/features/powershell:1": {},
    "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
        "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json",
        "installForPwsh": true
    }
}
```
Note: Install PowerShell feature first for PowerShell support.

## Notes

- After installation, you may need to reload your shell or restart the container for changes to take effect
- The feature automatically detects your system architecture (amd64, arm64, arm)
- Theme must be provided as a URL or file path (theme names are not supported)
- Find theme URLs at [https://ohmyposh.dev/docs/themes](https://ohmyposh.dev/docs/themes)

## Resources

- [Oh My Posh Documentation](https://ohmyposh.dev/docs)
- [Oh My Posh Themes](https://ohmyposh.dev/docs/themes)
- [Creating Custom Themes](https://ohmyposh.dev/docs/configuration/overview)
