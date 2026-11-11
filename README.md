# bspwm-night

A night-saturated **Archcraft bspwm** rice with a matching **GTK** and **Qt/Kvantum**
theme, SF Pro / SF Mono typography, and a single unified palette across the bar,
terminal, GTK and Qt applications.

- **GTK theme:** `Arc-Night` (Arc-Dark rebuilt with the palette)
- **Qt theme:** `Arc-Night` (Kvantum, recolored KvArcDark)
- **WM:** bspwm + sxhkd, Archcraft layout, Roman-numeral dynamic workspaces
- **Bar:** polybar, pt-BR modules, `|` separators
- **Launcher/menus:** rofi, translated to pt-BR
- **Terminal:** kitty (default), SF Mono Medium; alacritty still themed

## Palette

| Role | Hex |
|---|---|
| Background | `#10131A` |
| Surface / buttons | `#212630` |
| Borders | `#2A3240` |
| Foreground | `#E8EDF4` |
| Muted | `#7C8AA0` |
| Accent / selection | `#3D8BFF` |
| Selection (rendered) | `#1F3C6A` |
| Red | `#FF4D5E` |
| Green | `#22D67A` |
| Yellow | `#FFB020` |
| Magenta | `#C05CFF` |
| Cyan | `#12D6D6` |

## Install

Arch-based system, X11:

```bash
git clone https://github.com/Darkiu1337/bspwm-night.git
cd bspwm-night
./install.sh
```

Log out, pick **Bspwm** in your display manager.

`install.sh` backs up an existing `~/.config/bspwm`, installs the dotfiles and
both themes, sets the GTK/icon theme, and drops the LightDM session file.

## Dependencies

See `packages.txt`. The short version:

- **Repos:** bspwm sxhkd polybar rofi dunst picom xsettingsd hsetroot pulsemixer
  pastel xorg-xsetroot xorg-xrandr xdotool xclip maim acpi bc viewnior thunar
  geany mpd mpc playerctl xfce4-power-manager bluez-utils upower ffmpeg kitty
  wmname yad xcolor networkmanager python-gobject papirus-icon-theme kvantum
  kvantum-qt5
- **AUR:** light python-pywal ksuperkey xfce-polkit betterlockscreen apple-fonts
- **Archcraft assets:** archcraft-fonts (Iosevka, Symbols Nerd Font, JetBrains
  Mono, archcraft icons), archcraft-backgrounds (wallpapers for the non-default
  themes), archcraft-cursor-qogirr (Qogirr cursor)

`apple-fonts` is required for SF Pro / SF Mono. It is an AUR package built from
Apple's DMGs; the fonts are Apple's proprietary property.

## Polkit agent (pt-BR, compact)

Upstream `xfce-polkit` has no translations and opens a wide dialog. The
`packages/xfce-polkit` folder ships a patched source tarball plus PKGBUILD that:

- translates the dialog (Autenticação necessária, _Permitir, _Negar,
  Identidade, Falhou. Senha incorreta?)
- constrains it to 400 px wide, with a single-line ellipsized action message
  (full text in the tooltip) and tighter grid spacing

Build and install on Arch:

```bash
cd packages/xfce-polkit
makepkg -f
sudo pacman -U xfce-polkit-0.3.3-1-x86_64.pkg.tar.zst
```

It replaces the repository `xfce-polkit` (same package name, higher version).

## After install

- Edit `~/.config/bspwm/themes/system.ini` for your adapter, battery,
  backlight device and network interface (defaults: `ACAD`, `BAT1`,
  `amdgpu_bl1`, `wlan0`).
- The bundled wallpaper is `wallpaper/nord.jpg`, installed to
  `~/.local/share/backgrounds/nord.jpg` and linked as the default theme
  wallpaper. Other themes still reference `/usr/share/backgrounds/*.jpg`.
- The optional two/three-monitor workspace layouts in
  `~/.config/bspwm/bspwmrc` use placeholder monitor names; adjust them to
  `xrandr` output names.
- Qt apps need `QT_STYLE_OVERRIDE=kvantum`; `bspwmrc` exports it.

## Layout

```
dotfiles/bspwm/        complete ~/.config/bspwm rice
dotfiles/gtk-3.0/      user GTK3 overrides + settings
dotfiles/gtk-4.0/      user GTK4 overrides + settings
dotfiles/Kvantum/Arc-Night/   Arc-Night Kvantum theme
themes/Arc-Night/      GTK2/3/4 theme (CSS + assets)
wallpaper/nord.jpg
files/bspwm.desktop    LightDM session entry
```

## Credits & license

- bspwm config, scripts and themes are derived from
  [Archcraft](https://github.com/archcraft-os) (GPL-3.0).
- `Arc-Night` GTK is a recolored build of [Arc](https://github.com/jnsh/arc-theme)
  (GPL-3.0). The Kvantum theme is a recolored `KvArcDark` (GPL-3.0).
- Wallpaper from Archcraft's wallpaper set.
- SF Pro / SF Mono are Apple fonts, not distributed here; install via
  `apple-fonts` (AUR).

Everything added here is released under GPL-3.0; see `LICENSE`.
