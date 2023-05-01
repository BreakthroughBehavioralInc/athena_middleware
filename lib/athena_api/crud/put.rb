module AthenaApi
    module Crud
      module Put
        def put(id, params = {})
          execute_request(:put, "#{resource_url}/#{id}", body_params: params)
        end
      end
    end
end