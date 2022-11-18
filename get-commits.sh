#!/bin/bash

# Get commits of  a student for a given task/lab in a given subject on a given date
# It can be used to check attendance of a student in a lab

#ORG='"ULL-MFP-AET-2223"'
ORG=\"$(gh pwd)\"
#echo $ORG

#LAB=asignatura-website
LAB=$(gh pwd-lab)
#echo $LAB

# Acentos, blancos y ñ
IFS=$'\n'
TEAMS=$(cat _data/team-names.txt | tr -d ' "' |tr 'áéíóúñ' 'aeyoun')

DAY="2022-11-17"
BEGIN=00:00:00
END=23:59:59

SINCE="\"${DAY}T${BEGIN}Z\""
UNTIL="\"${DAY}T${END}Z\""


result=()

for TEAM in $TEAMS
do
  #echo "Team: $TEAM"
  NAME=\"$LAB-$TEAM\"

  #echo $NAME

  QUERY='
  {
      repository(owner: '"$ORG"', name: '"$NAME"') {
        object(expression: "main") {
          ... on Commit {
            history(first: 100, since: '"$SINCE"', until: '"$UNTIL"') {
              nodes {
                id
                oid
                messageHeadline
                message
                committedDate
                authoredDate
                pushedDate
                author {
                  name
                  email
                  user {
                    login
                  }
                }
                history(first: 0) {
                  totalCount
                }
              }
            }
          }
        }
      }
    }
  '

   commits=($(gh api graphql -f query="$QUERY"  --jq '.data.repository.object.history.nodes | { history: ., total: . | length }')) 
   namedCommits=$(jq -c --arg value4 "$LAB-$TEAM" '. + { "name": $value4 }' <<<"$commits")
   result+=("${namedCommits}")

done

IFS=, ; 
echo "[${result[*]}]"

     
