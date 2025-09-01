# frozen_string_literal: true

module Avalanche
  module AvaCloud
    module Data
      module EVM
        # Avalanche Data API provides endpoints for the latest information on avalanche NFTs.
        # @see https://developers.avacloud.io/data-api/nfts
        class Nfts
          class << self
            # Triggers reindexing of token metadata for an NFT token.
            # Reindexing can only be called once per hour for each NFT token.
            # @see https://developers.avacloud.io/data-api/nfts/reindex-nft-metadata
            # @param address [String]
            # @param token_id [String]
            # @return [Array<Hash{Symbol->Object}>]
            def reindexing_token(address = nil, token_id = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/nfts/collections/#{address}/tokens/#{token_id}:reindex")
            end

            # Lists tokens for an NFT contract.
            # @see https://developers.avacloud.io/data-api/nfts/list-tokens
            # @param address [String]
            # @return [Array<Hash{Symbol->Object}>]
            def tokens(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/nfts/collections/#{address}/tokens")
            end

            # Gets token details for a specific token of an NFT contract.
            # @see https://developers.avacloud.io/data-api/nfts/get-token-details
            # @param address [String]
            # @param token_id [String]
            # @return [Array<Hash{Symbol->Object}>]
            def token(address = nil, token_id = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/nfts/collections/#{address}/tokens/#{token_id}")
            end
          end
        end
      end
    end
  end
end
