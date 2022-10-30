# Get commits of  a student for a given task/lab in a given subject on a given date
# It can be used to check attendance of a student in a lab
ORG='"ULL-MFP-AET-2223"'
LAB="aprender-markdown"
TEAM="ana_marlene-hernandez-alu0100199741"
NAME="\"$LAB-$TEAM\""
DAY="2022-10-20"
BEGIN=17:00:00
END=17:47:59
SINCE="\"${DAY}T${BEGIN}Z\""
UNTIL="\"${DAY}T${END}Z\""
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

#echo $QUERY
gh api graphql -f query="$QUERY" --jq '.data.repository.object.history.nodes' 