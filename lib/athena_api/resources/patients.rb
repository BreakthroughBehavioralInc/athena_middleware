module AthenaApi
    class Patients < Resource
      extend AthenaApi::Crud::Get
      extend AthenaApi::Crud::Post
      extend AthenaApi::Crud::Put

      def self.get_patient_details(patient_id)
        execute_request(:get, "#{resource_url}/#{patient_id}?showallclaims=true&showbalancedetails=true")
      end

      def self.record_payment(patient_id, params = {})
        execute_request(:post, "#{resource_url}/#{patient_id}/recordpayment", body_params: params)
      end

      def self.update_patient_privacy_information(patient_id, params = {})
        execute_request(:post, "#{resource_url}/#{patient_id}/privacyinformationverified", body_params: params)
      end

      def self.update_custom_fields(patient_id, params = {})
        execute_request(:post, "#{resource_url}/#{patient_id}/customfields", body_params: params)
      end

      def self.search()
        execute_request(:get, "#{resource_url}/search")
      end
    end
end