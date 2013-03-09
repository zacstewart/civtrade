# Civtrade

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

1. `bundle install`
2. `rake db:setup`
3. `rake db:seed`
4. `foreman start`

**Testing**

Civtrade uses Rspec for testing.

`rake spec`


## Contributing :octocat:

1. Fork it
2. Create a feature branch
3. Create and test your feature
4. Open a pull request

[1]: http://www.reddit.com/r/Civcraft
