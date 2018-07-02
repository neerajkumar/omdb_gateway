# Omdbapi

Omdbapi is a rubygem to fetch the movie information, all content and images on the IMDB site (http://www.omdbapi.com) which are contributed and maintained by IMDB users.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omdbapi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omdbapi
    
Next, you need to run the generator:

    $ rails generate omdbapi:install
    
Generator will create a ```config/initializers/omdb.yml``` file where you can provide your api key or token (generated from omdb).     

## Usage

Omdbapi provides different methods to fetch the data from OMDB. For example, ```find_by_id, find_by_title, find_by```.

```ruby
require 'omdbapi'
    
Omdbapi::Movie.find_by_id('tt7363076')
   
Omdbapi::Movie.find_by_title('Raid')
    
Omdbapi::Movie.find_by(id: 'tt7363076')
    
=> {"Title"=>"Star Wars: Episode IV - A New Hope", "Year"=>"1977", "Rated"=> ...
```
    
Omdbapi takes other parameters too. For example, ```year, plot, response_type```. Default values are plot: 'short', response_type: 'json'.
    
```ruby
Omdbapi::Movie.find_by_id('tt7363076', 2018, 'full', 'xml')
    
Omdbapi::Movie.find_by_title('Raid', 2018, 'full', 'xml')

Omdbapi::Movie.find_by(id: 'tt7363076', year: 2018, plot: 'full', response_type: 'xml')

Omdbapi::Movie.find_by(id: 'tt7363076', year: 2018, plot: :full, response_type: :xml)

Omdbapi::Movie.find_by(title: 'Raid', year: 2018, plot: :full, response_type: :xml)
    
=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?><root response=\"True\"><movie title=\..."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neerajkumar/omdbapi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omdbapi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/neerajkumar/omdbapi/blob/master/CODE_OF_CONDUCT.md).
