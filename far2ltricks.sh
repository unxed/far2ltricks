#!/bin/bash
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
#
# trick 2: wayland tty input delays workaround
#
if ! grep -q "FAR2L_ARGS" ~/.bashrc; then
  if [[ -n ${WAYLAND_DISPLAY} ]]; then
    echo "export FAR2L_ARGS=\"--nodetect=xi --ee\"" >> ~/.bashrc
  else
    echo "export FAR2L_ARGS=\"--ee\"" >> ~/.bashrc
  fi
fi
#
# trick 3: enable osc52
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
# trick 4: free hot keys needed for far2l
#
# turn off F10 usage in GNOME Terminal
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false
# turn off some gnome wm-specific hot keys
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" 		# Alt+F1
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "[]" 		# Alt+F2
#gsettings set org.gnome.desktop.wm.keybindings close "[]" 					# Alt+F4
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['']" 			# Alt+F5
gsettings set org.gnome.desktop.wm.keybindings begin-move "['disabled']" 	# Alt+F7
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['disabled']" 	# Alt+F8
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['']" 		# Alt+F10
# for cinnamon:
gsettings set org.cinnamon.desktop.keybindings.wm panel-main-menu "[]" 		# Alt+F1
gsettings set org.cinnamon.desktop.keybindings.wm panel-run-dialog "[]" 	# Alt+F2
#gsettings set org.cinnamon.desktop.keybindings.wm close "[]" 				# Alt+F4
gsettings set org.cinnamon.desktop.keybindings.wm unmaximize "['']" 		# Alt+F5
gsettings set org.cinnamon.desktop.keybindings.wm begin-move "['']" 		# Alt+F7
gsettings set org.cinnamon.desktop.keybindings.wm begin-resize "['']" 		# Alt+F8
gsettings set org.cinnamon.desktop.keybindings.wm toggle-maximized "['']" 	# Alt+F10
#
# wayland-only tricks below
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
#!/bin/sh

case "$1" in
get)
    if command -v cscript.exe >/dev/null 2>&1; then
        cscript.exe //Nologo \\\\wsl.localhost\\"$WSL_DISTRO_NAME"\\"$HOME"\\.config\\far2l\\getclipboard.vbs
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
