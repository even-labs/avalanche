# frozen_string_literal: true

module Avalanche
  module AvaCloud
    # https://developers.avacloud.io/metrics-api/overview
    class MetricsApi < AvaCloud::BaseApi
      BASE_URL_API = "https://metrics.avax.network"

      class << self
        # @return [Api]
        def instance
          @instance ||= new
        end
      end

      # Method to start a new Metric API connection.
      # @return [Faraday::Connection]
      def initialize
        super(url_api: BASE_URL_API, require_auth: false)
      end
    end
  end
end
