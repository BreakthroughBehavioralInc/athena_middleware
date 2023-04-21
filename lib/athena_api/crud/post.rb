module AthenaApi
    module Crud
      module Post
        def post(params = {})
          execute_request(:post, resource_url, body_params: params)
        end
      end
    end
end