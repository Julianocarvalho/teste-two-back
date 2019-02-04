# README

This README would normally document whatever steps are necessary to get the
application up and running.

info version
RUBY_VERSION="2.4.0"
RAILS_VERSION="5.0.2"
NODE_VERSION="6"


instalar dependencias

bundle install


configurar db

rake db:create db:migrate


Necessario configurar subdomio em etc/hosts

#setup subdomain for rails applications

127.0.0.1 api.teste-two.test

realizar testes

bundle exec spring rspec


PS: melhorar readme (padrão code)
