require 'minitest/autorun'
require 'scaledrone'

class ScaleDroneTest < Minitest::Test

  def test_publish
    sd = ScaleDrone.new('G3TYvCzoXtrIuEtQ', 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd')
    response = sd.publish('notifications', {foo: 'bar'})
    assert_equal 200, response.code
  end

  def test_channel_stats
    sd = ScaleDrone.new('G3TYvCzoXtrIuEtQ', 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd')
    response = sd.channel_stats()
    puts response.body
    assert_equal 200, response.code
  end

  def test_users_list
    sd = ScaleDrone.new('G3TYvCzoXtrIuEtQ', 'M7Oc1DY2FgkCaUh4aQFC3TRV1R3RThPd')
    response = sd.users_list()
    assert_equal 200, response.code
  end

end
