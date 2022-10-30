ORG='"ULL-MFP-AET-2223"'
NAME='"aprender-markdown-ana_marlene-hernandez-alu0100199741"'
SINCE='"2022-10-25T00:00:01Z"'
UNTIL='"2022-10-25T23:59:59Z"'
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

echo $QUERY
gh api graphql -f query="$QUERY"