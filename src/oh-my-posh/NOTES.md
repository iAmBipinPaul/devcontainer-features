## Additional Information

### Font Requirements

Oh My Posh uses special glyphs and icons that require a [Nerd Font](https://www.nerdfonts.com/) to display correctly. Install a Nerd Font on your local machine and configure your terminal to use it.

Recommended fonts:
- **FiraCode Nerd Font** - Great for coding
- **JetBrainsMono Nerd Font** - Clean and modern
- **Meslo Nerd Font** - Classic monospace

### Theme Detection Logic

The feature automatically detects how to handle the `theme` parameter:

1. **URL Detection**: If the theme starts with `http://` or `https://`, it's treated as a URL
2. **Path Detection**: If the theme starts with `/`, `./`, `../`, or `~`, it's treated as a file path
3. **Built-in Theme**: Otherwise, it's treated as a built-in theme name

### Shell Configuration

The feature adds Oh My Posh initialization to your shell's RC file:
- **Bash**: `~/.bashrc`
- **Zsh**: `~/.zshrc`

You can enable both shells simultaneously by setting both options to `true`.

### Architecture Support

This feature supports multiple architectures:
- `amd64` (x86_64)
- `arm64` (aarch64)
- `arm` (armv7l)

The installation script automatically detects your system architecture.

### Version Pinning

For production environments, consider pinning to a specific version:

```json
{
  "features": {
    "ghcr.io/YOUR_USERNAME/YOUR_REPO/oh-my-posh:1": {
      "version": "19.0.0"
    }
  }
}
```

This ensures consistent behavior across rebuilds.

### Performance Considerations

Oh My Posh is designed to be fast, but complex themes with many segments may add a small delay to your prompt. If you experience slowness:
- Use simpler themes
- Disable segments you don't need
- Consider caching options in your theme configuration

### Customization Tips

1. **Start Simple**: Begin with a built-in theme and customize from there
2. **Use the Schema**: The theme JSON schema provides autocomplete in VS Code
3. **Test Locally**: Use `oh-my-posh config export --output my-theme.omp.json` to export your current theme
4. **Preview Themes**: Run `oh-my-posh config migrate glyphs --write` to see all available glyphs

### Common Use Cases

**Development Container with Git Info**:
```json
{
  "theme": "jandedobbeleer"  // Shows git branch, status, and more
}
```

**Minimal Prompt**:
```json
{
  "theme": "pure"  // Clean, minimal prompt
}
```

**Full-Featured Prompt**:
```json
{
  "theme": "powerlevel10k_rainbow"  // Shows everything
}
```

### Troubleshooting

**Issue**: Theme not applying after rebuild
- **Solution**: Ensure you've reloaded your shell or started a new terminal session

**Issue**: Icons showing as boxes or question marks
- **Solution**: Install and configure a Nerd Font in your terminal

**Issue**: Oh My Posh command not found
- **Solution**: Check that `/usr/local/bin` is in your PATH

**Issue**: Theme file not found
- **Solution**: Verify the path is correct and the file exists in the container (not just on your host)

### Contributing

Found a bug or have a suggestion? Please open an issue or submit a pull request!
