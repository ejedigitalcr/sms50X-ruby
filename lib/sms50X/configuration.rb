module Sms50X
  module Configuration

    DEFAULTS = {
      host: 'api.sms506.com'
    }

    DEFAULTS.each_key do |attribute|
      attr_accessor attribute
    end

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint   = DEFAULT_ENDPOINT
      self.method     = DEFAULT_METHOD

      self.api_key    = DEFAULT_API_KEY
      self.format     = DEFAULT_FORMAT
    end

    def get_endpoint
      # ISO 3166-1 alpha-3 codes
      countries = {
        'GTM' => '502', # Guatemala
        'SLV' => '503', # El Salvador
        'HND' => '504', # Honduras
        'CRI' => '506', # Costa Rica
        'PAN' => '507'  # Panama
      }
      http://api.sms506.com
    end

    def configure
      yield self
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

  end
end
