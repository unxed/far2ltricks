#!/bin/bash
#
# turn off F10 usage in GNOME Terminal
#
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled false
#
# turn off some gnome wm-specific hot keys
#
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "[]" 		# Alt+F1
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "[]" 		# Alt+F2
#gsettings set org.gnome.desktop.wm.keybindings close "[]" 					# Alt+F4
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['']" 			# Alt+F5
gsettings set org.gnome.desktop.wm.keybindings begin-move "['disabled']" 	# Alt+F7
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['disabled']" 	# Alt+F8
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['']" 		# Alt+F10
#
# same for cinnamon:
#
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-up "[]"
#
gsettings set org.cinnamon.desktop.keybindings.wm panel-main-menu "[]" 		# Alt+F1
gsettings set org.cinnamon.desktop.keybindings.wm panel-run-dialog "[]" 	# Alt+F2
#gsettings set org.cinnamon.desktop.keybindings.wm close "[]" 				# Alt+F4
gsettings set org.cinnamon.desktop.keybindings.wm unmaximize "['']" 		# Alt+F5
gsettings set org.cinnamon.desktop.keybindings.wm begin-move "['']" 		# Alt+F7
gsettings set org.cinnamon.desktop.keybindings.wm begin-resize "['']" 		# Alt+F8
gsettings set org.cinnamon.desktop.keybindings.wm toggle-maximized "['']" 	# Alt+F10
