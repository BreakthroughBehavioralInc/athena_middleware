module AthenaApi
  class Providers < Resource
  	extend AthenaApi::Crud::Post

  	def self.get_provider_types
      execute_request(:get, "#{resource_url}/providertypes").parsed
    end

    def self.get_providers(params)
      execute_request(:get, "#{resource_url}?#{params.to_query}").parsed
    end

    def self.get_provider(id)
      execute_request(:get, "#{resource_url}/#{id}").parsed
    end

    def self.update_provider(provider_data, id)
      execute_request(:put, "#{resource_url}/#{id}", body_params: provider_data).parsed
    end
  end
end