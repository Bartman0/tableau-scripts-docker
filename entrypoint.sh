#!/bin/sh

set -e

print_usage() {
commands=$(cd /scripts; ls -1 *.py)
echo "
usage:  $0 COMMAND

Tableau scripts

commands:
  help                  Print this help
"
for c in ${commands}
do
    echo "  ${c}"
done
}

command="$1"
case "$command" in
    help)
        print_usage
        ;;
    *.py)
        shift 1
        python /scripts/"$command" "$@"
        ;;
    *)
        exec "$@"
        ;;
esac
