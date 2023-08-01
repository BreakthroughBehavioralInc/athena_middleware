module AthenaApi
    class Misc < Resource
        def self.resource_url
            "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}"
        end

        def self.top_insurance_packagees
            execute_request(:get, "#{resource_url}/misc/topinsurancepackages")
        end
    end
end