#!/bin/bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install dotfiles
cp .* $HOME

# Homebrew packages
brew install go gomplate kubectl

# Go packages
go get -u github.com/nsf/gocode                 # completion
go get -u github.com/zmb3/gogetdoc              # documentation
go get -u golang.org/x/tools/cmd/goimports      # import resolution/rewriting
go get -u github.com/golang/lint/golint         # linting
go get -u github.com/rogpeppe/godef             # goto definition
go get -u github.com/alecthomas/gometalinter    # metalinting
