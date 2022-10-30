import {
  graphql,
  //GraphQLSchema,
  //GraphQLObjectType,
  //GraphQLString,
} from 'graphql';

let owner = 'ULL-MFP-AET-2223';
let repoName = 'ull-mfp-aet-2223.github.io';
let branch = 'main';
let since = '2022-10-20' //a 'committedDate' from the repo
const commitFields = `
  id,
  oid,
  messageHeadline,
  message,
  committedDate,
  authoredDate,
  pushedDate,
  author {
      name,
      email,
      user {
          login
      }
  },
  history(first: 0) {
      totalCount
  }
`;

let request = `{
    repository(owner: "${owner}", name:"${repoName}") {
        object(expression: "${branch}") {
            ... on Commit {
                history(first: 100, since: "${since}") {
                    nodes {
                        ${commitFields}
                    }
                }
            }
        }
    }
  }`;

console.log(request);

let { repository } = await graphql(request);

console.log(repository);
//console.log(repository.object.history.nodes);
