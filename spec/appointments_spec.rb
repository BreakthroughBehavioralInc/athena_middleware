require "spec_helper"

RSpec.describe AthenaApi::Appointments, vcr: { re_record_interval: 604800 }  do

	let(:appointment_id) {"1251819"}
	let(:query_param)  do { departmentid: 1 } end
	let(:open_appointment_query_params) do {departmentid: 1, reasonid: -1} end
	let(:appointment_response) {"The appointment ID is already booked or is not marked as being available to be scheduled via the API."}

	describe 'Appointments APIs' do
		context 'post' do
			it 'should open appointment' do
				response = AthenaApi::Appointments.create_appointment_slot(query_param, appointment_open)
				expect(response["appointmentids"]).to_not be(nil)
			end
		end

		context 'get' do
			it 'should get all open appointment slots' do
				response = AthenaApi::Appointments.get_open_appointments(open_appointment_query_params)
				expect(response.totalcount).to_not be(nil)
			end
		end

		context 'put' do
			it 'should show the appointment is booked' do
				response = AthenaApi::Appointments.book_appointment(appointment_id, patient_data)
        expect(response.detailedmessage).to eq(appointment_response)
			end
		end
	end
end