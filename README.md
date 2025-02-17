# Whonix on Mac (Apple Silicon) Installation Guide

This guide will walk you through installing Whonix on a Mac with Apple Silicon (M1/M2) using an automated script.

## Prerequisites

Before you begin, ensure your system meets the following requirements:

- **macOS** with an Apple Silicon chip (M1/M2).
- **Homebrew** installed. If you don't have it, you can install it by following the [official installation guide](https://brew.sh).
- **Docker** installed. You can download it from [Docker's official website](https://www.docker.com/products/docker-desktop).

## Step-by-Step Installation

### 1. Clone the Repository

First, clone this repository to your local machine:
```bash
git clone https://github.com/Goldeneye128/whonix-script.git
cd whonix-script
```

### 2. Make the Script Executable

Ensure the script has execute permissions:
```bash
chmod +x install-whonix.sh
```

### 3. Run the Script

Now, run the installation script as `root` to start the setup:
```bash
sudo ./install-whonix.sh
```

The script will:

- Check if **Homebrew** is installed, and if not, it will install it.
- Install required dependencies like **Docker** and **tmux**.
- Ensure **Docker** is running and properly configured.
- Clone the official **Whonix** repository.
- Run the installation script for **Whonix**.
- Configure the environment (if necessary).

### 4. Post-Installation

Once the installation is complete:

- Docker should be running with Whonix.
- The script will suggest a reboot to apply changes.

## Troubleshooting

### Docker not starting:

If Docker does not start automatically, try opening the **Docker** app manually from the Applications folder or use the following command:
```bash
open -a Docker
```

### Common Issues

- **Permission issues:** Ensure the script is run with `sudo` to avoid permission errors.
- **Docker daemon errors:** If Docker is not running, restart Docker manually.

## Notes

- This script is designed for **macOS** with **Apple Silicon** (M1/M2).
- For additional configuration or to troubleshoot, refer to the [official Whonix documentation](https://www.whonix.org/wiki/Main_Page).
