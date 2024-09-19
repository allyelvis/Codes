#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install Git
echo "Installing Git..."
sudo apt install -y git

# Install curl
echo "Installing curl..."
sudo apt install -y curl

# Install Python and pip
echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Verify installations
echo "Verifying installations..."
git --version
python3 --version
pip3 --version
node -v
npm -v

# Install VS Code
echo "Installing Visual Studio Code..."
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ${USER}

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Nix package manager
echo "Installing Nix package manager..."
curl -L https://nixos.org/nix/install | sh

# Set up environment for Nix
. /home/${USER}/.nix-profile/etc/profile.d/nix.sh

# Clone user's GitHub repository
echo "Cloning user's GitHub repository..."
git clone https://github.com/AllyElvis/aenzbi.git ~/aenzbi

# Install project dependencies
echo "Installing project dependencies..."
cd ~/aenzbi
npm install

# Install global npm packages if required (e.g., create-react-app)
echo "Installing global npm packages..."
sudo npm install -g create-react-app

# Cleanup
echo "Cleaning up..."
rm microsoft.gpg
rm get-docker.sh


# Display completion message
echo "Setup and installation complete! Please restart your terminal or log out and back in to apply changes."

# Reminder for Docker
echo "Remember to log out and back in or restart your system to apply Docker group changes."