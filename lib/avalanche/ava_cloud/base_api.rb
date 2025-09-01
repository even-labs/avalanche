# frozen_string_literal: true

require "faraday"
require "faraday/retry"

module Avalanche
  module AvaCloud
    # Base API class to connect with Data, Metrics and WebHook AvaCloud API.
    class BaseApi
      # Method to start a new Api connection.
      # @param url_api [String]
      # @param require_auth [Boolean]
      # @return [Faraday::Connection]
      def initialize(url_api:, require_auth: true)
        @base_url_api = url_api
        @require_auth = require_auth
        @connection = Faraday.new(url: base_url_api) do |c|
          c.request :json
          c.response :json
          c.use Faraday::Retry::Middleware
          c.adapter Faraday.default_adapter
          c.headers = headers
        end
      end

      # Method to make GET request.
      # @param path [String]
      # @param params [Hash{Symbol->Object}]
      # @return [Hash{Symbol->Object}]
      def get(path, params = {})
        handle_response do
          @connection.get(path, params)
        end
      end

      # Method to make POST request.
      # @param path [String]
      # @param body [Hash{Symbol->Object}]
      # @return [Hash{Symbol->Object}]
      def post(path, body = {})
        handle_response do
          @connection.post(path, body)
        end
      end

      # Method to make PUT request.
      # @param path [String]
      # @param body [Hash{Symbol->Object}]
      # @return [Hash{Symbol->Object}]
      def put(path, body = {})
        handle_response do
          @connection.put(path, body)
        end
      end

      private

      attr_reader :base_url_api, :require_auth

      # Method to set Http headers.
      # @return [Hash{Symbol->Object}]
      def headers
        {
          "x-glacier-api-key" => require_auth ? Avalanche::AvaCloud.config.api_key : nil,
          "Content-Type" => "application/json"
        }
      end

      # Method to handle API response(body, status, code).
      # @return [Hash{Symbol->Object}]
      def handle_response # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        response = yield
        case response.status
        when 200..299
          response.body
        when 400
          raise Avalanche::AvaCloud::BadRequestError.new(response.status, response.body)
        when 401
          raise Avalanche::AvaCloud::UnauthorizedError.new(response.status, response.body)
        when 404
          raise Avalanche::AvaCloud::NotFoundError.new(response.status, response.body)
        when 500..599
          raise Avalanche::AvaCloud::ServerError.new(response.status, response.body)
        else
          raise Avalanche::AvaCloud::APIError.new(response.status, response.body)
        end
      rescue Faraday::Error => e
        raise Avalanche::AvaCloud::Error, "Network error: #{e.message}"
      end
    end
  end
end
