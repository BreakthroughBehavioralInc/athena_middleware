module AthenaApi
  class Claims < Resource

  	 def self.open_appointment(appointment_data)
      execute_request(:post, "#{resource_url}/open", body_params: appointment_data).parsed
    end

     def self.appointment_to_patient(data, appointment_id)
      execute_request(:put, "#{resource_url}/#{appointment_id}", body_params: data).parsed
    end
  end
end
