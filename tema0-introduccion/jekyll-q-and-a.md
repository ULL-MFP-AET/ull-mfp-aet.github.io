
This is a common problem between different Jekyll environments.

### Some explanations

We need to understand `site.url` and `site.baseurl` and in which situation we need them. Those variables don't serve the same purpose.

#### `site.url`

By default, this variable is only used in page head for the `canonical` header and the `RSS link`. It's also used in the xml feed to point to site resources as the software that will manage this feed doesn't know resource's urls.

This variable is only necessary for external systems.

#### `site.baseurl`

This variable indicates the root folder of your Jekyll site. By default it is set to `""` (empty string). That means that your Jekyll site is at the root of `http://example.com`.

If your Jekyll site lives in `http://example.com/blog`, you have to set `site.baseurl` to `/blog` (**note the slash**). This will allow assets (css, js) to load correctly.

See how assets are loaded in you head :

    <link rel="stylesheet" href="{{ "/css/main.css" | prepend: site.baseurl }}">
    

that can also be :

    <link rel="stylesheet" href="{{ site.baseurl }}/css/main.css">
    

### Working in different environments

Now you have to test your site locally and to deploy it in production. Sometimes, the `baseurl` is different and the `jekyll build` may not work out of the box in one of those environment.

Here we have two solutions :

#### Use `jekyll serve`

Let's imagine that your site lives in a github repository and is served at `https://username.github.io/myProject`.

You can setup the `baseurl` to `/myProject`. and test your site locally with `jekyll serve`, your site will be served at `http://127.0.0.1:4000/myProject/`

#### Use multiple configuration files

If, for one reason or another, you cannot use `jekyll serve`, you can set a configuration file for both environment and `jekyll build` depending on where you are deploying.

Let's say we have the local site served at `http://localhost` and the production site served at `https://username.github.io/myProject`.

We leave the `_config.yml` with `url: https://username.github.io` and `baseurl: /myProject`

We create a new `_config_dev.yml` with only `url: https://localhost` and `baseurl: ""`

Now to test locally :

    jekyll build --config _config.yml,_config_dev.yml
    

or

    jekyll build --config _config.yml,_config_dev.yml --watch
    

When pushed on production, the <code>jekyll build</code> command will use the default <code>_config.yml</code>.

## Testing

* [Using HTMLProofer From Ruby and Travis](https://github.com/gjtorikian/html-proofer/wiki/Using-HTMLProofer-From-Ruby-and-Travis)

## Jekyll as a Web Service

* [Jekyll JSON API](https://www.techiediaries.com/how-to-use-jekyll-like-a-pro-output-data-as-json/)

## Maths y Jekyll

* [Adding MathJax to a GitHub Pages Jekyll Blog](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html)


## Cursos en YouTube de Jekyll and NetlifyCMS por Thomas Bradley

* [Jekyll](https://www.youtube.com/playlist?list=PLWjCJDeWfDdfVEcLGAfdJn_HXyM4Y7_k-)
* [Jekyll + NetlifyCMS](https://www.youtube.com/playlist?list=PLWjCJDeWfDdcU8zbZZrr6L1zpf_2Eqt_w) 14 Youtube videos
* [Jekyll + Patternbot](https://www.youtube.com/playlist?list=PLWjCJDeWfDdcEBngBwpB8F7wtjZ12PIy0)

## Chen Hui Jing Talks on Jekyll

* [Chen Hui Jing talks on Jekyll](https://www.chenhuijing.com/blog/jekyll/#%F0%9F%91%BE)
* [Chen Hui Jing talks](https://www.chenhuijing.com/talks/#%F0%9F%8F%80) Slides in reveal.js

## Jekyll y Netlify

* [Práctica p8-t3-jekyll-netlify](practicas/p8-t3-jekyll-netlify)
* [Práctica p10-t3-jekyll-search](practicas/p10-t3-jekyll-search)
