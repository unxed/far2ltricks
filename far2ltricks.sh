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
# trick 2: wayland tty input delays workaround
#
if [[ -n ${WAYLAND_DISPLAY} ]]; then
  # 
  # see
  # https://github.com/elfmz/far2l/issues/2041
  # https://github.com/elfmz/far2l/issues/2139
  # applying workaround
  #
  echo
  echo "To work around input bug under Wayland I need to patch /usr/lib/far2l/far2l_ttyx.broker"
  echo "Для решения проблемы с багом ввода под Wayland мне нужно пропатчить /usr/lib/far2l/far2l_ttyx.broker"
  echo
  sudo perl -pi -e 's/XInputExtension/!InputExtension/g' /usr/lib/far2l/far2l_ttyx.broker
fi
#
# trick 4: enable --ee option by default
#
# actually, not needed: under x11 esc key is processed via ttyxi,
# under wayland either it's ubuntu 24.04 version with no support for --ee in FAR2L_ARGS
# or more fresh distro having far2l version with --ee enabled under wayland by default
#
#if ! grep -q "FAR2L_ARGS" ~/.bashrc; then
#  echo "export FAR2L_ARGS=\"--ee\"" >> ~/.bashrc
#fi
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
# wsl-only tricks below
#
if [[ -z $WSL_DISTRO_NAME ]]; then
    #
    # kill all far2l's so they can not replace updated config
    #
    killall far2l
    exit;
fi
#
# trick 5: wslg clipboard workaround
#
cat > ~/.config/far2l/getclipboard.vbs <<'EOF'
WScript.StdOut.Write CreateObject("HTMLFile").ParentWindow.ClipboardData.GetData("Text")
EOF
cat > ~/.config/far2l/clipboard <<'EOF'
script_path=$(dirname "$(readlink -f "$0")")

case "$1" in
get)
    if command -v cscript.exe >/dev/null 2>&1; then
        cscript.exe //Nologo $(wslpath -w "$script_path"/wslgclip.vbs)
    else
        powershell.exe -Command Get-Clipboard
    fi

;;
set)
    CONTENT=$(cat)
    echo "$CONTENT" | clip.exe
    echo "$CONTENT"
;;
"")
    (far2l --clipboard=$(readlink -f $0) >/dev/null 2>&1 &)
;;
esac

EOF
chmod +x ~/.config/far2l/clipboard
#
# kill all far2l's so they can not replace updated config
#
killall far2l
