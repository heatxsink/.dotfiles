# .bash_functions

function retryssh() {
	read -p "Enter the hostname or IP of your server :" servername
	until ssh $servername; do
		sleep 5
	done
}

export -f retryssh

function ytdlpl() {
	youtube-dl "$@" -i -x -o "$HOME/Music/youtube/%(artist)s-%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s" "$(xsel)"
}

export -f ytdlpl

function speak() {
	arg1=$1
	echo "$arg1" | /usr/bin/espeak -s 160 -a 100 -g 4
}

export -f speak

