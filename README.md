# Civtrade

[![Build Status](https://travis-ci.org/zacstewart/civtrade.png?branch=master)](https://travis-ci.org/zacstewart/civtrade)

A marketplace for [Civcraft][1]

## Public API

### Shop index `GET /shops`

**Parameters**:

* _search_: constrains index to shops with a matching item name or city.
  Example: 'iron aristopolis'

* _page_: which page you'd like to receive. API currently returns 25 shops per
  page.

## Development

**Prerequisits**

* PostgreSQL
* Bundler

**Running**

1. `cp config/database.yml.example config/database.yml`
2. `bundle install`
3. `rake db:setup`
4. `rake db:seed`
5. `foreman start`

**Testing**

Civtrade uses Rspec for testing.

`rake spec`


## Contributing :octocat:

1. Fork it
2. Create a feature branch
3. Create and test your feature
4. Open a pull request

[1]: http://www.reddit.com/r/Civcraft
