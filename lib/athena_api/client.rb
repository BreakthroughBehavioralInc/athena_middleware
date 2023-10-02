require "oauth2"
require "singleton"

module AthenaApi
  class Client
    BUFFER = 120

  include Singleton

    attr_reader :config

    def initialize
      @config = AthenaApi.config
    end

    def connection
      @connection ||= OAuth2::Client.new(config.api_key, config.api_secret, token_url: token_url, raise_errors: false)
    end

    def token_connection
      get_token if @token_connection.nil? || token_about_to_expire?
      @token_connection
    end

    def token
      @token ||= token_connection.token
    end

    def token_url
       "#{config.base_url}/#{config.auth_path}"
    end

    def get_token
      @token_connection = connection.client_credentials.get_token(scope: "athena/service/Athenanet.MDP.*")
      @token_expiration_time = Time.now + @token_connection.expires_in
      @token_connection
    end

    def token_about_to_expire?
      Time.now + BUFFER > token_expiration_time
    end

    def token_expiration_time
      @token_expiration_time ||= Time.now + @token_connection.expires_in
    end
  end
end