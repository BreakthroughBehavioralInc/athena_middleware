module AthenaApi
  class Appointments < Resource
    extend AthenaApi::Crud::Put

  	 def self.open_appointment(appointment_data)
      execute_request(:post, "#{resource_url}/open", body_params: appointment_data)
    end
  end
end
