module Sms50X
  module Configuration

    DEFAULTS = {
      api_key: nil,
      country_code: 'CRI'
    }

    DEFAULTS.each_key do |attribute|
      attr_accessor attribute
    end

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def reset
      self.api_key = DEFAULTS[:api_key]
      self.country_code = DEFAULTS[:country_code]
    end

    def configure
      yield self
    end

  end
end
