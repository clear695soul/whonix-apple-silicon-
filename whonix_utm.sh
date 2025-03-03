#!/bin/bash

# Обновление списка пакетов и установка зависимостей
sudo apt update
sudo apt install -y git curl apt-cacher-ng ruby qemu-utils python3 parted kpartx

# Клонирование репозитория Whonix без аутентификации
GIT_REPO="https://github.com/Whonix/Whonix.git"
DEST_DIR="Whonix"

if [ -d "$DEST_DIR" ]; then
    echo "Директория $DEST_DIR уже существует. Удаляем..."
    sudo rm -rf "$DEST_DIR"
fi

git clone --depth=1 "$GIT_REPO" "$DEST_DIR"

# Переход в директорию Whonix
cd "$DEST_DIR" || exit 1

# Запуск скрипта сборки Whonix для архитектуры arm64 и целевой платформы utm
sudo ./whonix_build --arch arm64 --target utm --flavor whonix-gateway-cli --build
sudo ./whonix_build --arch arm64 --target utm --flavor whonix-workstation-cli --build
