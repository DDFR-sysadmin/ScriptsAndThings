# Очищаем содержимое machine-id, но оставляем сам файл пустым
echo -n > /etc/machine-id

# Удаляем machine-id в директории D-Bus и заменяем его ссылкой
rm -f /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

#Чистим ssh для пущей секьюрности
rm -f /etc/ssh/ssh_host_*

# Удаляем сохраненные лизы DHCP
rm -rf /var/lib/dhcp/*
rm -rf /var/lib/NetworkManager/*

# Очищаем правила udev чтобы интерфейс не переименовался
rm -f /etc/udev/rules.d/70-persistent-net.rules


#Очищаем кэш пакетного менеджера apt, удаляем ненужные зависимости
apt autoremove -y
apt clean

# Очищаем кэш и мусро
rm -rf /tmp/*
rm -rf /var/tmp/*

#Очищаем логи
find /var/log -type f -exec truncate --size=0 {} \;



# Очищаем историю команд текущей сессии
history -cy
cat /dev/null > ~/.bash_history
cat /dev/null > ~/.zsh_history
