module Sms50X

  class Client

    attr_accessor :api

    # Define the same set of accessors as the Sms50X module
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      @api_key = args[0] || Sms50X.api_key
      @country_code = args[1] || Sms50X.country_code
      if @api_key.nil? || @country_code.nil?
        raise ArgumentError, 'API key and country code are required'
      end
    end

    def self.host(host=nil)
      @host ||= ( host || get_host )
    end


    private

      def get_host
      end

  end # Client

end
