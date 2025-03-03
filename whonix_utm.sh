#!/bin/bash

# Обновление списка пакетов и установка зависимостей
sudo apt update
sudo apt install -y git curl apt-cacher-ng ruby qemu-utils python3 parted kpartx

# Клонирование репозитория Whonix
git clone --depth=1 https://github.com/Whonix/Whonix

# Переход в директорию Whonix
cd Whonix

# Запуск скрипта сборки Whonix для архитектуры arm64 и целевой платформы utm
sudo ./whonix_build --arch arm64 --target utm --flavor whonix-gateway-cli --build
sudo ./whonix_build --arch arm64 --target utm --flavor whonix-workstation-cli --build
