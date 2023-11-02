#!/bin/bash
PATTERN="aet-2324-"
if [ -n "$1" ]; then
  PATTERN="$1"
fi
gh classroom list --per-page 400 | grep -i $PATTERN | awk '{print $2, $3}'