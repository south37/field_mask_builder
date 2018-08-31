# FieldMaskBuilder

Builder of FieldMask parameter.
If you want to know more about FieldMask, please see https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#fieldmask .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'field_mask_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install field_mask_builder

## Usage

`FieldMaskBuilder.build` builds FieldMask from `fields` array.

```ruby
irb(main):001:0> FieldMaskBuilder.build([
irb(main):002:2*   :id,
irb(main):003:2*   {
irb(main):004:3*     profile: [
irb(main):005:4*       :location,
irb(main):006:4*       :birthday,
irb(main):007:4*       {
irb(main):008:5*         writings: [:title]
irb(main):009:5>       }
irb(main):010:4>     ]
irb(main):011:3>   },
irb(main):012:2* ])
=> ["id", "profile.location", "profile.birthday", "profile.writings.title"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake true` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/south37/field_mask_builder.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
