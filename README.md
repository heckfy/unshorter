# Unshorter

The library for expanding short urls provided by url shortening services like tinyurl.com, bit.ly, etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unshorter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unshorter

## Usage
```ruby
require 'unshorter'
unshorter = Unshorter.new
original_url = unshorter.call('https://cutt.ly/1tP7j2t')
p "Original url is: #{original_url}"
```

Unshorter support those services:

 - https://bit.ly
 - http://0rz.tw
 - https://2.gp
 - http://alturl.com
 - http://chilp.it
 - https://clck.ru
 - https://cutt.us
 - https://is.gd
 - http://merky.de
 - https://soo.gd
 - https://tiny.pl
 - https://tinyurl.com

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/heckfy/unshorter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
