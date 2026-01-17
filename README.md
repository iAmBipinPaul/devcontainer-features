# Oh My Posh Dev Container Feature

Installs [Oh My Posh](https://ohmyposh.dev/) - a prompt theme engine for any shell with support for custom themes.

## Usage

Add this feature to your `.devcontainer/devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {}
    }
}
```

Or with a theme:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
            "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json"
        }
    }
}
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `"latest"` | Version of Oh My Posh to install |
| `theme` | string | `""` | Theme URL or file path (empty = no theme) |
| `installForBash` | boolean | `true` | Configure for bash shell |
| `installForZsh` | boolean | `true` | Configure for zsh shell |

## Theme Options

The `theme` parameter accepts:

### 1. Theme URL (Recommended)
Direct URL to a theme configuration file from [official themes](https://ohmyposh.dev/docs/themes):
```json
"theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json"
```
**Browse themes:** Visit [https://ohmyposh.dev/docs/themes](https://ohmyposh.dev/docs/themes) to see all available themes and copy their JSON URLs.

### 2. File Path
Path to a theme file in your repository:
```json
"theme": "/workspaces/project/.devcontainer/custom-theme.omp.json"
```
**Use case:** Project-specific custom themes

### 3. No Theme (Default)
Leave empty to use Oh My Posh's default prompt:
```json
"theme": ""
```

## Examples

### Minimal Installation
```jsonc
{
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {}
    }
}
```
Installs Oh My Posh with default settings (both bash and zsh, no theme).

### With Theme URL
```jsonc
{
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
            "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json"
        }
    }
}
```

### With Custom Theme File
```jsonc
{
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
            "theme": "/workspaces/project/.devcontainer/custom-theme.omp.json"
        }
    }
}
```

### Bash Only
```jsonc
{
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
            "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/paradox.omp.json",
            "installForZsh": false
        }
    }
}
```

## More Information

- [Oh My Posh Documentation](https://ohmyposh.dev/docs) - Official docs
- [Browse All Themes](https://ohmyposh.dev/docs/themes) - 200+ built-in themes
- [Create Custom Themes](https://ohmyposh.dev/docs/configuration/overview) - Theme customization guide
- [Example Custom Theme](./.devcontainer/example-custom-theme.omp.json) - Sample theme file in this repo

## Development

Test locally by referencing the feature with a local path:

```jsonc
{
    "features": {
        "./src/oh-my-posh": {
            "theme": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json"
        }
    }
}
```

## License

See [LICENSE](./LICENSE) for details.
