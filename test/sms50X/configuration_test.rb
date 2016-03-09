require 'test_helper'

describe 'configuration' do

  after do
    Sms50X.reset
  end

  describe '.configure' do
    Sms50X::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        Sms50X.configure do |config|
          config.send("#{key}=", key)
          Sms50X.send(key).must_equal key
        end
      end
    end
  end

  Sms50X::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        Sms50X.send(key).must_equal Sms50X::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

end
