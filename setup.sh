# Install python3.10.x
sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.10 -y

# setup python alias
echo "alias python=python3.10" >> ~/.bash_aliases

# Install venv for python3.10
sudo apt install python3.10-venv -y
mkdir ~/.venv

# Install nodejs 17.x
curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt install -y nodejs

# Install yarn
sudo npm install -g yarn

# Install zsh
sudo apt install zsh -y
# set shell to zsh
chsh -s $(which zsh)
# add bash_aliases configuration to zsh
echo "
if [ -f ~/.bash_aliases ]; then
.  ~/.bash_aliases
fi
" >> ~/.zshrc
# add activate venv command
echo "
function venv:activate () {
    echo "Activating virtual environment..."
    if [ -d ~/.venv/\$1/ ]; then
        source ~/.venv/\$1/bin/activate
    else
        echo "\$1 is not a valid virtual environment"
    fi
}" >> ~/.zshrc

# add create venv command
echo "
function venv:create () {
    echo \"Creating virtual environment...\"
    if [ -d ~/.venv/\$1 ]; then
        echo \"\$1 is already a virtual environment\"
    else
        python3.10 -m venv ~/.venv/\$1
    fi
}" >> ~/.zshrc

# add delete venv command
echo "
function venv:delete {
    echo \"Deleting virtual environment...\"
    if [ -d ~/.venv/\$1/ ]; then
        rm -rf ~/.venv/\$1/
    else
        echo  \"\$1 is not a valid virtual environment\"
    fi
}" >> ~/.zshrc
# add a list venv command
echo "
function venv:list {
    echo \"Listing virtual environments...\"
    if [ -d ~/.venv/ ]; then
        ls ~/.venv/
    else
        echo \"No virtual environments found\"
    fi
}" >> ~/.zshrc

# set aliases for venv commands
echo "alias v:activate=\"venv:activate\"" >> ~/.bash_aliases
echo "alias v:create=\"venv:create\"" >> ~/.bash_aliases
echo "alias v:delete=\"venv:delete\"" >> ~/.bash_aliases
echo "alias v:list=\"venv:list\"" >> ~/.bash_aliases
echo "alias v:a=\"venv:activate\"" >> ~/.bash_aliases
echo "alias v:c=\"venv:create\"" >> ~/.bash_aliases
echo "alias v:d=\"venv:delete\"" >> ~/.bash_aliases
echo "alias v:l=\"venv:list\"" >> ~/.bash_aliases

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# append to oh my zsh plugins
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# append to oh my zsh plugins
sed -i 's/plugins=(git zsh-autosuggestions)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
