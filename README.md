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

pp book
```

## Creating A Coercion

This library comes with a custom coercion library. It's fairly straight forward.

```ruby
Yukata.coercer.register(String, URI) do |string, type|
  #
  # Maybe do some fancy string cleanup before you coerce it
  #
  URI(string)
end
```

Then require that coercion to make sure it's loaded and all you simply have to
do now is just do the following.

```ruby
require 'pp'

class Website < Yukata::Base
  attribute :uri, URI
end

website = Website.new({uri: 'http://example.com'})

pp website
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
