require "spec_helper"

RSpec.describe AthenaApi::Appointments, vcr: { re_record_interval: 604800 }  do

	let(:appointment_id) {"1251819"}
	let (:insurance_id) {"24840"}
	let(:query_param)  do { departmentid: 1 } end
	let(:open_appointment_query_params) do {departmentid: 1, reasonid: -1} end
	let(:appointment_reason_params) do {providerid: 3, departmentid: 1} end
	let(:appointment_response) {"The appointment ID is already booked or is not marked as being available to be scheduled via the API."}
	let(:appointment_checkin_response) {"The appointment is either already canceled or checked in."}
	describe 'Appointments APIs' do
		context 'post' do
			it 'should open appointment' do
				response = AthenaApi::Appointments.create_appointment_slot(query_param, appointment_open)
				expect(response["appointmentids"]).to_not be(nil)
			end

			it 'should show appointment has already been checked in' do
				response = AthenaApi::Appointments.check_in_appointment(appointment_id)
				expect(response.detailedmessage).to eq(appointment_checkin_response)
			end

			xit 'should create claim for appointemtn' do
				response = AthenaApi::Appointments.create_claim_for_appointment(create_claim)
				# expect(response.detailedmessage).to eq()
			end
		end

		context 'get' do
			it 'should get all open appointment slots' do
				response = AthenaApi::Appointments.get_open_appointments(open_appointment_query_params)
				expect(response.totalcount).to_not be(nil)
			end

			it 'should get all appointment reasons for provider' do
				response = AthenaApi::Appointments.patient_appointment_reasons(appointment_reason_params)
				expect(response.totalcount).to_not be(0)
			end
		end

		context 'put' do
			it 'should show the appointment is booked' do
				response = AthenaApi::Appointments.book_appointment(appointment_id, patient_data)
        		expect(response.detailedmessage).to eq(appointment_response)
			end

			it 'should not bind insurance for non booked appointments' do
				response = AthenaApi::Appointments.bind_insurance_for_beacon(appointment_id, insurance_id)
        		expect(response.error).to eq("Appointment ID is not a booked appointment")
			end
		end
	end
end