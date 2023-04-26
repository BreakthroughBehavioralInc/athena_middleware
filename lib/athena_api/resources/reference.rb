module AthenaApi
    class Reference < Resource
      def self.get_provider_specialties
        execute_request(:get, "#{resource_url}/providerspecialties")
      end

      def self.get_provider_types
        execute_request(:get, "#{resource_url}/providertypes")
      end
    end
end
