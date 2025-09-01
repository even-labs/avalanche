# frozen_string_literal: true

module Avalanche
  module AvaCloud
    class Webhooks
      # Avalanche Data API provides endpoints for the latest information on avalanche webhook.
      # @see https://developers.avacloud.io/webhooks-api/webhooks
      class Webhook
        class << self
          # Lists webhooks for the user.
          # @see https://developers.avacloud.io/webhooks-api/webhooks/list-webhooks
          # @return [Array<Hash{Symbol->Object}>]
          def lists
            WebhookApi.instance.get("/v1/webhooks")
          end

          # Lists webhooks for the user.
          # @see https://developers.avacloud.io/webhooks-api/webhooks/create-a-webhook
          # @return [Array<Hash{Symbol->Object}>]
          def create(params)
            WebhookApi.instance.post("/v1/webhooks", params)
          end

          # Retrieves a webhook by ID.
          # @see https://developers.avacloud.io/webhooks-api/webhooks/get-a-webhook-by-id
          # @return [Array<Hash{Symbol->Object}>]
          def retrieve(id = nil)
            WebhookApi.instance.post("/v1/webhooks/#{id}")
          end
        end
      end
    end
  end
end
