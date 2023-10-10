gh api --paginate /user/memberships/orgs --jq '
  [ 
    .[].organization 
    | { name: .login, url: .url  } 
    | select(
        .name | test("ULL-MFP-AET-2324-"; "i")
      ) 
  ]' > _data/student-orgs.json