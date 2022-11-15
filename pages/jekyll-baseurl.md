---
title: "Understanding site.url and site.baseurl"
toc: true
---

# {{ page.title }}

## Stackoverflow Question: Change site.url to localhost during jekyll local development 

* [Change site.url to localhost during jekyll local development](https://stackoverflow.com/questions/27386169/change-site-url-to-localhost-during-jekyll-local-development)


This is a common problem between different Jekyll environments.

We need to understand `site.url` and `site.baseurl` and in which situation we need them. Those variables don't serve the same purpose.

## site.url

By default, this variable is only used in page head for the `canonical` header and the `RSS link`. It's also used in the xml feed to point to site resources as the software that will manage this feed doesn't know resource's urls.

This variable is only necessary for external systems.

## site.baseurl

This variable indicates the root folder of your Jekyll site. By default it is set to `""` (empty string). That means that your Jekyll site is at the root of `http://example.com`.

If your Jekyll site lives in `http://example.com/blog`, you have to set `site.baseurl` to `/blog` (**note the slash**). This will allow assets (css, js) to load correctly.

See how assets are loaded in you head :

    <link rel="stylesheet" href="{{ "/css/main.css" | prepend: site.baseurl }}">
    

that can also be :

    <link rel="stylesheet" href="{{ site.baseurl }}/css/main.css">
    

![]({{ site.baseurl }}/assets/images/what-is-a-baseurl.jpeg)

## Working in different environments

Now you have to test your site locally and to deploy it in production. Sometimes, the `baseurl` is different and the `jekyll build` may not work out of the box in one of those environment.

Here we have two solutions :

## Use `jekyll serve`

Let's imagine that your site lives in a github repository and is served at 

       https://username.github.io/myProject


You can setup the `baseurl` to `/myProject` and test your site locally with 

    jekyll serve

Your site will be served at `http://127.0.0.1:4000/myProject/`

## Use multiple configuration files

If, for one reason or another, you cannot use `jekyll serve`, you can set a configuration file for both environment and `jekyll build` depending on where you are deploying.

Let's say we have the local site served at `http://localhost` and the production site served at `https://username.github.io/myProject`.

We leave the `_config.yml` with `url: https://username.github.io` and `baseurl: /myProject`

We create a new `_config_dev.yml` with only 

```
url: https://localhost` 
``` 

and 

```
baseurl: ""
```

Now to test locally :

    jekyll build --config _config.yml,_config_dev.yml
    

or

    jekyll build --config _config.yml,_config_dev.yml --watch
    

When pushed on production, the <code>jekyll build</code> command will use the default <code>_config.yml</code>.
