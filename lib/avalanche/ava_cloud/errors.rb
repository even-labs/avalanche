# frozen_string_literal: true

module Avalanche
  module AvaCloud
    # Standard error class.
    class Error < StandardError; end

    # Configuration error class.
    class ConfigurationError < Error; end

    # Missing Configuration error class.
    class MissingConfigurationError < ConfigurationError; end

    # API errors.
    class APIError < Error
      attr_reader :status, :body

      # @param status [Integer]
      # @param body [Hash{Symbol-Object}]
      # @return [self]
      def initialize(status, body)
        @status = status
        @body = body
        super("API Error: #{status} - #{body}")
      end
    end

    # Authentication errors.
    class AuthenticationError < APIError; end

    # Not found errors.
    class NotFoundError < APIError; end

    # Server errors.
    class ServerError < APIError; end

    # Bad Request errors.
    class BadRequestError < APIError; end

    # Unauthorized errors.
    class UnauthorizedError < APIError; end
  end
end
