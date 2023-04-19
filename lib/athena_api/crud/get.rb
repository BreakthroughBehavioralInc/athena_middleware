module AthenaApi
    module Crud
      module Get
        def get(id)
          execute_request(:get, "#{resource_url}/#{id}").parsed
        end
      end
    end
end