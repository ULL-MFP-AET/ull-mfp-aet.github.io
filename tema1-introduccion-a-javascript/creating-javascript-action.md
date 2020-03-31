# Hello Actions World!

## Introduction

In this guide, you'll learn about the basic components needed to create and use a 
packaged JavaScript action. 

To focus this guide on the components needed to package the action,
the functionality of the action's code is minimal. 

The action prints "`Hello World`" in the logs or 
"`Hello [who-to-greet]`" 
if you provide a custom name.

This guide uses the GitHub Actions Toolkit Node.js module to speed up development. 

For more information, see the [actions/toolkit](https://github.com/actions/toolkit) repository.

To ensure your JavaScript actions are compatible with all GitHub-hosted runners (Ubuntu, Windows, and macOS), the packaged JavaScript code you write should be pure JavaScript and not rely on other binaries. 

JavaScript actions run directly on the runner and use binaries that already exist in the virtual environment.

## Prerequisites

Create a new empty repository on GitHub. You can choose any repository name or use `hello-world-javascript-action`. Then on your terminal:

```
[~/.../github-actions-learning]$ mkdir hello-world-javascript-action
[~/.../github-actions-learning]$ cd hello-world-javascript-action/
[~/.../hello-world-javascript-action]$ echo "# hello-world-javascript-action" >> README.md
[~/.../hello-world-javascript-action]$ git init
[~/.../hello-world-javascript-action]$ git add README.md
[~/.../hello-world-javascript-action]$ git commit -m "first commit"
[~/.../hello-world-javascript-action(master)]$ git remote add origin git@github.com:ULL-ESIT-PL-1920/hello-world-javascript-action.git
[~/.../hello-world-javascript-action(master)]$ git push -u origin master
```

Create a `package.json`

```
[~/.../hello-world-javascript-action(master)]$ npm init -y
Wrote to /Users/casiano/local/src/github-actions-learning/hello-world-javascript-action/package.json:

{
  "name": "hello-world-javascript-action",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/ULL-ESIT-PL-1920/hello-world-javascript-action.git"
  },
  "keywords": [],
  "author": "Casiano Rodriguez-Leon <casiano.rodriguez.leon@gmail.com> (https://github.com/crguezl)",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/ULL-ESIT-PL-1920/hello-world-javascript-action/issues"
  },
  "homepage": "https://github.com/ULL-ESIT-PL-1920/hello-world-javascript-action#readme"
}
```

## Create an action metadata file

Create a new file `action.yml` in the `hello-world-javascript-action` directory with the following example code:

```
[~/.../hello-world-javascript-action(master)]$ cat action.yml
```
```yml
name: 'Hello World'
description: 'Greet someone and record the time'
inputs:
  who-to-greet:  # id of input
    description: 'Who to greet'
    required: true
    default: 'World'
outputs:
  time: # id of output
    description: 'The time we greeted you'
runs:
  using: 'node12'
  main: 'index.js'
```

This file defines the `who-to-greet` input and `time` output. 

It also tells the action runner how to start: running `index.js`.

## Add actions toolkit packages

The actions toolkit is a collection of Node.js packages that allow you to quickly build JavaScript actions with more consistency.

The toolkit `@actions/core` package provides an interface to the workflow commands, input and output variables, exit statuses, and debug messages.

The toolkit also offers a `@actions/github` package that returns an authenticated Octokit REST client and access to GitHub Actions contexts.

The toolkit offers more than the core and github packages. For more information, see the <a href="https://github.com/actions/toolkit" target="_blank">actions/toolkit</a> repository.

At your terminal, install the actions toolkit core and github packages.

```
npm install @actions/core
npm install @actions/github
```

Now you should see 

1. a `node_modules` directory with the modules you just installed and 
2. a `package-lock.json` file with the installed module dependencies and the versions of each installed module.

## Write the action code

This action uses the toolkit to get the `who-to-greet` input variable required in the action's metadata file 

```js
const nameToGreet = core.getInput('who-to-greet');
```

and prints `Hello [who-to-greet]` in a debug message in the log. 

```js
console.log(`Hello ${nameToGreet}!`);
```

Next, the script gets the current time and **sets it as an output variable** that actions running later in a job can use.

```js
const time = (new Date()).toTimeString();
core.setOutput("time", time);
```

GitHub Actions provide **context** information about the webhook event, Git refs, workflow, action, and the person who triggered the workflow: 

```
 GITHUB_CONTEXT: {
  ...
  "event_name": "push",
  "event": {
       ...
     "commits": [
       ...
    ],
    ...
    "organization": {
      ...
    },
    "pusher": {
      ...
    },
  ...
}
```

To access the context information, you can use the **github** package. The action you'll write will print the webhook event payload the log.

```js
  const payload = JSON.stringify(github.context.payload, undefined, 2)
  console.log(`The event payload: ${payload}`);
```

Add a new file called `index.js`, with the following code:

```
[~/.../hello-world-javascript-action(master)]$ cat index.js
```
```js
const core = require('@actions/core');
const github = require('@actions/github');

try {
  // `who-to-greet` input defined in action metadata file
  const nameToGreet = core.getInput('who-to-greet');
  console.log(`Hello ${nameToGreet}!`);
  const time = (new Date()).toTimeString();
  core.setOutput("time", time);
  // Get the JSON webhook payload for the event that triggered the workflow
  const payload = JSON.stringify(github.context.payload, undefined, 2)
  console.log(`The event payload: ${payload}`);
} catch (error) {
  core.setFailed(error.message);
}
```

If an error is thrown in the above `index.js` example, `core.setFailed(error.message);` uses the actions toolkit [@actions/core](https://github.com/actions/toolkit/tree/master/packages/core) package to log a message and set a failing exit code.

For more information, see "[Setting exit codes for actions](https://help.github.com/en/actions/building-actions/setting-exit-codes-for-actions)."

## Create a README

To let people know how to use your action, you can create a README file. A README is most helpful when you plan to share your action publicly, but is also a great way to remind you or your team how to use the action.

In your `hello-world-javascript-action` directory, create a `README.md` file that specifies the following information:

1. A detailed description of what the action does.
2. Required input and output arguments.
3. Optional input and output arguments.
4. Secrets the action uses.
5. Environment variables the action uses.
6. An example of how to use your action in a workflow.

```
[~/.../hello-world-javascript-action(master)]$ cat README.md
# Hello world javascript action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

uses: actions/hello-world-javascript-action@v1
with:
  who-to-greet: 'Mona the Octocat'
```

## References

* [Creating a JavaScript action](https://help.github.com/en/actions/building-actions/creating-a-javascript-action)
