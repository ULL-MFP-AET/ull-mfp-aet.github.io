# GitHub Apps

Follow the github.lab course by githubtraining:

* [Getting started with GitHub Apps](https://lab.github.com/githubtraining/getting-started-with-github-apps)


## Smee.io

If your application needs to respond to webhooks, you'll need some way to expose localhost to the internet. smee.io is a small service that uses Server-Sent Events to proxy payloads from the webhook source, then transmit them to your locally running application:

* [smee.io](https://smee.io/)



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
