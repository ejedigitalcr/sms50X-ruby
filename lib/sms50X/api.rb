module Sms50X
  class API
    BALANCE_URL = "api.sms506.com/balance/#{API_KEY}"

    # Check the remaining credit for this account.
    # @raise Sms50X::Error::Authentication if API key is incorrect
    # @return [integer] Number of messages remaining
    def balance

    end
  end
end
