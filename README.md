# niri-dots — Gentoo port

A Gentoo + Niri port inspired by [Zeibytes/most-racist-rice-V2](https://github.com/Zeibytes/most-racist-rice-V2). The compact Tokyo Night-inspired Waybar palette/layout is retained, with the Hyprland workspace module replaced by Niri's native module.

## Packages

Review package atoms and your profile/overlay before confirming the emerge plan; availability varies by Gentoo tree.

```sh
sudo emerge --ask gui-wm/niri gui-apps/waybar gui-apps/fuzzel x11-terms/kitty gui-apps/grim gui-apps/slurp gui-apps/swaybg gui-apps/wl-clipboard media-sound/playerctl media-video/pipewire media-video/wireplumber sys-apps/xdg-desktop-portal sys-apps/xdg-desktop-portal-wlr dev-vcs/git
```

Matugen may require a trusted overlay if it is not in your active tree. Search with `emerge --search matugen`. Install JetBrainsMono Nerd Font; optionally install pavucontrol and libnotify provider.

## Install

```sh
git clone https://github.com/weedblya/niri-dots.git
cd niri-dots
less install.sh
./install.sh
```

The installer backs up managed config files before replacing them and does not install packages or modify system services. Put wallpapers in `~/Pictures/wallpapers`; use `Super+Shift+W` to pick one. Region screenshots are saved to `~/Pictures/Screenshots` with `Super+Shift+S`.

Review `config/niri/config.kdl` and validate with `niri validate` if supported by your installed version. Monitor configuration is left to Niri's auto-detection.
