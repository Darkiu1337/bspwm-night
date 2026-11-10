#!/usr/bin/env bash
# bspwm-night — Arc-Night rice installer
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

if [ -d "$HOME/.config/bspwm" ]; then
  B="$HOME/.config/bspwm.bak-$(date +%Y%m%d-%H%M%S)"
  cp -a "$HOME/.config/bspwm" "$B"
  log "Backup of existing config: $B"
fi

log "Installing dotfiles"
mkdir -p "$HOME/.config" "$HOME/.local/share/themes" "$HOME/.config/Kvantum" \
         "$HOME/.local/share/applications" "$HOME/.local/share/backgrounds"
rm -rf "$HOME/.config/bspwm"
cp -a "$ROOT/dotfiles/bspwm" "$HOME/.config/bspwm"
mkdir -p "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0"
cp -a "$ROOT/dotfiles/gtk-3.0/." "$HOME/.config/gtk-3.0/"
cp -a "$ROOT/dotfiles/gtk-4.0/." "$HOME/.config/gtk-4.0/"
cp -a "$ROOT/dotfiles/Xresources" "$HOME/.Xresources"
cp -a "$ROOT/dotfiles/applications/network-menu.desktop" "$HOME/.local/share/applications/"

log "Installing themes"
rm -rf "$HOME/.local/share/themes/Arc-Night"
cp -a "$ROOT/themes/Arc-Night" "$HOME/.local/share/themes/"
rm -rf "$HOME/.config/Kvantum/Arc-Night"
mkdir -p "$HOME/.config/Kvantum"
cp -a "$ROOT/dotfiles/Kvantum/Arc-Night" "$HOME/.config/Kvantum/"
printf '[General]\ntheme=Arc-Night\n' > "$HOME/.config/Kvantum/kvantum.kvconfig"

log "Wallpaper"
cp -f "$ROOT/wallpaper/nord.jpg" "$HOME/.local/share/backgrounds/nord.jpg"
ln -sf "$HOME/.local/share/backgrounds/nord.jpg" "$HOME/.config/bspwm/themes/default/wallpaper"

log "GTK / icon theme"
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Night' || true
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' || true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' || true

log "LightDM session entry"
if [ -w /usr/share/xsessions ]; then
  install -Dm644 "$ROOT/files/bspwm.desktop" /usr/share/xsessions/bspwm.desktop
elif command -v sudo >/dev/null 2>&1; then
  sudo install -Dm644 "$ROOT/files/bspwm.desktop" /usr/share/xsessions/bspwm.desktop
else
  echo "Install it manually: sudo install -Dm644 files/bspwm.desktop /usr/share/xsessions/"
fi

cat <<'EOF'

Done.

1. Log out and choose "Bspwm" in your display manager.
2. Dependencies: see packages.txt (Arch repos + AUR + Archcraft assets).
3. Hardware-specific values live in
   ~/.config/bspwm/themes/system.ini (battery, adapter, backlight, interface).
4. Only the default theme's wallpaper is bundled. The other theme folders
   point at /usr/share/backgrounds/*.jpg from archcraft-backgrounds.
5. Monitor names for the optional two/three-monitor layouts are in
   ~/.config/bspwm/bspwmrc.
EOF
