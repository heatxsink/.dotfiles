#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

REPO_URL=https://github.com/heatxsink/.dotfiles.git
REPO_PATH="$HOME/.dotfiles"

reset_color=$(tput sgr 0)

wait_input() {
	read -p -r "press [enter] to continue."
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

info "~~~ .dotfiles ~~~"
wait_input

info "cloning .dotfiles repo from $REPO_URL into $REPO_PATH"
git clone "$REPO_URL" "$REPO_PATH"

info "changing CWD to $REPO_PATH"
cd "$REPO_PATH" >/dev/null


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

	stow -d stow --verbose 1 --target "$HOME" bash byobu git vim

	case "$(uname -sr)" in
	Darwin*)
		warn "macOS detected."
		stow -d stow --verbose 1 --target "$HOME" bash.macos byobu.macos
		;;
	Linux*)
		warn "Linux detected."
		stow -d stow --verbose 1 --target "$HOME" bash.linux byobu.linux
		;;
	esac

	success "done."

	info "system needs to restart. restart?"

	select yn in "y" "n"; do
		case $yn in
		y)
			sudo shutdown -r now
			break
			;;
		n) exit ;;
		esac
	done
}

trap cleanup SIGINT SIGTERM ERR EXIT

main