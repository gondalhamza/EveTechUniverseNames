# frozen_string_literal: true

require "json"
require_relative "./order.rb"
require_relative "./universe.rb"
require_relative "../../string.rb"

module Evetech
  module Responses
    class Response
      RESPONSE_TYPE_TO_CLASS_MAP = {
        order: "Evetech::Responses::Order",
        universe: "Evetech::Responses::Universe"
      }.freeze

      def initialize(api_response, response_type)
        @api_response = api_response
        @response_type = response_type
      end

      def execute
        data = JSON.parse(@api_response.body)

        if data.is_a? Array
          data.map { |d| build_response(d) }
        else
          build_response(data)
        end
      end

      def build_response(content)
        RESPONSE_TYPE_TO_CLASS_MAP[@response_type.to_sym].constantize.new(content)
      end
    end
  end
end
