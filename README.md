# OmdbGateway

[![Build Status](https://travis-ci.org/neerajkumar/omdb_gateway.svg?branch=master)](https://travis-ci.org/neerajkumar/omdb_gateway)

Omdb_gateway is a rubygem to fetch the movie information, all content and images on the IMDB site (http://www.omdbapi.com) which are contributed and maintained by IMDB users.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omdb_gateway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omdb_gateway
    
Next, you need to run the generator:

    $ rails generate omdb_gateway:install
    
Generator will create a ```config/initializers/omdb.yml``` file where you can provide your api key or token (generated from omdb).     

## Usage

Omdb_Gateway provides different methods to fetch the data from OMDB. For example, ```find_by_id, find_by_title, find_by```.

```ruby
require 'omdb_gateway'

OmdbGateway::Movie.find_by_id('tt7363076')

OmdbGateway::Movie.find_by_title('Raid')

OmdbGateway::Movie.find_by(id: 'tt7363076')

OmdbGateway::Movie.find_by(title: 'Raid')

=> <OmdbGateway::Response:0x00007fa51293f6c0 @title="Raid", @year="2018", @rated="NOT ...
    
OmdbGateway::Movie.find_by_id('tt7363076', format: :json)

OmdbGateway::Movie.find_by_title('Raid', format: :json)

OmdbGateway::Movie.find_by(id: 'tt7363076', format: :json)
    
=> {"Title"=>"Raid", "Year"=>"2018", "Rated"=>"NOT RATED", "Released"=>"16 Mar ...
```
    
OmdbGateway takes other parameters too. For example, ```year, plot, format```. Default values are plot: 'short', format: 'json'.
    
```ruby
OmdbGateway::Movie.find_by_id('tt7363076', year: 2018, plot: :full, format: :xml)
    
OmdbGateway::Movie.find_by_title('Raid', year: 2018, plot: :full, format: :xml)

OmdbGateway::Movie.find_by(id: 'tt7363076', year: 2018, plot: :full, format: :xml)

=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?><root response=\"True\"><movie title=\..."
```

OmdbGateway also provides search to query. 

```ruby
OmdbGateway::Search.query('Batman')

OmdbGateway::Search.query('Batman', page: 2)

OmdbGateway::Search.query('Batman', page: 1, year: 2018, plot: :full, api_version: 1)

=> <OmdbGateway::CollectionResponse:0x00007feb56f7e0b0 @result=[#<OmdbGateway::Response:0x00007feb56f7e038 @title="Batman: The Killing Joke" ...

OmdbGateway::Search.query('Batman', page: 1, format: :xml)

=> "<root totalResults=\"338\" response=\"True\"><result title=\"Batman: The Killing ...

OmdbGateway::Search.query('Batman', page: 2, format: :json)

=> {"Search"=>[{"Title"=>"Batman: The Killing Joke", "Year"=>"2016", "imdbID"=> ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neerajkumar/omdb_gateway. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omdb_gateway project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/neerajkumar/omdb_gateway/blob/master/CODE_OF_CONDUCT.md).
