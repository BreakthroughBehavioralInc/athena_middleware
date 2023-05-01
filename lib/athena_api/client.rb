require "oauth2"

module AthenaApi
  class Client
    attr_reader :config

    def initialize(config = {})
      @config = config
    end

    def self.active_client
      new(AthenaApi.config)
    end

    def connection
      @connection ||= OAuth2::Client.new(config.api_key, config.api_secret, token_url: token_url, raise_errors: false)
    end

    def token_connection
      @token_connection ||= connection.client_credentials.get_token(scope: "athena/service/Athenanet.MDP.*")
    end

    def token
      @token ||= token_connection.token
    end

    def token_url
       "#{config.base_url}/#{config.auth_path}"
    end
  end
end