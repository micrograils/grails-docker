#!/bin/sh
# vim:sw=4:ts=4:et

set -euo pipefail

# check if the first argument is a flag. such as -version.
if [ "${1:0:1}" = '-' ]; then
	set -- grails "$@"
fi

# from grails 5.x
grails_default_command="|create-app|help|list-profiles|run-app|war|";
if [ -n "$*" ] && [[ $grails_default_command == *"|$1|"* ]]; then
  set -- grails "$@"
fi

exec "$@"
