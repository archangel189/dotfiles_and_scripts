#!/bin/bash

set -euo pipefail

USER_PATH=/home/arimbun

# APT packages
sudo apt-get update && sudo apt-get install -y apt-transport-https curl debian-keyring gcc gnupg2 make nginx vim wget zsh zsh-syntax-highlighting software-properties-common

# Go programming language
mkdir -p $USER_PATH/go
wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
tar -xvf go1.13.3.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$USER_PATH/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-autocompletions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Install dotfiles
cp .* $HOME

# Go packages
go get -u github.com/nsf/gocode                 # completion
go get -u github.com/zmb3/gogetdoc              # documentation
go get -u golang.org/x/tools/cmd/goimports      # import resolution/rewriting
go get -u github.com/golang/lint/golint         # linting
go get -u github.com/rogpeppe/godef             # goto definition
go get -u github.com/alecthomas/gometalinter    # metalinting
go get -u golang.org/x/tools/cmd/gorename       # rename go identifiers
