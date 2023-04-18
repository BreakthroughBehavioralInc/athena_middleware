# athena_middleware
# Build Status # 
![Ruby](https://github.com/BreakthroughBehavioralInc/cigna-ruby/actions/workflows/ruby.yml/badge.svg)


# AthenaApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/athena_middleware`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'athena_middleware'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install athena_api

## Usage

The library needs to be configured with your account's key and secret. Set `CignaApi.api_key` and `Cigna.api_secret` to their values, ideally using hidden `ENV` variables:

```ruby
require 'athena_middleware'


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/athena_middleware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/athena_middleware/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the athena_middleware project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/athena_middleware/blob/master/CODE_OF_CONDUCT.md).
