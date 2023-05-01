require "spec_helper"


RSpec.describe AthenaApi::Insurances, vcr: { re_record_interval: 604800 } do

    let(:patient_id) { "54382" }
    let (:reactivate_insurance_id) {"24840"}


    describe '#crud' do
        context 'post' do
            xit 'should create the patient insurance' do
                response = AthenaApi::Insurances.post(patient_id,insurance_body)
                expect(response.first["insurancepolicyholderfirstname"]).to eql "ROB"
            end
        end

        context 'update' do
            xit 'should update the patient insurance' do
                response = AthenaApi::Insurances.put(patient_id,insurance_update)
                expect(response.first["success"]).to eql true
            end
        end

        context 'get and delete' do
            xit 'should retrieve the patient insurance and delete the insurance' do
                response = AthenaApi::Insurances.get(patient_id)
                expect(response.first["insurancepolicyholderfirstname"]).to eql "ROBERT"
                insurance_id = response.first["insuranceid"]
                response2 = AthenaApi::Insurances.delete(patient_id,insurance_id)
                expect(response.first["success"]).to eql true
            end
        end

        context 'get deactivated insurance' do
            xit 'should show deactivated the patient insurance' do
                response = AthenaApi::Insurances.get_deactivated_insurance(patient_id)
                expect(response.first).to_not be(nil)
            end
        end

        context 'get deactivated insurance' do
            xit 'should show deactivated the patient insurance' do
                response = AthenaApi::Insurances.reactivate_insurance(patient_id,reactivate_insurance_id)
                expect(response.first["success"]).to eql true
            end
        end
    end

end