# About **Deep Symbolize Keys** and **frozen_string_literal: true** usage

Ruby VM is not good at all, when Matsumoto wrote it, he said that wasn't his best work from then has been getting better a significant amount. However, Strings object depending on the case could mean a huge problem if are called many times in critical operations, such as requesting resources to an external API. Let's say we have a small client which connect to Last.fm to get latest top 100 songs. We should have a base client which will set up our client either with a fancy and strong gem like Faraday or with HTTP Ruby object, we have next line:

```json
{"content-type": "application/json"}
```

Every request by our users will perform that method which will create two new instances on our server it does mean we are going to occupy all our memory with useless objects and pointers. From next Ruby version (2.6) the Ruby Core will implement by default every String as frozen objects, that means if we have already created those strings in our server Ruby interpreter will still pointing them. The only temporal solution we have now is putting on the top of every Ruby file next "magic comment"

```ruby
# frozen_string_literal: true
```

Which will help us with our issue, most of the famous gems use that way, even, Rubocop's style guide recommends using it, taking as an offense its absence.

Another good thing I like Rails is a method called deep_symbolize_keys which's included Hash class in Rails using ActiveSupport, this method converts into Symbol every single String inside a Hash. The main difference between Symbols and Strings is that Symbols already make reference to the same object in memory, that means you can create five thousand Symbols with the same value and will still be the same object in memory.

Now, let's say we need to perform an HTTP/POST action to Last.fm, we have following example.

```json
{
  "user": {
    "alias": "devpolish",
    "country": "Poland"
  }
}
```

All above Hash keys are String and values are actually Strings to which are stored in our database, so imagine we need to send the same payload eight hundred thousand times per hour. We still have the same problem with Strings, so, Deep Symbolize Keys method is always recommended to those kinds of situations.

```ruby
  payload = {
    'user': {
      'alias': @user.alias_name,
      'country': @user.country
    }
  }
  payload.deep_symbolize_keys
   user: {
      alias: @user.alias_name,
      country: @user.country
    }
```

PS: Even if Symbols are more like

```ruby
  :user => { :alias => @user.alias_name, :country => @user.country }
```

Robocop's style guide strongly recommends the first way.

Even, in this small project, we need to follow all style guides and good practices. It's not enough that it just works, it's about good practices, strong and scalable architectures.

[Do you want to read more about?](https://bugs.ruby-lang.org/issues/15393#change-75684)
