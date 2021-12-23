# frozen_string_literal: true

require_relative "./request.rb"

module Evetech
  module Requests
    class Order < Request
      def index(market_id:, params: {})
        get(endpoint: "markets/#{market_id}/orders", params: params)
      end
    end
  end
end
