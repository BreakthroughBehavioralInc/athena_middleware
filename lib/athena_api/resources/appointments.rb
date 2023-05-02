module AthenaApi
  class Appointments < Resource
    extend AthenaApi::Crud::Put

  	 def self.open_appointment(appointment_data)
      execute_request(:post, "#{resource_url}/open", body_params: appointment_data)
    end

    def self.patient_appointment_reasons(params)
      execute_request(:get, "#{client.config.base_url}/#{url_version}/#{client.config.practice_id}/patientappointmentreasons", params: params)
    end

    def self.create_claim_for_appointment(appointment_id, params)
      execute_request(:post, "#{resource_url}/#{appointment_id}/claim", body_params: params)
    end

    def self.bind_insurance_for_beacon(appointment_id,insurance_id)
      execute_request(:put, "#{resource_url}/#{appointment_id}/insurances", params: {primaryinsuranceid: insurance_id})
    end

    def self.check_in_appointment(appointment_id)
      execute_request(:post, "#{resource_url}/#{appointment_id}/checkin")
    end
  end
end
