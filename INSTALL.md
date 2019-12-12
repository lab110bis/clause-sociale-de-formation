Dépendances requise:
- postgres
- Ruby >= 2.6.2
- Rails 6

Référence : https://github.com/docker-library/ruby/blob/5c9e21cbf79b7f36d505555c9ecd62cf0f7e07f8/2.6/alpine3.9/Dockerfile


Install Ubuntu

- `sudo apt-get -y install postgresql postgresql-contrib libpq-dev`
- création d'un compte pour la base de données :
  - `sudo -u postgres psql -c "create role csf with createdb login password 'csf';"`
  - pour tester : `psql -U csf -h localhost` renvoie "database "csf" does not exist"
- `bundle exec rake db:setup`
