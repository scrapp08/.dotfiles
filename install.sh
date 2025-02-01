#!/usr/bin/bash
LOG="${HOME}/Library/Logs/dotfiles.log"
GITHUB_USER=scrapp08
GITHUB_REPO=.dotfiles
DIR=".dotfiles"


_process() {
  echo "$(date) PROCESSING:  $@" >> $LOG
  printf "$(tput setaf 6) %s...$(tput sgr0)\n" "$@"
}


_success() {
  local message=$1
  printf "%s✓ Success:%s\n" "$(tput setaf 2)" "$(tput sgr0) $message"
}


install_xcode-select() {
	_process "→ Installing Xcode command-line tools"   
	xcode-select --install
	xcode-select -v
	[[ $? ]] \
	&& _success "Installed Xcode command-line tools"
}


download_dotfiles() {
	_process "→ Downloading dotfiles"
	cd "$HOME"
	git clone https://github.com/scrapp08/.dotfiles.git
    [[ $? ]] && _success "$HOME/${DIR} created, repository downloaded"

  # Change to the dotfiles directory
  cd "$HOME/${DIR}"
}


link_dotfiles() {
	_process "→ Sym-linking dotfiles"
	ln -s ~/.dotfiles/configs/gitconfig ~/.gitconfig
	ln -s ~/.dotfiles/configs/nvim/ ~/.config/nvim/
	ln -s ~/.dotfiles/configs/p10k.zsh ~/.p10k.zsh
	ln -s ~/.dotfiles/configs/vimrc ~/.vimrc
	ln -s ~/.dotfiles/configs/yt-dlp/ ~/.config/yt-dlp/
	ln -s ~/.dotfiles/configs/zshrc ~/.zshrc
	_success "Linked Dotfiles"
}


install_homebrew() {
	_process "→ Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ed/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"

	_process "→ Running brew doctor"
	brew doctor
	[[ $? ]] \
	&& _success "Installed Homebrew"
}


install_misc() {
	_process "→ Installing brews"
	brew bundle --file ~/.dotfiles/etc/Brewfile
	_success "Installed brews"
	_process "→ Installing OhMyZsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
	_success "Installed OhMyZsh"
	_process "→ Installing Zsh plugins"
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
	_success "Installed p10k"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	_success "Installed Zsh plugins"
}


install() {
  install_xcode-select
  download_dotfiles
  link_dotfiles
  install_homebrew  
  install_misc
}

install
