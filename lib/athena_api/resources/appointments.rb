module AthenaApi
  class Appointments < Resource

  	def self.get_open_appointments(params)
      execute_request(:get, "#{resource_url}/open", params: params)
    end
    
    def self.create_appointment_slot(params, appointment_data)
      execute_request(:post, "#{resource_url}/open", params: params, body_params: appointment_data)
    end

    def self.patient_appointment_reasons(params)
      execute_request(:get, "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}/patientappointmentreasons", params: params)
    end

    def self.patient_appointment_reasons(params)
      execute_request(:get, "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}/patientappointmentreasons", params: params)
    end

    def self.book_appointment(appointment_id, patient_data)
      execute_request(:put, "#{resource_url}/#{appointment_id}", body_params: patient_data)
    end
  end
end
