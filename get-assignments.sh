PATTERN='aet-2324 '
if [ -n "$1" ]; then
  PATTERN="$1"
fi
ID=$(gh classroom list --per-page 400 | egrep -i $PATTERN | awk  '{ print $1 }')
gh classroom assignments -c $ID