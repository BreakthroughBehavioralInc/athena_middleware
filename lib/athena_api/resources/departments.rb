module AthenaApi
    class Departments < Resource
      
      def self.get_departments()
        execute_request(:get, resource_url)
      end
    end
end