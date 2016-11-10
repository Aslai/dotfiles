#!/bin/bash

# Shamelessly lifted from http://stackoverflow.com/a/246128/670358 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function prep {
	rm -r $1
	mkdir -p $(dirname "$1")
}
function link {
	prep "$1/$2"
	ln -s ${DIR}/$2 $1/$2
}
function copy {
        prep "$1/$2"
        cp ${DIR}/$2 $1/$2
}
function render {
        prep "$1/$2"
	args_in=("$@");
	args=();
	for arg in "${args_in[@]:2}"; do
		read -e -p "${arg}: ";
		args=("${args[@]}" "${REPLY}");
	done
        ./$2 "${args[@]}" > "$1/$2"
}

link ~ .SciTEUser.properties
link ~ .gitconfig
copy ~/.config/codeblocks cbKeyBinder10.ini
copy ~/.codeblocks cbKeyBinder10.ini

render ~/.config hexchat/servlist.conf "ZNC Password" "ZNC Port"
link ~/.config hexchat/colors.conf
link ~/.config hexchat/ctcpreply.conf
link ~/.config hexchat/hexchat.conf

link ~/.config antimicro
link ~/.config keepassx