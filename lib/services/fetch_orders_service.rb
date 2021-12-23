# frozen_string_literal: true

require_relative "./application_service.rb"
require_relative "../evetech/requests/order.rb"
require_relative "../evetech/responses/response.rb"

module Services
  class FetchOrdersService < Services::ApplicationService
    def initialize(market_id)
      @market_id = market_id
    end

    def call
      request = order_client.index(market_id: @market_id, params: params)
      return [] unless request.success?

      Evetech::Responses::Response.new(request, "order").execute
    end

    private

    def params
      {
        datasource: "tranquility",
        order_type: "all",
        page: 1
      }
    end

    def order_client
      @order_client ||= Evetech::Requests::Order.new
    end
  end
end
