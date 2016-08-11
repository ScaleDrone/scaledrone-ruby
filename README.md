# Scaledrone Ruby API
Official ScaleDrone Ruby pushing library. This is a wrapper around the REST API.

## Installation

Add this line to your application's Gemfile:
```
gem 'scaledrone'
```
And then execute:
```
bundle install
```
Or install it directly:
```
gem install 'scaledrone'
```

## Usage
Create a new instance of ScaleDrone passing it the `channelId` and `secretKey` that you can find from the channel's page
```ruby
require 'scaledrone'

sd = ScaleDrone.new({
  channel_id: 'G3TYvCzoXtrIuEtQ',
  secret_key: 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd'
})
```

### Publishing a message
**Please notice that in 1.0.0 the function header changed, when upgrading from 0.X.X you need to switch message and room order.**
```ruby
room = 'notifications'
message = {foo: 'bar'}
response = sd.publish(message, room)
```

### Publishing the same message to multiple rooms
```ruby
rooms = ['notifications', 'lounge']
message = {foo: 'bar'}
response = sd.publish(message, *rooms)
```

### Channel stats
```ruby
response = sd.channel_stats()
```

### Connected users list
```javascript
response = sd.users_list()
```
