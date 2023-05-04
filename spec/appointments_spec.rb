require "spec_helper"

RSpec.describe AthenaApi::Appointments do

	let(:appointment_id) {"123"}
	let(:query_param)  do { departmentid: 1 } end
	let(:open_appointment_query_params) do {departmentid: 1, reasonid: -1} end
	let(:appointment_data) do
		{
			'key': 'value1',
			'key2': 'value2'
		}
	end

	describe 'Appointments APIs' do
		context 'post' do
			it 'should open appointment' do
				response = AthenaApi::Appointments.create_appointment_slot(query_param, appointment_open)
				expect(response["appointmentids"]).to_not be(nil)
				# response["appointmentids"].first.first will give you a appointment_id -- you can delete this comment lol
			end
		end

		context 'get' do
			it 'should get all open appointment slots' do
				response = AthenaApi::Appointments.get_open_appointments(open_appointment_query_params)
				expect(response.totalcount).to_not be(nil)
				# response["appointmentids"].first.first will give you a appointment_id -- you can delete this comment lol
			end
		end

		context 'put' do
			xit 'shoud call put appointments' do
				response = AthenaApi::Appointments.put(appointment_id, appointment_data)
			end
		end
	end
end