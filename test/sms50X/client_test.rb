require 'test_helper'

describe Sms50X::Client do

  describe '.new' do
    Sms50X::Configuration::DEFAULTS.each do |key, value|
      it "must raise an error if the #{key} is not present" do
        proc{ Sms50X::Client.new }.must_raise ArgumentError
      end
    end
  end

end
