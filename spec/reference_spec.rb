require "spec_helper"


RSpec.describe AthenaApi::Reference, vcr: { re_record_interval: 604800, record: :new_episodes } do
    
    describe 'references' do
        context 'get' do
            it 'should retrieve provider specialties' do
                response = AthenaApi::Reference.get_provider_specialties()
                expect(response).to_not be(nil)
            end

            it 'should retrieve provider types' do
                response = AthenaApi::Reference.get_provider_types()
                expect(response).to_not be(nil)
            end
        end
    end 
end