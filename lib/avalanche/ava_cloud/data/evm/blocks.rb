# frozen_string_literal: true

module Avalanche
  module AvaCloud
    module Data
      module EVM
        # Avalanche Data API provides endpoints for the latest information on avalanche blocks.
        # @see https://developers.avacloud.io/data-api/evm-blocks
        class Blocks
          class << self
            # Lists the latest indexed blocks on the EVM-compatible chain sorted in descending order by block timestamp.
            # @see https://developers.avacloud.io/data-api/evm-blocks/list-latest-blocks
            # @return [Array<Hash{Symbol->Object}>]
            def blocks
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/blocks")
            end

            # Gets the details of an individual block on the EVM-compatible chain.
            # @see https://developers.avacloud.io/data-api/evm-blocks/get-block
            # @param block_id [String]
            # @return [Hash{Symbol->Object}]
            def block(block_id = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/blocks/#{block_id}")
            end
          end
        end
      end
    end
  end
end
