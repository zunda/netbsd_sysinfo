# NetbsdSysinfo

A Ruby binding to extract load average and number of processes of the user on NetBSD

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'netbsd_sysinfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install netbsd_sysinfo

## Usage

```
$ irb
> require 'bundler/setup'
> require 'netbsd_sysinfo'
> NetbsdSysinfo.loadavg
# Returns an array of system load averages in 1, 5, and 15 minutes.
#=> [0.93505859375, 1.08837890625, 1.1435546875]
> NetbsdSysinfo.nprocs
# Returns number of active processes for the current user
#=> 4
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zunda/netbsd_sysinfo.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
