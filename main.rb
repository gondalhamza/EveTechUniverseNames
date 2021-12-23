# frozen_string_literal: true

require_relative "./lib/services/fetch_orders_service.rb"
require_relative "./lib/services/fetch_universes_service.rb"
require_relative "./lib/services/print_universe_names_service.rb"

# fetching orders of a market
orders = Services::FetchOrdersService.call(10000002)

# collecting all uniq type ids
unique_ids = orders.map(&:type_id).uniq

# fetching universes with type ids
universes = Services::FetchUniversesService.call(unique_ids)

# printing universes name alphabetically
Services::PrintUniverseNamesService.call(universes)
