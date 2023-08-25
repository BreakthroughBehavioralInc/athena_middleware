require "spec_helper"

RSpec.describe AthenaApi::Patients, vcr: { re_record_interval: 604800, record: :new_episodes } do

    let(:patient_id) { "54382" }


    describe '#crud' do
        context 'get' do
            it 'should retrieve the patient record' do
                response = AthenaApi::Patients.get(patient_id)
                expect(response.first['firstname']).to eql("Robert")
            end
        end

        context 'post' do
            it 'should post the patient record and be successful' do
                response = AthenaApi::Patients.post(patient_body)
                expect(response.first['patientid']).to_not be(nil)
            end
        end

        context 'update' do
            it 'should update the patient record and be successful' do
                response = AthenaApi::Patients.put(patient_id,patient_update)
                expect(response.first['patientid']).to_not be(nil)
            end
        end

        context 'get patient details' do
            it 'should get the patient details with patient id' do
                response = AthenaApi::Patients.get_patient_details(patient_id)
                expect(response.first['guarantorfirstname']).to eql("Robert")
            end
        end
        # need to create appointment
        context 'record payment' do
            xit 'should record the payment for the patient' do
                response = AthenaApi::Patients.record_payment(patient_id, patient_record_payment)
                # expect(response['first_name']).to eq "ROB"
            end
        end

        context 'update patient privacy information' do
            it 'update patient privacy information' do
                response = AthenaApi::Patients.update_patient_privacy_information(patient_id, update_patient_privacy_information)
                expect(response.first['success']).to eql true
            end
        end
    end











end