require 'test_helper'

class Sms50XTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Sms50X::VERSION
  end

  def test_it_returns_the_account_balance
    VCR.use_cassette('balance') do
      client = Sms50X::Client.new('API_KEY', 'CRI')
      balance = client.balance
      assert_equal 20, balance
    end
  end

  def test_it_sends_a_message
    VCR.use_cassette('sms') do
      client = Sms50X::Client.new('API_KEY', 'CRI')
      response = client.send_message('55555555', "This is a test")
      assert_equal 0, response
    end
  end

  def test_it_gets_stats_for_a_month
    VCR.use_cassette('stats') do
      client = Sms50X::Client.new('API_KEY', 'CRI')
      response = client.get_stats(Date.today.month)
      assert_equal 10, response
    end
  end

end
