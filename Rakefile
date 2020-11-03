desc "Publicar en GitHub los apuntes de AET"
task :default do
  sh "git ci -am 'AET 2020/2021' && git push"
end

desc "serve locally"
task :serve do
  sh "bundle exec jekyll serve --future --watch --host 0.0.0.0 --port 8083"
end

task :updatebundler do
  sh "bundle update --bundler"
end

