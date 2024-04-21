# far2ltricks

**Readme in english is below**

Всякие полезности для файлового менеджера far2l.

Главное — сам скрипт far2ltricks.sh. Он применяет всякие настройки, делающие вашу работу в far2l максимально комфортной. Запускать так:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/far2ltricks.sh > /tmp/far2ltricks.sh && bash /tmp/far2ltricks.sh && rm /tmp/far2ltricks.sh
```

Освобождение необходимых far2l горячих клавиш, занимаемых некоторыми DE:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/far2lkeys.sh > /tmp/far2lkeys.sh && bash /tmp/far2lkeys.sh && rm /tmp/far2lkeys.sh
```

Исправление проблемы с задержками ввода на Ubuntu 24.04:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/misc/24_04_fix.sh > /tmp/24_04_fix.sh && bash /tmp/24_04_fix.sh && rm /tmp/24_04_fix.sh
```

Если вам нужен пакет для своего дистрибутива, можете собрать его самостоятельно, используя скрипт `deb/make_far2l_deb.sh`.

По умолчанию far2l работает как GUI-приложение на wxWidgets. Также поддерживается работа в консоли, `far2l --tty`. В putty консольная версия работает с [с некоторыми ограничениями](https://github.com/elfmz/far2l/issues/472), проблема решается использованием [специальной версии putty](https://github.com/unxed/putty4far2l).

far2l ppa: https://launchpad.net/~far2l-team/+archive/ubuntu/ppa

Обратите также внимание на portable версию и AppImage: https://github.com/spvkgn/far2l-portable/

Что ещё тут есть интересного?

colorer_smarty — улучшение поддержки Smarty в плагине Colorer

misc — всякие вспомогательные скрипты, большей частью устаревшие

patches — разные полезные патчи: включение по умолчанию опций «одиночное нажатие ESC» и «поддержка OSC 52», исправление буфера обмена для систем с Wayland.

themes — темы оформления интерфейса far2l

---

All sorts of useful things for the far2l file manager.

The main thing is the far2ltricks.sh script itself. It applies all sorts of settings that make your work in far2l as comfortable as possible. Run like this:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/far2ltricks.sh > /tmp/far2ltricks.sh && bash /tmp/far2ltricks.sh && rm /tmp/far2ltricks.sh
```

Freeing up necessary far2l hotkeys occupied by some DEs:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/far2lkeys.sh > /tmp/far2lkeys.sh && bash /tmp/far2lkeys.sh && rm /tmp/far2lkeys.sh
```

Fixing input lag issue on Ubuntu 24.04:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/misc/24_04_fix.sh > /tmp/24_04_fix.sh && bash /tmp/24_04_fix.sh && rm /tmp/24_04_fix.sh
```

If you need a package for your distribution, you can build it yourself using the `deb/make_far2l_deb.sh` script.

By default, far2l runs as a GUI application on wxWidgets. Console operation is also supported, `far2l --tty`. In putty, the console version works with [with some limitations](https://github.com/elfmz/far2l/issues/472), the problem is solved by using a [special version of putty](https://github.com/unxed/putty4far2l).

far2l ppa: https://launchpad.net/~far2l-team/+archive/ubuntu/ppa

Please also pay attention to the portable version and AppImage: https://github.com/spvkgn/far2l-portable/

What else is there interesting here?

colorer_smarty - improved Smarty support in the Colorer plugin

misc - all sorts of auxiliary scripts, mostly outdated

patches - various useful patches: enabling the “single press ESC” and “OSC 52 support” options by default, fixing the clipboard for systems with Wayland.

themes - far2l interface themes
