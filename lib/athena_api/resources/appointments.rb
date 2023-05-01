module AthenaApi
  class Appointments < Resource
    extend AthenaApi::Crud::Put

  	 def self.open_appointment(appointment_data)
      execute_request(:post, "#{resource_url}/open", body_params: appointment_data)
    end

    def self.patient_appointment_reasons(params)
      execute_request(:get, "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}/patientappointmentreasons", params: params)
    end
  end
end
