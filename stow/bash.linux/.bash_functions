# .bash_functions

retryssh() {
	read -p "Enter the hostname or IP of your server :" servername
	until ssh $servername; do
		sleep 5
	done
}

ytdlpl() {
	youtube-dl "$@" -i -x -o "$HOME/Music/youtube/%(artist)s-%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s" "$(xsel)"
}

function speak() {
	arg1=$1
	echo "$arg1" | /usr/bin/espeak -s 160 -a 100 -g 4
}

