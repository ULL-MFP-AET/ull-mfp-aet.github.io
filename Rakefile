desc "Publicar en GitHub los apuntes de AET"
task :default do
  sh "git ci -am 'AET 2020/2021' && git push"
end

desc "serve locally"
task :serve do
  sh "bundle exec jekyll serve --future --watch --host 0.0.0.0 --port 8084"
end

task :updatebundler do
  sh "bundle update --bundler"
end

# docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" --env JEKYLL_ENV=development -p 4000:4000 jekyll/jekyll jekyll serve
# https://dev.to/michael/compile-a-jekyll-project-without-installing-jekyll-or-ruby-by-using-docker-4184
# docker run --rm 
# --volume="$PWD:/srv/jekyll" 
# --volume="$PWD/vendor/bundle:/usr/local/bundle" 
# --env JEKYLL_ENV=development -p 4000:4000 
# jekyll/jekyll:3.8 jekyll serve
task :docker do
  # sh 'docker run --rm --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" --env JEKYLL_ENV=development -p 4000:4000 jekyll/jekyll:3.8 jekyll serve'
  sh 'docker compose up' 
end
