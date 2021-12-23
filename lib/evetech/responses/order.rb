# frozen_string_literal: true

module Evetech
  module Responses
    class Order
      attr_reader :duration, :is_buy_order, :issued, :location_id,
                  :min_volume, :order_id, :price, :range, :system_id,
                  :type_id, :volume_remain, :volume_total

      def initialize(content)
        @duration = content["duration"]
        @is_buy_order = content["is_buy_order"]
        @issued = content["issued"]
        @location_id = content["location_id"]
        @min_volume = content["min_volume"]
        @order_id = content["order_id"]
        @price = content["price"]
        @range = content["range"]
        @system_id = content["system_id"]
        @type_id = content["type_id"]
        @volume_remain = content["volume_remain"]
        @volume_total = content["volume_total"]
      end
    end
  end
end
