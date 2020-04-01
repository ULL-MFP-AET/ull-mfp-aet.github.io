# Challenge for the programming lab p10-t2-lexer-generator

Write a GitHub Action *Hello World* following the tutorial 
at section [Hello Actions World!]({{site.baseurl}}//tema1-introduccion-a-javascript/creating-javascript-action).

1. Save the action code in repo `hello-js-action-aluXXX`, 
2. Inside repo `use-hello-js-action-aluXXX` save the project using the action and  
3. In repo `hello-js-action-super` build a  repo having the former two as submodules
4. Write your report in the super-repo

## Optional Step

If you feel enthusiastic about GitHub Actions, continue 
using the repo [actions/javascript-action](https://github.com/actions/javascript-action)
as a template and follow the instructions. 
Save the action code in repo `hello-js-action-aluXXX` but in a branch with name `optional`.

To use this new action, you have to reference it in the client repo like this:

```yml
steps:    
  - uses: ULL-ESIT-PL-1920/hello-js-action-aluXXX@optional  # Reference a branch
```

Pay special attention to how the tests were written in this example.

## References

