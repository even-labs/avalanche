# frozen_string_literal: true

module Avalanche
  module AvaCloud
    module Data
      module EVM
        # Avalanche Data API provides endpoints for the latest information on avalanche chains.
        # @see https://developers.avacloud.io/data-api/evm-chains
        class Chains
          class << self
            # Lists the AvaCloud supported EVM-compatible chains. Filterable by network.
            # @see https://developers.avacloud.io/data-api/evm-chains/list-chains
            # @return [Array<Hash{Symbol->Object}>]
            def chains
              DataApi.instance.get("/v1/chains")
            end

            # Gets chain information for the EVM-compatible chain if supported by AvaCloud.
            # @see https://developers.avacloud.io/data-api/evm-chains/get-chain-information
            # @param chain_id [String]
            # @return [Hash{Symbol->Object}]
            def chain(chain_id = nil)
              DataApi.instance.get("/v1/chains/#{chain_id || Avalanche::AvaCloud.config.chain_id}")
            end
          end
        end
      end
    end
  end
end
