# frozen_string_literal: true

module Evetech
  module Responses
    class Universe
      attr_reader :id, :name, :category

      def initialize(content)
        @id = content["id"]
        @name = content["name"]
        @category = content["category"]
      end
    end
  end
end
