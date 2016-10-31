# README

Wooo! Check out this Rails implementation of the really fun Teams/Leagues/Memberships AR challenge with most MVC tests implemented.

INSTRUCTIONS:

* Install Rails 5
* Run `bundle` inside the directory
* Run `rails db:seed RAILS_ENV=test; rails spec` to perform tests (lots of `*_controller` and `*_helper` tests are currently pending)
* Run `rails db:seed` to seed development database
* Run `rails s` to start Rails server on `localhost`
* Open your browser and navigate to `localhost:3000`
* Explore!
* Run Travis CI

Travis Annotations:

Start Postgres:
```
services:
- postgresql
```
Declare which programming languages are have tests against them
and which versions of the programming language to test against.
```
language: ruby
rvm:
- 2.3.1
```

Declare any environment settings required to run tests
```
env:
- DB=postgresql
```

```
before_script:
- psql -c 'create database ar_teams_and_leagues_challenge_rails_test;' -U postgres
```

script:
- RAILS_ENV=test bundle exec rake db:migrate --trace
- bundle exec rake db:test:prepare
- bundle exec rake db:seed RAILS_ENV=test
- bundle exec rspec spec/
deploy:
  provider: heroku
  api_key:
    secure: Lxa...
```