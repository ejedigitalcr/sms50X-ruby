require "sms50X/version"
require "sms50X/configuration"
require "sms50X/client"
require "faraday"

API_URL = "http://api.sms506.com"
API_KEY = "***REMOVED***"

module Sms50X
  extend Configuration

  def self.balance
    response = Faraday.get("#{API_URL}/balance/#{API_KEY}")
    response.body.to_i
  end

  def self.deliver(phone_number, message)
    response = Faraday.get("#{API_URL}/sms/#{API_KEY}", { t: phone_number, m: message } )
    response.body.to_i
  end

  def self.messages_sent(month)
    response = Faraday.get("#{API_URL}/stat/#{API_KEY}/#{month}")
    response.body.to_i
  end


end
