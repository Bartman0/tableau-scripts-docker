#!/bin/sh

set -e

print_usage() {
echo "

usage:  $0 COMMAND

Tableau scripts

commands:
  datasource-publish
  datasource-metadata
  help                  Print this help
"
}

case "$1" in
    help)
        print_usage
        ;;
    datasource-publish)
        shift 1
        run_datasource_publish "$@"
        ;;
    *)
        exec "$@"
esac
