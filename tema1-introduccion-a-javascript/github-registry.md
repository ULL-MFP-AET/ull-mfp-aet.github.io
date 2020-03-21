# GitHub Packages

GitHub Package Registry is a software package hosting service, similar to npmjs.org, rubygems.org, or hub.docker.com, that allows you to host your packages and code in one place. You can host software packages privately or publicly and use them as dependencies in your projects.


## About GitHub Packages

* [About GitHub Packages](https://help.github.com/en/packages/publishing-and-managing-packages/about-github-packages)

You need an access token to publish, install, and delete packages in GitHub Packages. You can use a personal access token to authenticate with your username directly to GitHub Packages or the GitHub API. You can use a `GITHUB_TOKEN` to authenticate using a GitHub Actions workflow.

When you create a personal access token, you can assign the token different scopes depending on your needs. For more information, see "[Creating a personal access token for the command line](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line)" and "[Available scopes](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/#available-scopes)" in the GitHub Developer documentation.

## Configuring npm for use with GitHub Packages

* [Configuring npm for use with GitHub Packages](https://help.github.com/en/packages/using-github-packages-with-your-projects-ecosystem/configuring-npm-for-use-with-github-packages)

### Authenticating with a personal access token

To authenticate by logging in to npm, use the `npm login` command, replacing _USERNAME_ with your GitHub username, _TOKEN_ with your personal access token, and _PUBLIC-EMAIL-ADDRESS_ with your email address.

```
$ npm login --registry=https://npm.pkg.github.com
> Username: USERNAME
> Password: TOKEN
> Email: PUBLIC-EMAIL-ADDRESS
```

### Authenticating with the GITHUB_TOKEN

GitHub provides a token that you can use to authenticate on behalf of GitHub Actions.

* [Authenticating with the GITHUB_TOKEN](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token)

### Publishing a Package

By default, GitHub Packages publishes a package in the GitHub repository you specify in the name field of the _package.json_ file. For example, you would publish a package named `@my-org/test` to the `my-org/test` GitHub repository. You can add a summary for the package listing page by including a _README.md_ file in your package directory. 

For more information, see 

* "[Working with package.json](https://docs.npmjs.com/getting-started/using-a-package.json)" and 
* "[How to create Node.js Modules](https://docs.npmjs.com/getting-started/creating-node-modules)" 
  
in the npm documentation.