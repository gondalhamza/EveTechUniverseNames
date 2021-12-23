# frozen_string_literal: true

require_relative "./application_service.rb"

module Services
  class PrintUniverseNamesService < Services::ApplicationService
    def initialize(universes)
      @universes = universes
    end

    def call
      sorted_universes.each { |universe| puts universe.name }
    end

    private

    def sorted_universes
      @sorted_universes ||= @universes.sort_by(&:name)
    end
  end
end
