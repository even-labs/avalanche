# frozen_string_literal: true

module Avalanche
  module AvaCloud
    module Data
      module EVM
        # Avalanche Data API provides endpoints for the latest information on avalanche contracts.
        # @see https://developers.avacloud.io/data-api/evm-contracts
        class Contracts
          class << self
            # Gets metadata about the contract at the given address.
            # @see https://developers.avacloud.io/data-api/evm-contracts/get-contract-metadata
            # @return [Array<Hash{Symbol->Object}>]
            def contract_metadata(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}")
            end
          end
        end
      end
    end
  end
end
