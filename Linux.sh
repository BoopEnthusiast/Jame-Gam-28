#!/bin/sh
echo -ne '\033c\033]0;Jame Gam 28\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Linux.x86_64" "$@"
