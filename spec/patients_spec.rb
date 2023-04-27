require "spec_helper"

RSpec.describe AthenaApi::Patients do

    let(:patient_id) { "123" }


    describe '#crud' do
        context 'get' do
            xit 'should retrieve the patient record' do
                response = AthenaApi::Patients.get(patient_id)
                expect (response.first.is_a?(AthenaApi::Patients))
            end
        end

        context 'post' do
            xit 'should post the patient record and be successful' do
                response = AthenaApi::Patients.post(patient_body)
                expect(response['first_name']).to eq "rob"
            end
        end

        context 'update' do
            xit 'should update the patient record and be successful' do
                response = AthenaApi::Patients.put(patient_id,patient_update)
                expect(response['first_name']).to eq "ROB"
            end
        end

        context 'get patient details' do
            xit 'should get the patient details with patient id' do
                response = AthenaApi::Patients.get_patient_details(patient_id)
                # expect(response['first_name']).to eq "ROB"
            end
        end

        context 'record payment' do
            xit 'should record the payment for the patient' do
                response = AthenaApi::Patients.record_payment(patient_id, patient_record_payment)
                # expect(response['first_name']).to eq "ROB"
            end
        end

        context 'update patient privacy information' do
            xit 'update patient privacy information' do
                response = AthenaApi::Patients.update_patient_privacy_information(patient_id, update_patient_privacy_information)
                # expect(response['first_name']).to eq "ROB"
            end
        end
    end











end