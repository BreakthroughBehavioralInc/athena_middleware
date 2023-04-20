module AthenaApi
    class Insurances < Resource
        extend AthenaApi::Crud::Get
        extend AthenaApi::Crud::Post
        extend AthenaApi::Crud::Put
        extend AthenaApi::Crud::Delete

        def self.resource_url
            "#{client.config.base_url}/#{client.config.version_string}/#{client.config.practice_id}/patients"
        end

        def self.get(id)
            execute_request(:get, "#{resource_url}/#{id}/insurances").parsed
        end

        def self.post(id, params)
            execute_request(:post, "#{resource_url}/#{id}/insurances", body_params: params).parsed
        end

        def self.put(id, params)
            execute_request(:put, "#{resource_url}/#{id}/insurances", body_params: params).parsed
        end

        def self.delete(id, insurance_id)
            execute_request(:delete, "#{resource_url}/#{id}/insurances/#{insurance_id}", body_params: params).parsed
        end

        def self.get_deactivated_insurance(id)
            execute_request(:get, "#{resource_url}/#{id}/insurances?showcancelled=true").parsed
        end

        def self.reactivate_insurance(id, insurance_id)
            execute_request(:post, "#{resource_url}/#{id}/insurances/#{insurance_id}/reactivate", body_params: params).parsed
        end
    end
end