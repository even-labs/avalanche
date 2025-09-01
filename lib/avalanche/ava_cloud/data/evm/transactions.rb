# frozen_string_literal: true

module Avalanche
  module AvaCloud
    module Data
      module EVM
        # Avalanche Data API provides endpoints for the latest information on avalanche transactions.
        # @see https://developers.avacloud.io/data-api/evm-transactions
        class Transactions
          class << self
            # If the address is a smart contract, returns the transaction in which it was deployed.
            # @see https://developers.avacloud.io/data-api/evm-transactions/get-deployment-transaction
            # @return [Array<Hash{Symbol->Object}>]
            def deployment_transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/contracts/#{address}/transactions:getDeployment")
            end

            # Lists all contracts deployed by the given address.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-deployed-contracts
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def contract_deployment_transactions(address = nil)
              DataApi.instance.get("v1/chains/#{Avalanche::AvaCloud.config.chain_id}/contracts/#{address}/deployments")
            end

            # Returns a list of transactions where the given wallet address had an on-chain interaction
            # for the given chain. The ERC-20 transfers, ERC-721 transfers, ERC-1155, and internal transactions returned
            # are only those where the input address had an interaction. Specifically, those lists only include entries
            # where the input address was the sender (from field) or the receiver (to field) for the sub-transaction.
            # Therefore the transactions returned from this list may not be complete representations of the on-chain
            # data. For a complete view of a transaction use the
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-transactions
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}/transactions")
            end

            # Lists native transactions for an address.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-native-transactions
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def native_transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}/transactions:listNative")
            end

            # Lists ERC-20 transfers for an address.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-erc-20-transfers
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def erc20_transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}transactions:listErc20")
            end

            # Lists ERC-721 transfers for an address.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-erc-721-transfers
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def erc721_transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}transactions:listErc721")
            end

            # Lists ERC-1155 transfers for an address.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-erc-1155-transfers
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def erc1155_transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}transactions:listErc1155")
            end

            # Returns a list of internal transactions for an address and chain. Filterable by block range.
            # Note that the internal transactions list only contains CALL or CALLCODE transactions with a non-zero value
            # and CREATE/CREATE2/CREATE3 transactions. To get a complete list of internal transactions use the
            # debug_ prefixed RPC methods on an archive node.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-internal-transactions
            # @param address [String]
            # @return [Hash{Symbol->Object}]
            def internal_transactions(address = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/addresses/#{address}transactions:listInternals")
            end

            # Gets the details of a single transaction.
            # @see https://developers.avacloud.io/data-api/evm-transactions/get-transaction
            # @param tx_hash [String]
            # @return [Hash{Symbol->Object}]
            def transaction(tx_hash = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/transactions/#{tx_hash}")
            end

            # Lists the transactions that occurred in a given block.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-transactions-for-a-block
            # @param block_id [String]
            # @return [Hash{Symbol->Object}]
            def block_transaction(block_id = nil)
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/blocks/#{block_id}/transactions")
            end

            # Lists the latest transactions.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-latest-transactions
            # @return [Hash{Symbol->Object}]
            def latest_transactions
              DataApi.instance.get("/v1/chains/#{Avalanche::AvaCloud.config.chain_id}/transactions")
            end

            # Lists the most recent transactions from all supported EVM-compatible chains.
            # The results can be filtered based on transaction status.
            # @see https://developers.avacloud.io/data-api/evm-transactions/list-the-latest-transactions-across-all-supported-evm-chains
            # @return [Hash{Symbol->Object}]
            def evms_latest_transactions
              DataApi.instance.get("/v1/transactions")
            end
          end
        end
      end
    end
  end
end
