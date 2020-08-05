#!/usr/bin/env bash
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${GREEN}Installing VIMDE...${NC}"
if [[ -f "${HOME}/.vimrc" || -d "$HOME/.vim" ]]; then
    echo -e "Doing backups of your .vim and .vimrc files"
    echo -e "${YELLOW}Backup of .vimrc will be stored in ${HOME}/.vimrc.vimde.backup${NC}"
    echo -e "${YELLOW}Backup .vim/ will be stored in ${HOME}/.vim.vimde.backup${NC}"
    read -p "Proceed? [y/n]: " -n 1 -r
    if [[ ! $REPLY =~ ^[yY]$ ]]; then
        echo "Backup is not allowed. Exiting..."
        exit 0
    fi
    if [[ -f "${HOME}/.vimrc" ]]; then
        $(cp "$HOME/.vimrc" "$HOME/.vimrc.vimde.backup")
        if [[ $? -ne 0 ]]; then
            echo "Failed to backup .vimrc. Exiting..."
            exit 1
        fi
    fi
    if [[ -d "${HOME}/.vim" ]]; then
        $(cp -a "$HOME/.vim" "$HOME/.vim.vimde.backup")
        if [[ $? -ne 0 ]]; then
            echo "Failed to backup .vim. Exiting..."
            exit 1
        fi
    fi
fi

echo "Installing the required PHP packages globally via Composer..."
composer global require friendsofphp/php-cs-fixer:2.16.4 divante-ltd/pimcore-coding-standards:0.1.4 magento-ecg/coding-standard:3.1 phpstan/phpstan:0.12.36 phpcompatibility/php-compatibility:9.3.5 magento/magento-coding-standard:5.0

echo "Installing the Silver Searcher Ag from repository..."
sudo apt-get install silversearcher-ag
