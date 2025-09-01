# frozen_string_literal: true

module Avalanche
  module AvaCloud
    module Data
      module EVM
        # Avalanche Data API provides endpoints for the latest information on avalanche balances.
        # @see https://developers.avacloud.io/data-api/evm-balances
        class Balances
          class << self
            # Lists ERC-20 token balances of a wallet address.
            # Balance at a given block can be retrieved with the blockNumber parameter.
            # Balance for specific contracts can be retrieved with the contractAddresses parameter.
            # @see https://developers.avacloud.io/data-api/evm-balances/list-erc-20-balances
            # @param address [String]
            # @return [Array<Hash{Symbol->Object}>]
            def erc20_balances(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}/balances:listErc20")
            end

            # Lists ERC-721 token balances of a wallet address.
            # Balance at a given block can be retrieved with the blockNumber parameter.
            # Balance for specific contracts can be retrieved with the contractAddresses parameter.
            # @see https://developers.avacloud.io/data-api/evm-balances/list-erc-721-balances
            # @param address [String]
            # @return [Array<Hash{Symbol->Object}>]
            def erc721_balances(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}/balances:listErc721")
            end

            # Lists ERC-1155 token balances of a wallet address.
            # Balance at a given block can be retrieved with the blockNumber parameter.
            # Balance for specific contracts can be retrieved with the contractAddresses parameter.
            # @see https://developers.avacloud.io/data-api/evm-balances/list-erc-1155-balances
            # @param address [String]
            # @return [Array<Hash{Symbol->Object}>]
            def erc1155_balances(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}/balances:listErc1155")
            end
          end
        end
      end
    end
  end
end
