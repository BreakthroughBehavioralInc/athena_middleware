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

  autoload :Patients, "athena_api/resources/patients"
  autoload :Departments, "athena_api/resources/departments"
  autoload :Reference, "athena_api/resources/reference"
  autoload :Insurances, "athena_api/resources/insurances"
  autoload :Providers, "athena_api/resources/providers"
  autoload :Appointments, "athena_api/resources/appointments"
  autoload :Claims, "athena_api/resources/claims"

  @config = AthenaApi::Config.new

  class << self
    attr_reader :config

    extend Forwardable

    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :api_secret, :api_secret=
    def_delegators :@config, :base_url, :base_url=
    def_delegators :@config, :auth_path, :auth_path=
    def_delegators :@config, :version_string, :version_string=
    def_delegators :@config, :practice_id, :practice_id=
    def_delegators :@config, :debug, :debug=
  end
end