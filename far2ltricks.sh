#!/bin/bash
#
# trick 0: kitty as default terminal emulator
#
#sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
#
# trick 1: free some kitty key combinations for far2l
#
kitty_config_dir="${HOME}/.config/kitty"
kitty_config_file="${kitty_config_dir}/kitty.conf"
if [ ! -d "${kitty_config_dir}" ]; then
  mkdir -p "${kitty_config_dir}"
fi
if [ ! -f "${kitty_config_file}" ]; then
  touch "${kitty_config_file}"
fi
if ! grep -q "map ctrl+shift+right no_op" "${kitty_config_file}"; then
  echo "map ctrl+shift+right no_op" >> "${kitty_config_file}"
fi
if ! grep -q "map ctrl+shift+left no_op" "${kitty_config_file}"; then
  echo "map ctrl+shift+left no_op" >> "${kitty_config_file}"
fi
if ! grep -q "map ctrl+shift+home no_op" "${kitty_config_file}"; then
  echo "map ctrl+shift+home no_op" >> "${kitty_config_file}"
fi
if ! grep -q "map ctrl+shift+end no_op" "${kitty_config_file}"; then
  echo "map ctrl+shift+end no_op" >> "${kitty_config_file}"
fi
if ! grep -q "enable_audio_bell no" "${kitty_config_file}"; then
  echo "enable_audio_bell no" >> "${kitty_config_file}"
fi
#
# trick 4: enable osc52
#
config_file="$HOME/.config/far2l/settings/config.ini"
if [ ! -f "$config_file" ]; then
  mkdir -p "$HOME/.config/far2l/settings"
  echo '[Interface]' > "$config_file"
  echo 'OSC52ClipSet=1' >> "$config_file"
else
  if grep -q '^OSC52ClipSet=0$' "$config_file"; then
    sed -i 's/^OSC52ClipSet=0$/OSC52ClipSet=1/' "$config_file"
  fi
fi
#
# kill all far2l's so they can not replace updated config
#
killall far2l
