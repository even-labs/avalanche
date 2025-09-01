# frozen_string_literal: true

require "dry-configurable"

# Base ava cloud lib class
require_relative "ava_cloud/version"
require_relative "ava_cloud/errors"
require_relative "ava_cloud/base_api"

# AvaCloud Data API
require_relative "ava_cloud/data_api"
require_relative "ava_cloud/data/evm/balances"
require_relative "ava_cloud/data/evm/blocks"
require_relative "ava_cloud/data/evm/chains"
require_relative "ava_cloud/data/evm/contracts"
require_relative "ava_cloud/data/evm/nfts"
require_relative "ava_cloud/data/evm/transactions"

# AvaCloud Metrics API
require_relative "ava_cloud/metrics_api"
require_relative "ava_cloud/metrics/chains"

# AvaCloud Webhook API
require_relative "ava_cloud/webhook_api"
require_relative "ava_cloud/webhooks/webhooks"

module Avalanche
  # @example Configure AvaCloud
  # Avalanche::AvaCloud.configure do |config|
  #   config.api_key = "your_api_key"
  #   config.network = "mainet"
  #   config.chain_id = "5207418"
  # end
  module AvaCloud
    extend Dry::Configurable

    setting :api_key, default: nil
    setting :network, default: nil
    setting :chain_id, default: nil
  end
end
