#!/bin/bash

CLASSROOM_PATTERN='aet-2324 '
ASSIGNMENT_PATTERN='equipos'

function help() {
  echo "Usage:"
  echo "  ./get-assignment.sh [-c|--classroom <classroom-regexp>] [-a|--assignment <assignment-regexp>]"
  echo
  exit 1
}

POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
  -c | --classroom)
    CLASSROOM_PATTERN=$2
    shift # past argument
    shift # past value
    ;;
  -a | --assignment)
    ASSIGNMENT_PATTERN=$2
    shift # past argument
    shift # past value
    ;;
  -h | --help)
    help
    ;;
  *)
    POSITIONAL_ARGS+=("$1") # save positional arg
    shift # past argument
    ;;
  esac
done


CLASSROOMID=$(gh classroom list --per-page 400 | egrep -i $CLASSROOM_PATTERN | awk  '{ print $1 }')
ASSIGNMENTID=$(gh classroom assignments -c $CLASSROOMID | egrep -i $ASSIGNMENT_PATTERN | awk '{ print $1 }')
gh classroom assignment -a $ASSIGNMENTID
