# frozen_string_literal: true

module Avalanche
  module AvaCloud
    # https://developers.avacloud.io/webhooks-api/overview
    class WebhookApi < AvaCloud::BaseApi
      BASE_URL_API = "https://glacier-api.avax.network"

      class << self
        # @return [Api]
        def instance
          @instance ||= new
        end
      end

      # Method to start a new Webhook API connection.
      # @return [Faraday::Connection]
      def initialize
        super(url_api: BASE_URL_API, require_auth: true)
      end
    end
  end
end
