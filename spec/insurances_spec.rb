require "spec_helper"


RSpec.describe AthenaApi::Insurances do

    let(:patient_id) { "123" }
    let(:insurance_id) { "123" }


    describe '#crud' do
        context 'get' do
            xit 'should retrieve the patient insurance' do
                response = AthenaApi::Insurances.get(patient_id)
                expect (response.first.is_a?(AthenaApi::Insurances))
            end
        end

        context 'post' do
            xit 'should create the patient insurance' do
                response = AthenaApi::Insurances.post(patient_id,insurance_body)
            end
        end

        context 'update' do
            xit 'should update the patient insurance' do
                response = AthenaApi::Insurances.put(patient_id,insurance_update)
            end
        end

        context 'delete' do
            xit 'should delete the patient insurance' do
                response = AthenaApi::Insurances.delete(patient_id,insurance_id)
            end
        end

        context 'get deactivated insurance' do
            xit 'should show deactivated the patient insurance' do
                response = AthenaApi::Insurances.get_deactivated_insurance(patient_id)
            end
        end

        context 'get deactivated insurance' do
            xit 'should show deactivated the patient insurance' do
                response = AthenaApi::Insurances.reactivate_insurance(patient_id,insurance_id)
            end
        end
    end

end