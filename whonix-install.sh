#!/bin/bash

# Script to automatically install Whonix on Mac with Apple Silicon

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root!" 
  exit 1
fi

# Check if Homebrew is installed
echo "Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Install dependencies (Docker and tmux)
echo "Installing necessary dependencies..."
brew install docker tmux

# Check if Docker is installed
if ! command -v docker &>/dev/null; then
  echo "Docker is not installed. Aborting."
  exit 1
fi

# Start Docker (if it's not running)
echo "Starting Docker..."
open -a Docker

# Wait for Docker to fully start
echo "Waiting for Docker to start..."
sleep 20

# Check Docker status
if ! docker info &>/dev/null; then
  echo "Docker could not be started. Please check the installation."
  exit 1
fi

# Clone the Whonix repository
echo "Cloning Whonix repository..."
git clone https://github.com/Whonix/whonix.git /opt/whonix

# Navigate to the repository directory
cd /opt/whonix || { echo "Error changing directory to /opt/whonix"; exit 1; }

# Run the Whonix setup script
echo "Running the Whonix setup script..."
./whonix-setup.sh

# Whonix environment setup (if needed)
echo "Setting up Whonix environment..."

# Additional configuration steps, if required, such as network setup or configuration
# For example:
# echo "Configuring network..."
# sudo cp /opt/whonix/network_config /etc/network/

echo "Whonix successfully installed and configured!"

# Reminder for the user
echo "Don't forget to reboot your system to apply changes."

# End of the script
exit 0
