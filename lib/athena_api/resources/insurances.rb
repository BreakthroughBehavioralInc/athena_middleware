module AthenaApi
    class Insurances < Resource
        extend AthenaApi::Crud::Get
        extend AthenaApi::Crud::Post
        extend AthenaApi::Crud::Put
        extend AthenaApi::Crud::Delete

        def self.resource_url
            "#{client.config.base_url}/#{client.config.version_string}/#{client.config.practice_id}/patients"
        end

        def self.get(patient_id)
            execute_request(:get, "#{resource_url}/#{patient_id}/insurances").parsed
        end

        def self.post(patient_id, params)
            execute_request(:post, "#{resource_url}/#{patient_id}/insurances", body_params: params).parsed
        end

        def self.put(patient_id, params)
            execute_request(:put, "#{resource_url}/#{patient_id}/insurances", body_params: params).parsed
        end

        def self.delete(patient_id, insurance_id)
            execute_request(:delete, "#{resource_url}/#{patient_id}/insurances/#{insurance_id}", body_params: params).parsed
        end

        def self.get_deactivated_insurance(patient_id)
            execute_request(:get, "#{resource_url}/#{patient_id}/insurances?showcancelled=true").parsed
        end

        def self.reactivate_insurance(patient_id, insurance_id)
            execute_request(:post, "#{resource_url}/#{patient_id}/insurances/#{insurance_id}/reactivate", body_params: params).parsed
        end
    end
end