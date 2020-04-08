# GitHub Apps

Follow the github.lab course by githubtraining:

* [Getting started with GitHub Apps](https://lab.github.com/githubtraining/getting-started-with-github-apps)


## Smee.io

If your application needs to respond to webhooks, you'll need some way to expose localhost to the internet. smee.io is a small service that uses Server-Sent Events to proxy payloads from the webhook source, then transmit them to your locally running application:

* [smee.io](https://smee.io/)

### Use the CLI


                 $ npm install --global smee-client

Then the `smee` command will forward webhooks from `smee.io` to your local development environment.

```
$ smee -u https://smee.io/WJgXrPCZYXL5qvLz
```

For usage info:

```
$ smee --help
```

Use the Node.js client

```
$ npm install --save smee-client
```

Then:

```js
const SmeeClient = require('smee-client')

const smee = new SmeeClient({
  source: 'https://smee.io/WJgXrPCZYXL5qvLz',
  target: 'http://localhost:3000/events',
  logger: console
})

const events = smee.start()

// Stop forwarding events
events.close()
```

### Using Probot's built-in support

```
$ npm install --save smee-client
```

Then set the environment variable:

```
WEBHOOK_PROXY_URL=https://smee.io/WJgXrPCZYXL5qvLz
```

## Probot

* [Probot](https://probot.github.io/): Use pre-built apps to extend GitHub,
and easily build and share your own. 

### Optimized for GitHub.

Receive webhooks and use the authenticated client to access the GitHub API. Granular permissions give each app access only to the data it needs and nothing more.

### Easily scriptable:

Focus on what you want to build. A simple API—built on the latest ES6 JavaScript features—hides the details you don't care about.

```js
module.exports = app => {
  app.on('issues.opened', async context => {
    const params = context.issue({
      body: 'Hello World!'
    })
    await context.github.issues.createComment(params)
  })
}
```

## References

* [Repo crguezl/getting-started-github-app](https://github.com/crguezl/getting-started-github-apps)
