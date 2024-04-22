#!/bin/bash

echo -e "\nОтключаем поддержку XInputExtension в /usr/lib/far2l/far2l_ttyx.broker"

# Проверяем, существует ли файл
if [ -f "/usr/lib/far2l/far2l_ttyx.broker" ]; then
    # Применяем изменения к файлу
    sudo perl -pi -e 's/XInputExtension/!InputExtension/g' /usr/lib/far2l/far2l_ttyx.broker
    
    # Проверяем, были ли внесены изменения
    if grep -q 'XInputExtension' "/usr/lib/far2l/far2l_ttyx.broker"; then
        echo -e "\e[91mОШИБКА: изменения не были внесены в файл.\e[0m"
    else
        echo -e "\e[92mИзменения успешно внесены в файл :)\e[0m"
    fi
else
    echo -e "\e[91mОШИБКА: файл не существует.\e[0m"
fi
echo "Нажмите любую клавишу..."
read
