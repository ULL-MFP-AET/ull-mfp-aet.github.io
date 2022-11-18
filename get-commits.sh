#!/bin/bash

# Get commits of  a student for a given task/lab in a given subject on a given date
# It can be used to check attendance of a student in a lab

DAY="2022-10-27"
BEGIN=00:00:00
END=23:59:59

#ORG='"ULL-MFP-AET-2223"'
ORG=\"$(gh pwd)\"
#LAB=asignatura-website
LAB=$(gh pwd-lab)

STUDENT_NAMES_FILE=_data/team-names.txt

POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -o|--ORG)
     ORG=$2
     shift # past argument
     shift # past value
     ;;
    -l|--lab)
      LAB="$2"
      shift # past argument
      shift # past value
      ;;
    -d|--day)
      DAY="$2"
      shift # past argument
      shift # past value
      ;;
    -f|--file)
      STUDENT_NAMES_FILE="$2"
      shift # past argument
      shift # past value
      ;;
    -b|--begin)
      BEGIN="$2"
      shift # past argument
      shift # past value
      ;;
    -e|--end)
      END="$2"
      shift # past argument
      shift # past value
      ;; 

    -*|--*)
      echo "USAGE"
      echo "  $0 [-o|--ORG <ORG>] [-l|--lab <lab>] [-d|--day <year-month-day>] [-f|--file <file>] [-b|--begin <HH:MM:SS>] [-e|--end <HH:MM:SS>]"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done


function getTeams() {
  export STUDENT_NAMES_FILE
  REGEXP='^$|^#'
  export REGEXP

  # Acentos, blancos y ñ
  IFS=$'\n'
  #TEAMS=$(cat _data/team-names.txt | tr -d ' "' |tr 'áéíóúñ' 'aeyoun')
  TEAMS=$(cat ${STUDENT_NAMES_FILE} | grep -E -v ${REGEXP} | tr -d ' "' |tr 'áéíóúñ' 'aeyoun') 
}

function getCommits() {
  local NAME=\"$LAB-$TEAM\"
  local SINCE="\"${DAY}T${BEGIN}Z\""
  local UNTIL="\"${DAY}T${END}Z\""


  #echo $NAME

  local QUERY='
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

   local commits=($(gh api graphql -f query="$QUERY"  --jq '.data.repository.object.history.nodes | { history: ., total: . | length }')) 
   local namedCommits=$(jq -c --arg value4 "$LAB-$TEAM" '. + { "name": $value4 }' <<<"$commits")
   result+=("${namedCommits}")
}

getTeams
result=()
for TEAM in $TEAMS
do
 #echo "Team: $TEAM"
 getCommits
done

IFS=, ; 
echo "[${result[*]}]"

     
