ALUORGS=$(gh org list -L 300 | grep -i aet-2324-)

for i in $(echo "$ALUORGS" | awk '{print $1}'); do
  echo "Org: $i"
  gh org-members -j -o $i | jq '.[] | {  name, login, role }'
done
