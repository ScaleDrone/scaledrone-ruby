require 'httparty'

class ScaleDrone
  include HTTParty

  def initialize(options = {})
    options = {
      :base_url => 'https://api2.scaledrone.com',
    }.merge(options)
    @channel_id, @base_url = options.values_at(:channel_id, :base_url)
    @options = {
      headers: {'Content-Type' => 'application/json'},
      basic_auth: {username: options[:channel_id], password: options[:secret_key]}
    }
  end

  def publish(data = {}, *rooms)
    if rooms.length === 1
      url = "#{@base_url}/#{@channel_id}/#{rooms[0]}/publish"
      options = {body: data.to_json}.merge(@options)
    else
      url = "#{@base_url}/#{@channel_id}/publish/rooms"
      options = {body: data.to_json, query: {:r => rooms}}.merge(@options)
    end
    self.class.post(url, options)
  end

  def channel_stats
    self.class.get("#{@base_url}/#{@channel_id}/stats", @options)
  end

  # Change ?r[]=lounge&r[]=notifications array query format to
  # ?r=lounge&r=notifications format
  query_string_normalizer proc { |query|
    query.map do |key, value|
      value.map {|v| "#{key}=#{v}"}
    end.join('&')
  }

end
