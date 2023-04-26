module AthenaApi
  class Providers < Resource
    extend AthenaApi::Crud::Get
  	extend AthenaApi::Crud::Post
    extend AthenaApi::Crud::Put

  	def self.get_provider_types
      execute_request(:get, "#{resource_url}/providertypes")
    end

    def self.get_providers(params)
      execute_request(:get, "#{resource_url}?#{params.to_query}")
    end
  end
end