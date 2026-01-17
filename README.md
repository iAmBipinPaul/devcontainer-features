# Oh My Posh Dev Container Feature

Installs [Oh My Posh](https://ohmyposh.dev/) - a prompt theme engine for any shell with support for custom themes.

## Usage

Add this feature to your `.devcontainer/devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/iambipinpaul/devcontainer-features/oh-my-posh:1": {
            "theme": "jandedobbeleer",
            "installForBash": true,
            "installForZsh": false
        }
    }
}
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `"latest"` | Version of Oh My Posh to install |
| `theme` | string | `""` | Theme name, URL, or file path |
| `installForBash` | boolean | `true` | Configure for bash shell |
| `installForZsh` | boolean | `false` | Configure for zsh shell |

## Theme Options

The `theme` parameter accepts:
- **Built-in theme name**: `"jandedobbeleer"`, `"atomic"`, `"paradox"`
- **Theme URL**: `"https://raw.githubusercontent.com/.../theme.omp.json"`
- **File path**: `"/workspaces/project/.devcontainer/custom-theme.omp.json"`

## More Information

- [Oh My Posh Documentation](https://ohmyposh.dev/docs) - Official docs
- [Browse Themes](https://ohmyposh.dev/docs/themes) - Available themes
- [Example Custom Theme](./.devcontainer/example-custom-theme.omp.json) - Sample theme file

## Development

Test locally by referencing the feature with a local path:

```jsonc
{
    "features": {
        "./src/oh-my-posh": {
            "theme": "jandedobbeleer"
        }
    }
}
```

## License

See [LICENSE](./LICENSE) for details.
