#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"
nomainfile=(templates files)
while read dir
do
    [ -d "$1/$dir" ] ||  mkdir -p "./$1/$dir" && ([[  -z $(echo "${nomainfile[@]:0}" | grep -o $dir)  ]] && echo -e "---\n" >  "./$1/$dir/main.yml")
done <<EOF
tasks
handlers
templates
files
vars
defaults
meta
EOF
