#!/bin/bash

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-autocompletions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

# Install dotfiles
cp .* $HOME

# APT packages
apt-get install gnupg2 nginx vim wget zsh zsh-syntax-highlighting

# Go packages
go get -u github.com/nsf/gocode                 # completion
go get -u github.com/zmb3/gogetdoc              # documentation
go get -u golang.org/x/tools/cmd/goimports      # import resolution/rewriting
go get -u github.com/golang/lint/golint         # linting
go get -u github.com/rogpeppe/godef             # goto definition
go get -u github.com/alecthomas/gometalinter    # metalinting
go get -u golang.org/x/tools/cmd/gorename       # rename go identifiers
