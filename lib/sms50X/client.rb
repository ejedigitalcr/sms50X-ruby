module Sms50X
  extend Configuration

  class Client

    attr_accessor :api_key, :country_code, :host

    def initialize(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}

      @api_key = get_api_key(args[0])
      @country_code = get_country_code(args[1])

      if [@api_key, @country_code].any? { |k| k.nil? }
        raise ArgumentError, 'API key and country code are required'
      end

      @host = get_host

    end

    def send_message(phone, message)
      
    end

    def balance
      response = Faraday.get("#{host}/balance/#{api_key}")
      response.body.to_i
    end

    def get_stats(month = Date.today.month)
      month -= 1
      response = Faraday.get("#{host}/stat/#{api_key}/#{month}")
      response.body.to_i
    end

    private

      def get_api_key(arg)
        [arg, Sms50X.api_key, ENV['SMS50X_API_KEY']].find{ |x| x }
      end

      def get_country_code(arg)
        [arg, Sms50X.country_code, ENV['SMS50X_COUNTRY_CODE']].find{ |x| x }
      end

      def get_host
        # ISO 3166-1 alpha-3 codes
        countries = {
          'GTM' => '502', # Guatemala
          'SLV' => '503', # El Salvador
          'HND' => '504', # Honduras
          'CRI' => '506', # Costa Rica
          'PAN' => '507'  # Panama
        }

        code = countries.fetch(country_code) { countries['CRI'] }

        "http://api.sms#{code}.com"
      end

  end

end
