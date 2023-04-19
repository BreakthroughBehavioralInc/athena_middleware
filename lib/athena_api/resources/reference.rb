module AthenaApi
    class Reference < Resource
      extend AthenaApi::Crud::Get

      def self.get_specialties
        execute_request(:get, "#{resource_url}/providerspecialties").parsed
      end

      def self.get_provider_types
        execute_request(:get, "#{resource_url}/providertypes").parsed
      end
    end
end