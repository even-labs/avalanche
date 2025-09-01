# frozen_string_literal: true

module Avalanche
  module AvaCloud
    class Metrics
      # Avalanche Data API provides endpoints for the latest information on avalanche chains.
      # @see https://developers.avacloud.io/data-api/evm-chains
      class Chains
        class << self
          # Get a list of Metrics API supported blockchains.
          # @see https://developers.avacloud.io/metrics-api/evm-chains/get-a-list-of-supported-blockchains
          # @return [Array<Hash{Symbol->Object}>]
          def chains
            MetricsApi.instance.get("/v2/chains")
          end

          # Get chain information for Metrics API supported blockchain.
          # @see https://developers.avacloud.io/metrics-api/evm-chains/get-chain-information-for-supported-blockchain
          # @param chain_id [String]
          # @return [Hash{Symbol->Object}]
          def chain(chain_id = nil)
            MetricsApi.instance.get("/v2/chains/#{chain_id || Avalanche::AvaCloud.config.chain_id}")
          end
        end
      end
    end
  end
end
