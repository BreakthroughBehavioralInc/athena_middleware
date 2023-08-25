module AthenaApi
  class Providers < Resource
    extend AthenaApi::Crud::Get
    extend AthenaApi::Crud::Put

    def self.get_providers(params)
      execute_request(:get, "#{resource_url}", params: params)
    end
  end
end