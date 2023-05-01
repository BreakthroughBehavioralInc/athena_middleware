require "spec_helper"


RSpec.describe AthenaApi::Departments, vcr: { re_record_interval: 604800 } do
    
    describe 'get department' do
        context 'get' do
            it 'should retrieve the patient insurance' do
                response = AthenaApi::Departments.get_departments
                expect(response).to_not be(nil)
            end
        end
    end 
end