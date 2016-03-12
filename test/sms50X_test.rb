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

  def test_it_gets_replies_from_a_specific_date
    VCR.use_cassette('replies') do
      client = Sms50X::Client.new('API_KEY', 'CRI')
      response = client.get_replies(Date.new(2016,3,11))
      assert_equal "[{\"fecha\":\"11-03-2016 15:07\",\"telf\":\"55555555\",\"txt\":\"This is a reply\"}]", response
    end
  end

  def test_it_sends_a_message_to_multiple_phone_numbers
    VCR.use_cassette('bulk') do
      client = Sms50X::Client.new('API_KEY', 'CRI')
      response = client.bulk_send("This is a test.", [55555555, 55505555])
      assert_equal "Enviados 2", response
    end
  end
end
