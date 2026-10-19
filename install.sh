#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d-%H%M%S)"
copy_backup() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" ]]; then cp -a "$dest" "${dest}.bak-${STAMP}"; echo "Backup: ${dest}.bak-${STAMP}"; fi
  cp -a "$src" "$dest"
}
for app in niri waybar fuzzel matugen; do
  [[ -d "$ROOT/config/$app" ]] || continue
  while IFS= read -r -d '' file; do
    rel="${file#"$ROOT/config/$app/"}"
    copy_backup "$file" "$CONFIG_DIR/$app/$rel"
  done < <(find "$ROOT/config/$app" -type f -print0)
done
mkdir -p "$HOME/.local/bin"
for script in "$ROOT"/scripts/*; do
  [[ -f "$script" ]] || continue
  copy_backup "$script" "$HOME/.local/bin/$(basename "$script")"
  chmod +x "$HOME/.local/bin/$(basename "$script")"
done
echo "Installed dotfiles; no packages or system services were changed."
