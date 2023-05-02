require "spec_helper"

RSpec.describe AthenaApi::Appointments do

	let(:appointment_id) {"123"}
	let(:appointment_data) do
		{
			'key': 'value1',
			'key2': 'value2'
		}
	end

	describe 'Appointments APIs' do
		context 'post' do
			xit 'should open appointment' do
				response = AthenaApi::Appointments.open_appointment(appointment_data)
			end
		end

		context 'put' do
			xit 'shoud call put appointments' do
				response = AthenaApi::Appointments.put(appointment_id, appointment_data)
			end
		end
	end
end