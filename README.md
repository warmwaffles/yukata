# Yukata

A light weight, no dependency, plain old ruby objects on steroids.

## Example

```ruby
require 'yukata'
require 'pp'

class Author < Yukata::Base
  attribute :name, String
end

class Book < Yukata::Base
  attribute :title,  String
  attribute :author, Author
  attribute :created_at, Date, default: -> { Date.today }
end

book = Book.new({
  title: 'Hunt For Red October',
  author: {
    name: 'Tom Clancy'
  }
})

puts '=================================='

pp book.to_h

puts '=================================='
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
