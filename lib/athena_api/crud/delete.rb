module AthenaApi
    module Crud
      module Delete
        def delete(params = {})
          execute_request(:post, resource_url, body_params: params)
        end
      end
    end
end