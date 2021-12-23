# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module Evetech
  module Requests
    class Request
      API_BASE_URL = "https://esi.evetech.net"
      VERSION = "latest"

      protected

      def get(endpoint:, params: {})
        faraday.send(:get, endpoint, params)
      end

      def post(endpoint:, body: nil, params: {})
        faraday.send(:post, endpoint, body, params)
      end

      def faraday
        @faraday ||= Faraday.new(url: "#{API_BASE_URL}/#{VERSION}") do |faraday|
          faraday.request :json
          faraday.adapter Faraday.default_adapter
          faraday.headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
