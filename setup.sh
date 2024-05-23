#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

REPO_URL=git@github.com:heatxsink/.dotfiles.git
REPO_PATH="$HOME/.dotfiles"

reset_color=$(tput sgr 0)

wait_input() {
	read -p "press [enter] to continue."
}

info() {
	printf "%s[*] %s%s\n" "$(tput setaf 4)" "$1" "$reset_color"
}

success() {
	printf "%s[*] %s%s\n" "$(tput setaf 2)" "$1" "$reset_color"
}

err() {
	printf "%s[*] %s%s\n" "$(tput setaf 1)" "$1" "$reset_color"
}

warn() {
	printf "%s[*] %s%s\n" "$(tput setaf 3)" "$1" "$reset_color"
}

cleanup() {
	info "cleaning up."
}

info "~~~ .dotfiles ~~~"
wait_input

if [ ! -d "$REPO_PATH" ]; then
	info "cloning .dotfiles repo from $REPO_URL into $REPO_PATH"
	git clone "$REPO_URL" "$REPO_PATH"
fi

info "changing CWD to $REPO_PATH"
cd "$REPO_PATH" >/dev/null
git pull

setup() {
	local files=(
		".gitconfig"
		".vimrc"
		".bash_aliases"
		".bash_functions"
		".bashrc"
		".bash_profile"
		".profile"
	)
	
	local folders=(
		".config/byobu"
		".config/git"
		".config/skhd"
		".config/yabai"
		".config/alacritty"
	)

	info "removing existing files ..."
	for f in "${files[@]}"; do
		rm -f "$HOME/$f" || true
	done

	info "creating folders ..."
	for d in "${folders[@]}"; do
		rm -rf "${HOME:?}/$d" || true
		mkdir -p "$HOME/$d"
	done
}

main() {
	info "setting up .dotfiles"

	wait_input
	setup

	case "$(uname -sr)" in
	Darwin*)
		warn "Darwin detected."
		. scripts/darwin.sh
		macos_defaults
		brew_install
		stow -d stow --verbose 1 --target "$HOME" bash.macos yabai skhd
		;;
	Linux*)
		warn "Linux detected."
		stow -d stow --verbose 1 --target "$HOME" bash.linux 
		;;
	esac

	stow -d stow --verbose 1 --target "$HOME" byobu git vim alacritty
	
	success "done."
	
	success "kthxbai!"
}

trap cleanup SIGINT SIGTERM ERR EXIT

main
