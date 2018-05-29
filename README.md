# Troquinho

**This app was made in a one-full-day Hackathon ([1˚ Conductor Hackathon (pt-br)](http://talks.conductor.com.br/hackathon/)).**

### Description

Troquinho is a service which integrate an bank account or credit card user and automatically rounds the bills to top value. On the end of the month, the accumulated savings is used for support selected projects by user. These projects can be NGO causes, collective projcas as an family travel and private projects as money saving. The users can create their on projects and define their round rules.

## Technologies

The project is primarily written in Ruby using the Ruby on Rails Web framework.

## Dependencies

To run this project you need to have:

* Ruby 2.4.0 - You can use [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)

## Setup the project

1. Install the dependencies above
2. `$ git clone <REPOSITORY_URL> troquinho` - Clone the project
3. `$ cd troquinho` - Go into the project folder
4. `$ gem install bundler` - Install bundler on project gemset
4. `$ bundle install` - Install project dependencies with bundler
5. Configure the environment variables according to names on `.env.sample` file
6. `$ rspec` - Run the specs to see if everything is working fine

If everything goes OK, you can now run the project!

### Rake tasks

Import transactions

```
rake transactions:import[user@example.com,PayPal]
```
