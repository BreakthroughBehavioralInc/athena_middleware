# Ruby bindings
require "forwardable"

# Version
require "athena_api/version"

require "athena_api/crud/delete"
require "athena_api/crud/post"
require "athena_api/crud/get"
require "athena_api/crud/put"

require "athena_api/config"

module AthenaApi
  autoload :Client, "athena_api/client"
  autoload :Object, "athena_api/object"
  autoload :Resource, "athena_api/resource"

  @config = AthenaApi::Config.new

  class << self
    attr_reader :config

    extend Forwardable

    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :api_secret, :api_secret=
    def_delegators :@config, :base_url, :base_url=
  end
end