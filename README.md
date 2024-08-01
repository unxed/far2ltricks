# far2ltricks

**Readme in english is below**

Всякие полезности для файлового менеджера far2l.

Главное — сам скрипт **far2ltricks.sh**. Он применяет всякие настройки, делающие вашу работу в far2l максимально комфортной. Запускать так:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/far2ltricks.sh > /tmp/far2ltricks.sh && bash /tmp/far2ltricks.sh && rm /tmp/far2ltricks.sh
```

По умолчанию far2l работает как GUI-приложение на wxWidgets. Также поддерживается работа в консоли, `far2l --tty`. В putty консольная версия работает с [с некоторыми ограничениями](https://github.com/elfmz/far2l/issues/472), проблема решается использованием [специальной версии putty](https://github.com/unxed/putty4far2l).

far2l ppa: https://launchpad.net/~far2l-team/+archive/ubuntu/ppa

Обратите также внимание на portable версию и AppImage: https://github.com/spvkgn/far2l-portable/

Что ещё тут есть интересного?

**deb** — скрипт сборки .deb-пакета для дистрибутивов, основанных на Debian.

**misc** — всякие вспомогательные скрипты, большей частью устаревшие

**themes** — темы оформления интерфейса far2l

**themes/colorer_smarty** — улучшение поддержки Smarty в плагине Colorer

**unbindkeys** — скрипты-примеры, показывающие, как освободить необходимых far2l горячих клавиш, занимаемых некоторыми DE и терминалами 

---

All sorts of useful things for the far2l file manager.

The main thing is the **far2ltricks.sh** script itself. It applies all sorts of settings that make your work in far2l as comfortable as possible. Run like this:
```
curl -sSL https://raw.githubusercontent.com/unxed/far2ltricks/main/far2ltricks.sh > /tmp/far2ltricks.sh && bash /tmp/far2ltricks.sh && rm /tmp/far2ltricks.sh
```

By default, far2l runs as a GUI application on wxWidgets. Console operation is also supported, `far2l --tty`. In putty, the console version works with [with some limitations](https://github.com/elfmz/far2l/issues/472), the problem is solved by using a [special version of putty](https://github.com/unxed/putty4far2l).

far2l ppa: https://launchpad.net/~far2l-team/+archive/ubuntu/ppa

Please also pay attention to the portable version and AppImage: https://github.com/spvkgn/far2l-portable/

What else is there interesting here?

**deb** — .deb package build script for Debian-based distributions.

**misc** — various auxiliary scripts, mostly obsolete

**themes** — far2l interface design themes

**themes/colorer_smarty** — Smarty support improvements in the Colorer plugin

**unbindkeys** — example scripts showing how to free up the necessary far2l hotkeys occupied by some DEs and terminals
