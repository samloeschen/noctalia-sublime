# Noctalia for Sublime Text

A [Noctalia](https://github.com/noctalia-dev/noctalia) community template that keeps Sublime Text's editor colors and interface in sync with the active palette. It supports native Sublime Text 3 and 4 installations, development builds, Flatpak, and Snap on Linux.

## Installation

### Community catalog

Once the template is listed in Noctalia's community catalog:

1. Open **Noctalia Settings -> Templates**.
2. Turn on **Enable community templates** and refresh the catalog if necessary.
3. Enable **Sublime Text**.
4. Change the palette or run `noctalia msg templates-apply`.

### Install from this repository

Clone the template into Noctalia's config directory:

```sh
git clone https://github.com/samloeschen/noctalia-sublime.git \
  ~/.config/noctalia/templates/sublime-text
```

Add the following user templates to `~/.config/noctalia/config.toml`:

```toml
[theme.templates.user.sublime_text_color_scheme]
input_path = "templates/sublime-text/Noctalia.sublime-color-scheme"
output_path_dynamic = "bash '{{ config_dir }}/templates/sublime-text/output-path.sh' 'Noctalia.sublime-color-scheme'"
index = 10

[theme.templates.user.sublime_text_ui_theme]
input_path = "templates/sublime-text/Noctalia.sublime-theme"
output_path_dynamic = "bash '{{ config_dir }}/templates/sublime-text/output-path.sh' 'Noctalia.sublime-theme'"
index = 20
```

Apply the current palette:

```sh
noctalia msg templates-apply
```

The output-path helper writes to every detected Sublime installation. If Sublime has not created a config directory yet, it uses `~/.config/sublime-text/Packages/User`; start Sublime once before applying if you use a nonstandard installation.

## Enable in Sublime Text

In Sublime Text, use **Preferences -> Select Color Scheme -> Noctalia**, then **Preferences -> Select Theme -> Noctalia**.

Alternatively, add these entries to `Preferences.sublime-settings`:

```json
{
    "color_scheme": "Noctalia.sublime-color-scheme",
    "theme": "Noctalia.sublime-theme"
}
```

Sublime Text reloads both generated files when Noctalia updates them. The one-time selection above does not need to be repeated after palette or light/dark mode changes.

## Included files

- `Noctalia.sublime-color-scheme` themes the editor, syntax scopes, selections, guides, search results, and diff markers.
- `Noctalia.sublime-theme` extends Sublime's built-in Adaptive theme and applies Noctalia colors to tabs, the sidebar, panels, popups, controls, and the status bar.
- `output-path.sh` finds the `Packages/User` directory for each installed Sublime variant.
- `template.toml` is the Noctalia community-template manifest.
- `tests/syntax-samples` contains representative language and markup fixtures for checking scope coverage.

## Syntax coverage

The color scheme starts with Sublime's canonical scope families and layers semantic rules over them. This gives third-party syntaxes useful highlighting when they follow Sublime's scope naming guidelines, without requiring a selector for every language.

To inspect a fixture, open it in Sublime Text and use **Tools -> Developer -> Show Scope Name** on representative tokens. Check the fixtures after changing scope rules, especially declarations, types, function calls, parameters, members, literals, operators, embedded code, diagnostics, and diff content.

After applying the template, validate the rendered scheme with `jq` and `ripgrep` installed:

```sh
tests/check-rendered-scheme.sh ~/.config/sublime-text/Packages/User/Noctalia.sublime-color-scheme
```

The manifest follows the official [community template layout](https://github.com/noctalia-dev/community-templates). For catalog submission, copy these files into a `sublime-text/` directory in that repository and include a tested screenshot with the pull request.

## License

[MIT](LICENSE)
