#!/bin/bash
PATTERN="aet-2324-"
if [ -n "$1" ]; then
  PATTERN="$1"
fi
ALUORGS=$(gh org list -L 300 | grep -i $PATTERN)

for i in $(echo "$ALUORGS" | awk '{print $1}'); do
  echo "Org: $i"
  gh org-members -j -o $i | jq '.[] | {  name, login, role }'
done
