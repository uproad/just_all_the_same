# JustAllTheSame

## ***YOU CAN RUN QUICKLY """Array#all?(nil)"""***

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'just_all_the_same'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install just_all_the_same

## Usage

```ruby
require 'just_all_the_same'

ary = [nil, nil, nil]

ary.all_nil? #=> true
# return same ary.all?(nil) but quickly
# methods
#   all_same?(Immidiate Value)
#     Immidiate Vale -> Integer(1,2,3...), Symbol(:str), true, false, nil
#   all_nil?
#   all_true?
#   all_false?
```

## Algorithm (gem is written by Clang)

1. A long size array.

```ruby
ary = [nil]*10000
```

2. Check first item is nil? in Clang.

```ruby
return false unless ary[0].nil?
```

3. Split array to half and half.

IMPORTANT!

```ruby
 forward_ary = ary[0...ary.size/2]
backward_ary = ary[ary.size/2..ary.size/2*2] # If size is odd, to under even.
```

4. If odd, check last item is nil.

```ruby
return false unless ary.size.odd? && ary[-1].nil?
```

5. Check same forward_ary and backward_ary with C function 'memcmp'.

IMPORTANT!!!

```ruby
return false if memcmp(forward_ary.ptr, backward_ary.ptr, forward_ary.size)
```

6. Split forward_ary to half and half.

```ruby
         ary = forward_ary
 forward_ary = ary[0...ary.size/2]
backward_ary = ary[ary.size/2..ary.size/2*2] # If size is odd, to under even.
```

7. Loop to 4

## Algorithm written by data
```
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
                      split

[nil, nil, nil, nil, nil] [nil, nil, nil, nil, nil]
                      memcmp


[nil, nil, nil, nil, nil]
       split

[nil, nil] [nil, nil] [nil]
       memcmp          nil?


[nil, nil]
  split

[nil] [nil]
  memcmp
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/just_all_the_same.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
