module AthenaApi
  class Providers < Resource
  	def self.get_provider_types
      execute_request(:get, "#{resource_url}/providertypes").parsed
    end

    def self.get_providers(params)
      execute_request(:get, "#{resource_url}/providers?#{params.to_query}").parsed
    end

    def self.get_provider(id)
      execute_request(:get, "#{resource_url}/providers/#{id}").parsed
    end

    def self.update_provider(provider_data, id)
      execute_request(:put, "#{resource_url}/providers/#{id}", body_params: provider_data).parsed
    end

    def self.create_provider(provider_data)
      execute_request(:post, "#{resource_url}/providers", body_params: provider_data).parsed
    end
  end
end