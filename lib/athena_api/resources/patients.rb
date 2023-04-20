module AthenaApi
    class Patients < Resource
      extend AthenaApi::Crud::Get
      extend AthenaApi::Crud::Post
      extend AthenaApi::Crud::Put

      def self.get_patient_details(id)
        execute_request(:get, "#{resource_url}/#{id}?showallclaims=true&showbalancedetails=true").parsed
      end

      def self.record_payment(id, params = {})
        execute_request(:post, "#{resource_url}/#{id}/recordpayment", body_params: params).parsed
      end

      def self.update_patient_privacy_information(id, params = {})
        execute_request(:post, "#{resource_url}/#{id}/privacyinformationverified", body_params: params).parsed
      end
    end
end