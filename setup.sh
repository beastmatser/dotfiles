# Install python3.10.x
sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.10 -y
sudo apt install python3.9 -y
sudo apt install python3.8 -y
sudo apt install python3.7 -y
sudo apt install python3.6 -y

# Install venv for python3.10
sudo apt install python3.10-venv -y
mkdir ~/.venv

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Install a complete toolchain
sudo apt-get update
sudo apt install build-essential -y

# Install nodejs 17.x
curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash - -y
sudo apt install nodejs -y

# Install yarn
sudo npm install -g yarn

# Install zsh
sudo apt install zsh -y

# set shell to zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Setup config files
curl -s https://raw.githubusercontent.com/beastmatser/linux-terminal-setup/master/git/.gitconfig >~/.gitconfig
curl -s https://raw.githubusercontent.com/beastmatser/linux-terminal-setup/master/zsh/.zshrc >~/.zshrc
curl -s https://raw.githubusercontent.com/beastmatser/linux-terminal-setup/master/zsh/.zsh_history >~/.zsh_history
curl -s https://raw.githubusercontent.com/beastmatser/linux-terminal-setup/master/bash/.bash_aliases >~/.bash_aliases
