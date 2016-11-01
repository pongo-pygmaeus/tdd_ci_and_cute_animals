# README
https://api.travis-ci.org/pongo-pygmaeus/ar-teams-and-leagues-challenge-rails.svg?branch=master

<h1> Bobolink Love </h1>

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

Travis Annotations (Everything below is run in a dynamic Docker 
container everytime Travis runs a test suite)

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

Set up the test database
```
before_script:
- psql -c 'create database ar_teams_and_leagues_challenge_rails_test;' -U postgres
```

Set up the test environment, seed test database, run tests
```
script:
- RAILS_ENV=test bundle exec rake db:migrate --trace
- bundle exec rake db:test:prepare
- bundle exec rake db:seed RAILS_ENV=test
- bundle exec rspec spec/
```

Use Heroku account information to deploy to that service
(Set up your app on Heroku like you normally would prior
to filling in these fields)

To get the `api_key` field, run `travis encrypt $(heroku auth:token) --add deploy.api_key` in your local project directory. Also, you need to 
run `gem install travis` before running the previous command. 
```
deploy:
  provider: heroku
  app: frightening-moonlight-10587
  api_key:
    secure: Lxa...
```

