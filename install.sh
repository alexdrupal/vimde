#!/usr/bin/env bash
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${GREEN}Installing VIMDE...${NC}"
if [[ -f "${HOME}/.vimrc" || -d "$HOME/.vim" ]]; then
    echo -e "Doing backups of your .vim and .vimrc files"
    echo -e "${RED}The .vimrc will be moved to ${HOME}/.vimrc.vimde.backup${NC}"
    echo -e "${RED}The .vim/ will be moved to ${HOME}/.vim.vimde.backup${NC}"
    read -p "Proceed? [y/n]: " -r
    if [[ ! $REPLY =~ ^[yY]$ ]]; then
        echo "Backup is not allowed. Exiting..."
        exit 0
    fi
    if [[ -f "${HOME}/.vimrc" ]]; then
        $(mv "$HOME/.vimrc" "$HOME/.vimrc.vimde.backup")
        if [[ $? -ne 0 ]]; then
            echo "Failed to backup .vimrc. Exiting..."
            exit 1
        fi
    fi
    if [[ -d "${HOME}/.vim" ]]; then
        $(mv "$HOME/.vim" "$HOME/.vim.vimde.backup")
        if [[ $? -ne 0 ]]; then
            echo "Failed to backup .vim. Exiting..."
            exit 1
        fi
    fi
fi

echo "Installing the required PHP packages globally via Composer..."
$(composer global require drupal/coder friendsofphp/php-cs-fixer:2.16.4 divante-ltd/pimcore-coding-standards:0.1.4 magento-ecg/coding-standard:3.1 phpstan/phpstan:0.12.36 phpcompatibility/php-compatibility:9.3.5 magento/magento-coding-standard:5.0)
if [[ $? -ne 0 ]]; then
    echo "Failed to install required packages. Exiting..."
    exit 1
fi

echo "Installing the Silver Searcher Ag from repository..."
sudo apt-get install silversearcher-ag

echo "Copy .vimrc and .vim/ from vimde folder into your homedir: $HOME"
cp -a ./.vim $HOME/
cp ./.vimrc $HOME/

echo -e "${YELLOW}The installer will run VIM to install required VIM extensions. This may take a time.${NC}"
read -p "Proceed? [y/n]: " -r
if [[ ! $REPLY =~ ^[yY]$ ]]; then
    echo "Process stopped. You may manually copy .vim and .vimrc into your $HOME folder. Exiting..."
    exit 0
fi
vim +PlugInstall +qall
echo -e "${YELLOW}Please copy file .vimprojects.example into $HOME/.vimprojects and start setting up your projects${NC}"
echo -e "${GREEN}Finished. Enjoy!${NC}"
