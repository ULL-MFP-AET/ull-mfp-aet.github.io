#!/bin/bash
set -e

REGEXP='.'
EXCLUDE='^$' # Exclude empty lines
file=_data/students.json

POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -f|--file)
     file=$2
     shift # past argument
     shift # past value
     ;;
    -r|--regexp)
      REGEXP="$2"
      shift # past argument
      shift # past value
      ;;
    -e|--exclude)
      EXCLUDE="$2"
      shift # past argument
      shift # past value
      ;;

    -*|--*)
      echo "USAGE"
      echo "  $0 [-f|--file <file>] [-r|--regexp <regexp>]"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

jq '.data.organization.teams.edges[].node.name' $file \
   | grep -Ei ${REGEXP} \
   | grep -Ei -v ${EXCLUDE} \
   | tr -d '"' \
   | tr 'áéíóúñ' 'aeyoun'