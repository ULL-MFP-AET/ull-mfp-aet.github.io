# Jekyll: Como preparar un informe de Prácticas usando GitHub Pages

* [Jekyll]({{site.baseurl}}/tema1-introduccion-a-javascript/jekyll/)
* [Jekyll docs](https://jekyllrb.com/docs/)
* [Using Jekyll with Bundler](https://jekyllrb.com/tutorials/using-jekyll-with-bundler/)
* [GitHub Pages](https://pages.github.com/)
* El módulo npm [gh-pages](https://www.npmjs.com/package/gh-pages) para simplificar el despliegue a GitHub: `gh-pages -d _site`
* [HTMLProofer](https://github.com/gjtorikian/html-proofer) para testear la salud de  tu website


## Una Práctica Cualquiera

- [Un repo cualquiera de una práctica](https://github.com/ULL-ESIT-PL-1920/p1-t1-iaas-Jorge-Acevedo)
  
```
[~/.../src/jekyll-learning]$ git clone git@github.com:ULL-ESIT-PL-1920/p1-t1-iaas-Jorge-Acevedo.git
Cloning into 'p1-t1-iaas-Jorge-Acevedo'...
remote: Enumerating objects: 23, done.
remote: Counting objects: 100% (23/23), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 23 (delta 2), reused 9 (delta 2), pack-reused 0
Receiving objects: 100% (23/23), 409.41 KiB | 1.46 MiB/s, done.
Resolving deltas: 100% (2/2), done.
[~/.../src/jekyll-learning]$ cd p1-t1-iaas-Jorge-Acevedo/
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ ls -la
total 8
drwxr-xr-x   5 casiano  staff   160 10 mar 08:24 .
drwxr-xr-x   9 casiano  staff   288 10 mar 08:24 ..
drwxr-xr-x  12 casiano  staff   384 10 mar 08:24 .git
-rw-r--r--   1 casiano  staff  3555 10 mar 08:24 README.md
drwxr-xr-x  11 casiano  staff   352 10 mar 08:24 img
```

## Generando un Gemfile

```
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ bundle init
Writing new Gemfile to /Users/casiano/local/src/jekyll-learning/p1-t1-iaas-Jorge-Acevedo/Gemfile
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ ls -la
total 16
drwxr-xr-x   6 casiano  staff   192 10 mar 08:25 .
drwxr-xr-x   9 casiano  staff   288 10 mar 08:24 ..
drwxr-xr-x  12 casiano  staff   384 10 mar 08:24 .git
-rw-r--r--   1 casiano  staff   146 10 mar 08:25 Gemfile
-rw-r--r--   1 casiano  staff  3555 10 mar 08:24 README.md
drwxr-xr-x  11 casiano  staff   352 10 mar 08:24 img
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ cat Gemfile
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$
```

## bundle config path 

The location to install the specified gems to. This defaults to Rubygems' setting. Bundler shares this location with Rubygems, `gem install ...` will have gem installed there, too. Therefore, gems installed without a `--path` ... setting will show up by calling `gem lis`t. Accordingly, gems installed to other locations will not get listed.

```
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ bundle config
Settings are listed in order of priority. The top value will be used.
local.sinatra
Set for the current user (/Users/casiano/.bundle/config): "/Users/casiano/local/src/ruby/sinatra/sinatra-src"

build.nokogiri
Set for the current user (/Users/casiano/.bundle/config): "--use-system-libraries"

path
Set for the current user (/Users/casiano/.bundle/config): "vendor/bundle"
```

```
bundle config path 'vendor/bundle'
```

## Gem github-pages

* [github-pages gem](https://github.com/github/pages-gem)

1. Add the following to your project's Gemfile:  

  ```ruby
  gem 'github-pages', group: :jekyll_plugins
  ```

2. Run `bundle install`

### Jekyll is already installed

You are not required to install Jekyll separately. Once the `github-pages` gem is installed, you can build your site using `jekyll build`, or preview your site using `jekyll serve`.

* For more information about installing Jekyll locally, please see [the GitHub Help docs on the matter](https://help.github.com/articles/using-jekyll-with-pages#installing-jekyll).

### Gemfile with github-pages

```
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ cat Gemfile
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem 'github-pages', group: :jekyll_plugins
```

* [How to manage groups of gems](https://bundler.io/guides/groups.html)

## bundle install

```
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies....
Fetching concurrent-ruby 1.1.6
Installing concurrent-ruby 1.1.6
...
Installing github-pages 204
Bundle complete! 1 Gemfile dependency, 85 gems now installed.
Bundled gems are installed into `./vendor/bundle`
```

```
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ ls -l
total 16
-rw-r--r--   1 casiano  staff   190 10 mar 08:36 Gemfile
-rw-r--r--   1 casiano  staff  3555 10 mar 08:24 README.md
drwxr-xr-x  11 casiano  staff   352 10 mar 08:24 img
drwxr-xr-x   3 casiano  staff    96 10 mar 08:36 vendor
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ tree -L 2 vendor/
vendor/
└── bundle
    ├── bin
    ├── build_info
    ├── bundler.lock
    ├── cache
    ├── doc
    ├── extensions
    ├── gems
    └── specifications

8 directories, 1 file
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$
```

### Jekyll 

Vemos que una versión de `jekyll` compatible con GitHub Pages (2020) ha sido instalada:

```
[~/.../jekyll-learning/p1-t1-iaas-Jorge-Acevedo(master)]$ ls -l vendor/bundle/bin/
total 96
-rwxr-xr-x  1 casiano  staff  562 10 mar 08:37 commonmarker
-rwxr-xr-x  1 casiano  staff  526 10 mar 08:38 gemoji
-rwxr-xr-x  1 casiano  staff  562 10 mar 08:39 github-pages
-rwxr-xr-x  1 casiano  staff  526 10 mar 08:38 jekyll
-rwxr-xr-x  1 casiano  staff  538 10 mar 08:38 kramdown
-rwxr-xr-x  1 casiano  staff  526 10 mar 08:38 listen
-rwxr-xr-x  1 casiano  staff  538 10 mar 08:39 nokogiri
-rwxr-xr-x  1 casiano  staff  524 10 mar 08:38 rougify
-rwxr-xr-x  1 casiano  staff  544 10 mar 08:38 safe_yaml
-rwxr-xr-x  1 casiano  staff  514 10 mar 08:38 sass
-rwxr-xr-x  1 casiano  staff  530 10 mar 08:38 sass-convert
-rwxr-xr-x  1 casiano  staff  514 10 mar 08:38 scss
```

### Themes

Se han instalado diversos temas/estilos


```
~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ tree vendor/bundle/gems/ | grep jekyll-theme
├── jekyll-theme-architect-0.1.1
│   │   ├── jekyll-theme-architect.scss
├── jekyll-theme-cayman-0.1.1
│   │   ├── jekyll-theme-cayman.scss
├── ...
├── jekyll-theme-time-machine-0.1.1
```

* [Github pages Supported themes](https://pages.github.com/themes/)
  * Tema [midnight](https://github.com/pages-themes/midnight)
* [Jekyll Themes](https://jekyllrb.com/docs/themes/)

## Adding a Theme to our Website

```
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ cat _config.yml
theme: jekyll-theme-midnight
```

## Build the site

```
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ bundle exec jekyll build
Configuration file: /Users/casiano/local/src/jekyll-learning/p1-t1-iaas-Jorge-Acevedo/_config.yml
Invalid theme folder: _includes
Invalid theme folder: _includes
            Source: /Users/casiano/local/src/jekyll-learning/p1-t1-iaas-Jorge-Acevedo
       Destination: /Users/casiano/local/src/jekyll-learning/p1-t1-iaas-Jorge-Acevedo/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
   GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
                    done in 0.908 seconds.
 Auto-regeneration: disabled. Use --watch to enable.
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ tree _site
_site
├── README.md
├── assets
│   ├── css
│   │   ├── ie.scss
│   │   └── style.css
│   ├── fonts
│   │   ├── OpenSans-Bold-webfont.eot
│   │   ├── ...
│   │   └── OpenSans-SemiboldItalic-webfont.woff
│   ├── images
│   │   ├── bullet.png
│   │   ├── hr.gif
│   │   └── nav-bg.gif
│   └── js
│       └── respond.js
├── img
│   ├── figura1.png
│   ├── ...
│   └── figura9.png
└── index.html

6 directories, 49 files
```

## Starting a file server on the `_site`directory 

Observe que el server arrancado es un seridor de ficheros estático que nada tiene que ver con Jekyll:

```
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ cd _site/
[~/.../_site(master)]$ http-server
Starting up http-server, serving ./
Available on:
  http://127.0.0.1:8083
  http://10.150.22.51:8083
  http://10.213.3.51:8083
Hit CTRL-C to stop the server
```

![captura de pantalla con errores de imagenes]({{site.baseurl}}/assets/images/jekyll-learning.png)

## Adding Variables in `_config.yml`

* [Jekyll Variables](https://jekyllrb.com/docs/variables/)
  
```
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ cat _config.yml
title: Práctica de IAAS
subtitle: 'Itinerario de Computación. Grado en Ingeniería Informática. ULL. Curso 2019/2020'
description: '3º. 2º cuatrimestre. Itinerario de Computación. Grado en Ingeniería Informática. ULL'
author: Jorge Acevedo
theme: jekyll-theme-midnight
```

### Using the Variables

```
[~/.../p1-t1-iaas-Jorge-Acevedo(master)]$ head -n 3 README.md
# {{ site.author }}: p1-t1-iaas
En este informe se desarrollará un resumen de los pasos seguidos para configurar la máquina del *iaas* que se me ha asignado para la asignatura de *Procesadores de lenguajes*.
```

![]({{site.baseurl}}/assets/images/jekyll-learning-variables.png)


## `site.url`

We need to understand `site.url` and `site.baseurl` and in which situation we need them. Those variables don't serve the same purpose.

By default, this variable is only used in page head for the `canonical` header and the `RSS link`. It's also used in the xml feed to point to site resources as the software that will manage this feed doesn't know resource's urls.

This variable is only necessary for external systems.

## `site.baseurl`

This variable indicates the root folder of your Jekyll site. By default it is set to `""` (empty string). That means that your Jekyll site is at the root of `http://example.com`.

If your Jekyll site lives in `http://example.com/blog`, you have to set `site.baseurl` to `/blog` (**note the slash**). This will allow assets (css, js) to load correctly.

See how assets are loaded in you head :

    <link rel="stylesheet" href="{{ "/css/main.css" | prepend: site.baseurl }}">
    

that can also be :

    <link rel="stylesheet" href="{{ site.baseurl }}/css/main.css">
    

## Working in different environments

Now you have to test your site locally and to deploy it in production. Sometimes, the `baseurl` is different and the `jekyll build` may not work out of the box in one of those environment.

Here we have two solutions :

### Use `jekyll serve`

Let's imagine that your site lives in a github repository and is served at `https://username.github.io/myProject`.

You can setup the `baseurl` to `/myProject`. and test your site locally with `jekyll serve`, your site will be served at `http://127.0.0.1:4000/myProject/`

### Use multiple configuration files

If, for one reason or another, you cannot use `jekyll serve`, you can set a configuration file for both environment and `jekyll build` depending on where you are deploying.

Let's say we have the local site served at `http://localhost` and the production site served at `https://username.github.io/myProject`.

We leave the `_config.yml` with `url: https://username.github.io` and `baseurl: /myProject`

We create a new `_config_dev.yml` with only `url: https://localhost` and `baseurl: ""`

Now to test locally :

    jekyll build --config _config.yml,_config_dev.yml
    

or

    jekyll build --config _config.yml,_config_dev.yml --watch
    

When pushed on production, the <code>jekyll build</code> command will use the default <code>_config.yml</code>.

## html-proofer

* [HTMLProofer](https://github.com/gjtorikian/html-proofer)
* [Using HTMLProofer From Ruby and Travis](https://github.com/gjtorikian/html-proofer/wiki/Using-HTMLProofer-From-Ruby-and-Travis)

HTMLProofer is a set of tests to validate your HTML output. These tests check if your image references are legitimate, if they have alt tags, if your internal links are working, and so on. It's intended to be an all-in-one checker for your output.

Add this line to your application's Gemfile:

    gem 'html-proofer'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install html-proofer

```
~/.../sytws1920/ull-mii-sytws-1920.github.io(master)]$ cat Rakefile 
```

```ruby
desc "sytws: bundle exec jekyll serve --watch"
task :serve do
  sh "bundle exec jekyll serve --future --watch --port 8080 --host 10.6.128.216"
end

... # more tasks

require 'html-proofer'
desc "test links in the build web site"
task :test do
  sh "bundle exec jekyll build"
  options = { 
    :assume_extension => true, 
    :disable_external => true, 
    :empty_alt_ignore => true,
    :file_ignore => [ %r{categories} ]
  }
  HTMLProofer.check_directory("./_site", options).run
end
```
