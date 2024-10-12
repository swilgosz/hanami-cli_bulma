# Hanami::CLI

This gem adds support to [Bulma CSS Framework](https://bulma.io) for hanamai generators.

NOTE:
This library contains all of the CLI commands for [full-stack Hanami applications](`https://github.com/hanami/hanami`).

## Contact

- Home page: https://github.com/swilgosz/hanami-cli_bulma
- Mailing List: [Hanami Mastery Newsletter](https://mailchi.mp/6ac8f64f3c5d/hanami-mastery-newsletter)
- Bugs/Issues: https://github.com/swilgosz/hanami-cli_bulma/issues
- API Doc: http://rubydoc.info/gems/hanami-cli_bulma
- Chat: http://discourse.hanamirb.org

## Installation

**Hanami::CLIBulma** supports Ruby (MRI) 3.1+

Add gem to your gemfile

```shell
# Gemfile
gem 'hanami-cli_bulma'
```

```shell
bundle install
```

## Usage

```shell
hanami g view users.show
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

In order to run all of the tests, you should run `docker compose up` separately, to run a `postgres` server.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/swilgosz/hanami-cli_bulma. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/swilgosz/hanami-cli_bulma/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `Hanami::CLIBulma` project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/swilgosz/hanami-cli_Bulma/blob/main/CODE_OF_CONDUCT.md).

## Copyright

Gem is extracted from `hanami-cli`, and managed by Sebastian Wilgosz

Copyright © 2014–2024 Sebastian Wilgosz – Released under MIT License
