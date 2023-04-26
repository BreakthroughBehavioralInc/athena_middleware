module AthenaApi
  class Reference < Resource
    extend AthenaApi::Crud::Get
    def self.get_specialties
      execute_request(:get, "#{resource_url}/providerspecialties").parsed
    end
  end
end
