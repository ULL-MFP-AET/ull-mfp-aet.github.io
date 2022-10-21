#!/bin/zsh
ORG="ULL-MFP-AET-2223"

QUERY='query getInfo($organization: String!) {
  organization(login: $organization) {
    teams(first: 100) {
      totalCount
      edges {
        node {
          name
          members(first: 100) {
            totalCount
            edges {
              memberAccessUrl
              node {
                name
                url
                email
                login               
              }
            }
          }
          url
        }
      }
    }
  }
}'

TEAMS=$(gh api graphql -F organization="$ORG" -f query="$QUERY" )


echo $TEAMS 