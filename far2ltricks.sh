#!/bin/bash
#
# trick 1: kitty as default terminal emulator
#
#sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
#
# trick 2: enable osc52
#
#config_file="$HOME/.config/far2l/settings/config.ini"
#if [ ! -f "$config_file" ]; then
#  mkdir -p "$HOME/.config/far2l/settings"
#  echo '[Interface]' > "$config_file"
#  echo 'OSC52ClipSet=1' >> "$config_file"
#else
#  if grep -q '^OSC52ClipSet=0$' "$config_file"; then
#    sed -i 's/^OSC52ClipSet=0$/OSC52ClipSet=1/' "$config_file"
#  fi
#fi
#
# Trick 3: set far2l-friendly color scheme in Konsole:
#
#mkdir -p ~/.local/share/konsole && echo -e "[General]\nName=WhiteOnBlack\nParent=FALLBACK/\n\n[Appearance]\nColorScheme=WhiteOnBlack" > ~/.local/share/konsole/WhiteOnBlack.profile && { test -f ~/.config/konsolerc || echo -e "[Desktop Entry]\nDefaultProfile=WhiteOnBlack.profile" > ~/.config/konsolerc; grep -q 'DefaultProfile=' ~/.config/konsolerc && sed -i 's/^DefaultProfile=.*/DefaultProfile=WhiteOnBlack.profile/' ~/.config/konsolerc || echo -e "[Desktop Entry]\nDefaultProfile=WhiteOnBlack.profile" >> ~/.config/konsolerc; }
#
#
# kill all far2l's so they can not replace updated config
#
#killall far2l
