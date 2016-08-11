require 'httparty'

class ScaleDrone
  include HTTParty

  def initialize(options = {})
    options = {
      :base_url => 'https://api2.scaledrone.com',
    }.merge(options)
    @channel_id, @base_url = options.values_at(:channel_id, :base_url)
    @auth = {username: options[:channel_id], password: options[:secret_key]}
  end

  def publish(data = {}, *rooms)
    if rooms.length === 1
      options = {body: data, basic_auth: @auth}
      url = "#{@base_url}/#{@channel_id}/#{rooms[0]}/publish"
    else
      url = "#{@base_url}/#{@channel_id}/publish/rooms"
      options = {body: data, basic_auth: @auth, query: {:r => rooms}}
    end
    self.class.post(url, options)
  end

  def channel_stats
    options = {basic_auth: @auth}
    self.class.get("#{@base_url}/#{@channel_id}/stats", options)
  end

  def users_list
    options = {basic_auth: @auth}
    self.class.get("#{@base_url}/#{@channel_id}/users", options)
  end

end
