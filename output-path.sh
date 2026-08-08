#!/usr/bin/env bash
set -euo pipefail

filename="${1:-}"
case "$filename" in
    Noctalia.sublime-color-scheme|Noctalia.sublime-theme) ;;
    *)
        printf 'usage: %s {Noctalia.sublime-color-scheme|Noctalia.sublime-theme}\n' "$0" >&2
        exit 2
        ;;
esac

: "${HOME:?HOME must be set}"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
found=false

for packages_dir in \
    "$config_home/sublime-text/Packages/User" \
    "$config_home/sublime-text-3/Packages/User" \
    "$config_home/sublime-text-dev/Packages/User" \
    "$HOME/.var/app/com.sublimetext.three/config/sublime-text/Packages/User" \
    "$HOME/snap/sublime-text/current/.config/sublime-text/Packages/User"
do
    if [[ -d "$packages_dir" ]]; then
        printf '%s/%s\n' "$packages_dir" "$filename"
        found=true
    fi
done

if [[ "$found" == false ]]; then
    printf '%s/sublime-text/Packages/User/%s\n' "$config_home" "$filename"
fi
