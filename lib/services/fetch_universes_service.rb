# frozen_string_literal: true

require_relative "./application_service.rb"
require_relative "../evetech/requests/universe.rb"
require_relative "../evetech/responses/response.rb"

module Services
  class FetchUniversesService < Services::ApplicationService
    def initialize(ids)
      @ids = ids
    end

    def call
      request = universe_client.index(body: @ids, params: params)
      return [] unless request.success?

      Evetech::Responses::Response.new(request, "universe").execute
    end

    private

    def params
      { datasource: "tranquility" }
    end

    def universe_client
      @universe_client ||= Evetech::Requests::Universe.new
    end
  end
end
