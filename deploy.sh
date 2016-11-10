#!/bin/bash

# Shamelessly lifted from http://stackoverflow.com/a/246128/670358 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function link {
	rm $1/$2 2>/dev/null
	ln -s ${DIR}/$2 $1/$2
}
function copy {
        rm $1/$2 2>/dev/null
        cp ${DIR}/$2 $1/$2
}

link ~ .SciTEUser.properties
link ~ .gitconfig
copy ~/.config/codeblocks cbKeyBinder10.ini

