# frozen_string_literal: true

require_relative "./request.rb"

module Evetech
  module Requests
    class Universe < Request
      def index(body: nil, params: {})
        post(endpoint: "universe/names", body: body, params: params)
      end
    end
  end
end
