require 'httparty'

BASE_URL = 'https://api2.scaledrone.com'

class ScaleDrone
  include HTTParty

  def initialize(channel_id, secret_key, base_url = BASE_URL)
    @channel_id = channel_id
    @base_url = base_url
    @auth = {username: channel_id, password: secret_key}
  end

  def publish(room, data = {})
    options = {body: data, basic_auth: @auth}
    self.class.post("#{@base_url}/#{@channel_id}/#{room}/publish", options)
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
