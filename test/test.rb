require 'minitest/autorun'
require 'scaledrone'

class ScaleDroneTest < Minitest::Test

  def test_publish
    sd = ScaleDrone.new({
      channel_id: 'G3TYvCzoXtrIuEtQ',
      secret_key: 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd'
    })
    response = sd.publish({foo: 'bar'}, 'notifications')
    assert_equal 200, response.code
  end

  def test_publish_multiple_rooms
    sd = ScaleDrone.new({
      channel_id: 'G3TYvCzoXtrIuEtQ',
      secret_key: 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd'
    })
    rooms = ['lounge', 'notifications']
    response = sd.publish({ruby: 'multi'}, *rooms)
    assert_equal 200, response.code
  end

  def test_channel_stats
    sd = ScaleDrone.new({
      channel_id: 'G3TYvCzoXtrIuEtQ',
      secret_key: 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd'
    })
    response = sd.channel_stats()
    puts response.body
    assert_equal 200, response.code
  end

  def test_users_list
    sd = ScaleDrone.new({
      channel_id: 'G3TYvCzoXtrIuEtQ',
      secret_key: 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd'
    })
    response = sd.users_list()
    assert_equal 200, response.code
  end

end
