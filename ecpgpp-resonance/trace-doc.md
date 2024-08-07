# Installation of Manjaro Gnome #
+ install 24.0.3 -> 6.9.9-1-MANJARO
> This document intend to compile various informations about setting up a Manjaro i3 (from a Manjaro-Gnome env) on a Thinkpad T14Gen5

# Problems to solve

## No click on tap on touchpad
[solved ✓]
### Procedure
1. Install 'xorg-xinput'

2. Create config at `etc/X11/xorg.conf.d/40-libinput.conf`
config :
```txt
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
```

### Readings
> "You may want to install xorg-xinput to be able to change settings at runtime."  
[libinput](https://wiki.archlinux.org/title/Libinput)


## Deactivate the annoying motherboard beep
[solved ✓]

### Procedure

1. Create config at `/etc/modprobe.d/blacklist.conf`
config:
```txt
blacklist pcspkr
```

### Readings
[man modprobe]https://man.archlinux.org/man/modprobe.8.en)
[modprobe](https://wiki.archlinux.org/title/Kernel_module#Manually_at_load_time_using_modprobe)

## No sound
[solved ✓]
### Procedure
1. check if pulseaudio is installed
```bash
pacman -Qs pulseaudio
```
this returns :
```bash
local/pipewire-alsa 1:1.2.1-1
    Low-latency audio/video router and processor - ALSA configuration
local/pipewire-pulse 1:1.2.1-1
    Low-latency audio/video router and processor - PulseAudio replacement
local/qemu-audio-pa 9.0.1-1
    QEMU PulseAudio audio driver
```

2. Nowing that I have pipewire instead of pulseaudio (new way), check if pipewire is running
```bash
systemctl --user status pipewire pipewire-pulse
```
this returns both are running

3. Make sure they start on boot 
```bash
systemctl --user enable pipewire pipewire-pulse
```

4. Install useful tools for audio
```bash
sudo pacman -S pipewire-jack pipewire-alsa pipewire-pulse pavucontrol
```
> pavucontrol is a handy simple GUI for sound control
> The different pipewire packages are meant to replace/mimic the previous sound handler

5. List audio devices
```bash
pactl list short sinks
pactl list short sources
```
6. Try to play a sound
```bash
paplay /usr/share/sounds/alsa/Front_Center.wav
```
7. Configure volume control on i3 at `~/.config/i3/config`
```txt
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
```
8. Check `alsamixer` to be sure there's nothing muted
```bash
alsamixer
```
> At every reboot my Speaker goes mute. I write a script to ensure the toggle. (`unmute` alone doesn't work)

9. Unmute Speaker at startup with script in i3
```txt
exec --no-startup-id ~/scripts/unmute-speaker.sh
```
__~/scripts/unmute-speaker.sh__
```bash
amixer set Master mute
amixer set Master unmute
```

### Readings
[pipewire](https://wiki.archlinux.org/title/PipeWire)
> "PipeWire is a new low-level multimedia framework. It aims to offer capture and playback for both audio and video with minimal latency and support for PulseAudio, JACK, ALSA and GStreamer-based applications."  
[pavucontrol](https://doc.ubuntu-fr.org/pavucontrol)

## Install menu for i3
[solved ✓]
> I'll go with rofi

### Procedure
1. Install `rofi`
```bash
sudo pacman -S rofi
```

2. Add i3 keybinding to `~/.config/i3/config`
```txt
bindsym $mod+d exec --no-startup-id rofi -show drun
```

3. Add config for rofi at `/.config/rofi/config.rasi`
```text
configuration {
    modi: "run,drun,window";
    font: "DejaVu Sans Mono 12";
    show-icons: true;
}

@theme "/usr/share/rofi/themes/Arc-Dark.rasi"

```
### Readings
[rofi theme](https://github.com/davatorium/rofi/blob/next/doc/rofi-theme.5.markdown)

## Control of screen backlight
### Procedure
1. Install brightnessctl
```bash
sudo pacman brightnessctl
```
2. Add binding in i3 config
```txt
bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set +10%
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 10%-
```

## bluetooth support / headphone setup

## Screen tearing 

## Some redenring are laggy (for instance some website animations)

## KB lafayette layout

## Alert on low battery
[WIP - NOT WORKING ✗]
### PROCEDURE
1. Get `i3-battery-popup` project and make it executable
```bash
wget https://raw.githubusercontent.com/rjekker/i3-battery-popup/master/i3-battery-popup
chmod +x i3-battery-popup
```
2. Set the script to launch at startup with option in i3 config
```txt
exec --no-startup-id $HOME/scripts/i3-battery-popup -L 25% -l 20% -s /usr/share/sounds/skeggang/foranik.mp3 -n
```

## Set up Charging Threshold 
### Procedure
1. Install `tlp` to reach better battery life
[tlp](https://linrunner.de/tlp/introduction.html)
```bashac
sudo pacman -S tlp
```
2. Enable tlp service
```bash
systemctl enable tlp.service
```
3. Check tlp info
```bash
sudo tlp-stat -b
``
4. Enable tlp usage and battery threshold in tlp config at `/etc/tlp.conf`
```txt
TLP_ENABLE=1
TLP_WARN_LEVEL=3
...
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
```


## display sound volume indicator on change

## No touchPD gesture

## fix GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable when using notify send
[solved ✓]
### Procedure
1. Install a notification deamon
> I go for dunst
```bash
sudo pacman -S dunst
```

# Nice to have

## Sound on session login / boot
[TESTING]
### procedure
1. Add an entry to i3 config to wait a bit after startup and play sound
```txt
exec --no-startup-id sleep 2 && paplay /usr/share/sounds/startup.wav
```

## pactree for visualizing pacman tree dependancies
[solved ✓]
### procedure 
1. install `pacman-contrib`
### readings
[pacman-contrib gitlab](https://gitlab.archlinux.org/pacman/pacman-contrib)

## theme i3
[WIP]
### procedure
1. Add a wallpaper in i3 config at `~/.config/i3/config`
```txt
exec_always feh --bg-fill /path/to/wallpaper
```
2. Custom colors for windows tiles

## use picom to pimp rofi

## customize desktop notification appearance

### Nice Packages ###
picom feh brightnessctl pavucontrol tree dunst
