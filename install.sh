#!/usr/bin/bash
LOG="${HOME}/Library/Logs/dotfiles.log"
GITHUB_USER=scrapp08
GITHUB_REPO=dotfiles
DIR="~/.dotfiles"


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
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	_success "Installed OhMyZsh"
	_process "→ Installing Zsh plugins"
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	_success "Installed Zsh plugins"
}


download_dotfiles() {
  _process "→ Creating directory at ${DIR} and setting permissions"
  mkdir -p "${DIR}"

  _process "→ Downloading repository to /tmp directory"
  curl -#fLo /tmp/${GITHUB_REPO}.tar.gz "https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/main"

  _process "→ Extracting files to ${DIR}"
  tar -zxf /tmp/${GITHUB_REPO}.tar.gz --strip-components 1 -C "${DIR}"

  _process "→ Removing tarball from /tmp directory"
  rm -rf /tmp/${GITHUB_REPO}.tar.gz

  [[ $? ]] && _success "${DIR} created, repository downloaded and extracted"

  # Change to the dotfiles directory
  cd "${DIR}"
}


link_dotfiles() {
  # symlink files to the HOME directory.
  if [[ -f "${DIR}/opt/files" ]]; then
    _process "→ Symlinking dotfiles in /configs"

    # Set variable for list of files
    files="${DIR}/opt/files"

    # Store IFS separator within a temp variable
    OIFS=$IFS
    # Set the separator to a carriage return & a new line break
    # read in passed-in file and store as an array
    IFS=$'\r\n'
    links=($(cat "${files}"))

    # Loop through array of files
    for index in ${!links[*]}
    do
      for link in ${links[$index]}
      do
        _process "→ Linking ${links[$index]}"
        # set IFS back to space to split string on
        IFS=$' '
        # create an array of line items
        file=(${links[$index]})
        # Create symbolic link
        ln -fs "${DIR}/${file[0]}" "${HOME}/${file[1]}"
      done
      # set separater back to carriage return & new line break
      IFS=$'\r\n'
    done

    # Reset IFS back
    IFS=$OIFS

    source "${HOME}/.bash_profile"

    [[ $? ]] && _success "All files have been copied"
  fi
}


install() {
  install_xcode-select
  install_homebrew  
  install_misc
  download_dotfiles
  link_dotfiles
}

install
