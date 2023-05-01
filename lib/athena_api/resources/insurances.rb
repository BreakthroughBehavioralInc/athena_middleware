module AthenaApi
    class Insurances < Resource
        def self.resource_url
            "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}/patients"
        end

        def self.get(patient_id)
            execute_request(:get, "#{resource_url}/#{patient_id}/insurances")
        end

        def self.post(patient_id, params)
            execute_request(:post, "#{resource_url}/#{patient_id}/insurances", body_params: params)
        end

        def self.put(patient_id, params)
            execute_request(:put, "#{resource_url}/#{patient_id}/insurances", body_params: params)
        end

        def self.delete(patient_id, insurance_id)
            execute_request(:delete, "#{resource_url}/#{patient_id}/insurances/#{insurance_id}")
        end

        def self.get_deactivated_insurance(patient_id)
            execute_request(:get, "#{resource_url}/#{patient_id}/insurances?showcancelled=true")
        end

        def self.reactivate_insurance(patient_id, insurance_id)
            execute_request(:post, "#{resource_url}/#{patient_id}/insurances/#{insurance_id}/reactivate")
        end

        def self.get_insurance_packages
            execute_request(:get, "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}/misc/topinsurancepackages")
        end
    end
end