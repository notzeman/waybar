# Waybar Config

Hyprland waybar with Omarchy integration. Theme imported from `~/.config/omarchy/current/theme/waybar.css`.

## Layout

```
Left:    Workspaces | Cava visualizer
Center:  Weather | Clock | Network (bandwidth) | Update indicator | Screen recording indicator
Right:   MPRIS | [Tray drawer] | Backlight | Network (icon) | Bluetooth | PulseAudio | CPU | Battery
```

**Tray drawer** (collapsible): expand icon → tray icons → memory → nethogs launcher

## Modules

| Module | Description |
|--------|-------------|
| `custom/visualizer` | Cava audio visualizer (`scripts/cava.sh`) |
| `custom/weather` | wttrbar for Malappuram |
| `custom/update` | Omarchy update availability |
| `custom/screenrecording-indicator` | Recording status |
| `custom/idle-indicator` | Idle state toggle |
| `custom/notification-silencing-indicator` | DND state |
| `custom/nethogs` | Launches `sudo nethogs wlan0` in floating terminal |
| `custom/expand-icon` | Toggles tray drawer |
| `network#essid` | Bandwidth up/down |
| `network#icon` | Signal strength & IP tooltip |
| `mpris` | Media player info |
| `memory` | RAM usage, click opens `btm` |
| `cpu` | Click opens `btop` in floating terminal |
| `bluetooth` | Click opens `bluetui` |
| `pulseaudio` | Click opens `wiremix` |
| `clock` | Time/date with calendar tooltip |

## Click Actions

Most modules use `omarchy-launch-floating-terminal-with-presentation` to open TUI tools in floating scratchpads: btop, btm, bluetui, wiremix, nethogs, and omarchy-update.

- `sudo nethogs wlan0` — per-app network usage
- `sudo -E btop` — process monitor
- `btm --enable_cache_memory` — system monitor (bottom)
- `bluetui` — bluetooth manager
- `wiremix` — audio mixer
- `omarchy-launch-wifi` — network manager
- `impala` — network TUI
- `pamixer -t` — toggle mute

## Styling

- Font: JetBrainsMono Nerd Font 12px
- Pill-shaped modules with 10px border-radius
- Color scheme via Omarchy theme CSS variables
- Warning states: muted/disconnected/low battery → `#bf616a`
- Active indicators → `#a55555`

## Scripts

- `scripts/cava.sh` — audio visualizer pipe
- `scripts/bt-info.sh` — bluetooth device info for tooltip
