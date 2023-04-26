module AthenaApi
    module Crud
      module Put
        def put(params = {})
          execute_request(:post, resource_url, body_params: params)
        end
      end
    end
end