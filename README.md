# README - Desafio Troféus

This is a trophy application, built logically to award users trophies given some possibilities. In this first design, the user is able to be rewarded only when killing a monster, dying and collecting coins.

Ruby on Rails was used as the framework to build the application, as well as RSpec was used to build the test suite and Rubocop as the linter. 

* Ruby version and Rails version

The ruby version used in this project is 2.6.5, and the rails version is 6.0.2.1.

* Configuration

To get the application up and running, you need to have all the ruby on rails environment set up first. Then, you must run the commands: rails db:create db:migrate, bundle, yarn install, rails dev:setup.

* How to run the test suite

Rspec was used to build the Unit tests, and to execute the test suite you must run the command: bin/rspec.

* Web Application

To test the application as a web service, you must go to the route: http://localhost:3000/admin. It will be better to test if you have run the command 'rails dev:setup' task. 
